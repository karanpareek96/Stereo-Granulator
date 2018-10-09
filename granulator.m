%       Name: Karan Pareek
%       Student ID: kp2218
% This function is the main granulation engine that takes in various
% input audio and grain parameters for processing. 
% INPUTS: Name of Audio File, Number of Grains, Grain Output (secs), Max 
%         Grain Length (secs), Min Grain Length (secs), Read Sequence, 
%         Window Type, Slope of Window, Amplitude Envelope,EQ Type (LP/HP), 
%         Convolution Type (Chorus/Delay)
% OUTPUT: Processed Granulated Output (y)

function Y = granulator (audioFile,grainNumber,lenOut,grainMax,...
                         grainMin,readSeq,winType,slope,ampEnv,...
                         EQ,convType)

%% Error Checking

if ~ischar(audioFile)
    error('Invalid audio input name');
elseif grainNumber < 0
    error('Invalid Grain number');
elseif lenOut < 1 
    error('Invalid output length');
elseif grainMax < 0 || grainMin < 0
    error('Invalid Max & Min parameters');
elseif grainMin >= grainMax
    error('Invalid Max & Min parameters');
elseif slope < 0
    error('Invalid Slope parameter');
elseif lenOut <= grainMax
    error('Grain size cannot exceed the output length');
end

%% Audio File and Output Length

% Reading the audio file into the function
[x,fs1] = audioread(audioFile);

% Forcing a stereo conversion if audio file is mono
if size(x,2) > 1
    x = mean(x,2);
end

% After defining a variable for the length of the input audio file, we take
% the 'lenOut' value as provided by the user and convert it to samples

len_x = length(x);% Length of input signal

lenOut = round(lenOut*fs1); % Convert length of output to samples

% Creating a matrix of zeros to which the processed grains will be added.
% The length of this matrix (in samples) is the length of the output as 
% stated by the user (in secs)
resultVec =  zeros(1,lenOut);

%% Grain Parameters

% Defining the max and min length of the sound grains and converting them
% into samples. Further, the grain length is defined by the existing grain
% parameters defined by the user. It should be noted that all the given
% grain values are in samples, even though the user will state their
% respective lengths in seconds.

grainMax = fs1*grainMax;
grainMin = fs1*grainMin;
grainLength = grainMin + round((grainMax-grainMin)*rand(1,grainNumber));

%% Playback Parameters

% Next, we define the order in which the grains will be read for sequence
% of playback. We denote the progression of grains by using the 'linspace'
% function that goes from 'a' to 'b' within a space of 'c' elements. Here, 
% the interval is defined by the number of grains i.e. 'grainNumber'.

if strcmp(readSeq,'Random')
    startSample = len_x * rand(1,grainNumber); % Random
elseif strcmp(readSeq,'Sequential')
    startSample = linspace(1,len_x,grainNumber);% Sequential
elseif strcmp(readSeq,'Backwards')
    startSample = linspace(len_x,1,grainNumber);% Reverse
end

% The point from where the function will read the sound grains
startSample = round(startSample); 

% Now that we have defined all our grain parameters, we can now determine
% the amplitude at which the playback will occur. This can either be
% random, smooth(Kaiser window), increasing or decreasing.

if strcmp(ampEnv,'Random')
    ampEnv = rand(1,grainNumber);% Random Amplitude Coefficient
elseif strcmp(ampEnv,'Smooth')
    ampEnv = window(@kaiser,grainNumber,3);% Kaiser Window Amplitude Coefficient
elseif strcmp(ampEnv,'Crescendo')
    ampEnv = linspace(0,1,grainNumber);% Crescendo (Increasing Amplitude)
elseif strcmp(ampEnv,'Decrescendo')
    ampEnv = linspace(1,0,grainNumber);% Decrescendo (Decreasing Amplitude)
end

%% Granulation Index

% Given that we have defined all the required grain parameters including 
% playback and amplitude coefficients, we can now specify the index values 
% at which the granulation will start and end. Similar to convolution, we 
% will define the starting index and ending index of the result vector.

startIndex = linspace(1,lenOut - grainMax,grainNumber);
endIndex= startIndex + grainLength - 1;

%% Granulation Function

% The first part of the FOR loop calls the 'grainForm' function
% 'grainNumber' of times. The second part of the loop simply arranges these
% parameters into the result vector (as defined before) and applies the
% amplitude modulation ampEnv.

for n = 1:grainNumber
    
    % Simply renaming the output of the grainForm function to 'grains'
    grain = grainForm(audioFile,startSample(n),grainLength(n),winType,slope);
    % Result vector to which each subsequent grain is added
    resultVec(startIndex(n):endIndex(n)) = resultVec(startIndex(n):endIndex(n))...
                                          + ampEnv(n)*grain;
end

%% Low-pass/High-pass filter

% Given our granulated matrix, we can now choose to apply a filter. A
% low-pass and high-pass Butterworth filter can be selected by the user.
if strcmp(EQ,'<None>')
    y = resultVec;
    
elseif strcmp(EQ,'Lowpass (500 Hz)')
    cutoffFreq = 1000; % Defining the cutoff frequency
    normFreq = cutoffFreq /(fs1/2); % Converting it into normalized frequency
    filtOrder = 4; % Defining the filter order
    [b_coeff, a_coeff] = butter(filtOrder, normFreq, 'low'); % Formation of the filter
    yFilt = filter(b_coeff, a_coeff, resultVec); % Applying it to the output
    y = yFilt;
    
elseif strcmp(EQ,'Highpass (3000Hz)')
    cutoffFreq = 3000; % Defining the cutoff frequency
    normFreq = cutoffFreq /(fs1/2); % Converting it into normalized frequency
    filtOrder = 4; % Defining the filter order
    [b_coeff, a_coeff] = butter(filtOrder, normFreq, 'high'); % Formation of the filter
    yFilt = filter(b_coeff, a_coeff, resultVec); % Applying it to the output
    y = yFilt;
end

%% FX Convolution

% After processing the grain through the EQ, the user can choose to
% convolve the output with either a flanger, delay or reverb effect. 

if strcmp(convType,'<None>')
    output = y;
    
elseif strcmp (convType,'Flanger')
    % Reading the IR file into the function
    [ir,fs2] = audioread('IR01_Flanger.wav');
    % Forcing a stereo conversion if IR file is mono
    if size(ir,2) > 1
        ir = mean(ir,2);
    end
        % Transposing the matrix to row
        ir = ir'; 
    
        % If the sample rate of the IR is not equal to the sample rate of 
        % the audio file, then we simply resample the former.
        if fs2 ~= fs1
            ir = resample(ir,fs1,fs2);
        end
    
        convLen = length(y) + length(ir) - 1;
        resultConv = zeros(1,convLen);
        output = resultConv + grainConvoluter(y,ir);
        
elseif strcmp (convType,'Delay')
    % Reading the IR file into the function
    [ir,fs2] = audioread('IR02_Delay.wav');
    % Forcing a stereo conversion if IR file is mono
    if size(ir,2) > 1
        ir = mean(ir,2);
    end
        % Transposing the matrix to row
        ir = ir'; 
    
        % If the sample rate of the IR is not equal to the sample rate of 
        % the audio file, then we simply resample the former.
        if fs2 ~= fs1
            ir = resample(ir,fs1,fs2);
        end
    
        convLen = length(y) + length(ir) - 1;
        resultConv = zeros(1,convLen);
        output = resultConv + grainConvoluter(y,ir);
        
elseif strcmp (convType,'Reverb')
    % Reading the IR file into the function
    [ir,fs2] = audioread('IR03_Reverb.wav');
    % Forcing a stereo conversion if IR file is mono
    if size(ir,2) > 1
        ir = mean(ir,2);
    end
        % Transposing the matrix to row
        ir = ir'; 
    
        % If the sample rate of the IR is not equal to the sample rate of 
        % the audio file, then we simply resample the former.
        if fs2 ~= fs1
            ir = resample(ir,fs1,fs2);
        end
    
        convLen = length(y) + length(ir) - 1;
        resultConv = zeros(1,convLen);
        output = resultConv + grainConvoluter(y,ir);
end

%% Granulated Output

    Y = output;
    Y = Y';% Transposing to a column vector
    Y = Y/max(abs(Y)); % Normalizing the output 

end