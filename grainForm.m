%       Name: Karan Pareek
%       Student ID: kp2218
% This function enables the user to construct a grain of sound from the
% incoming audio file,x. It takes as inputs, the starting point and the
% length of the audio segment, in addition to the window type and slope of
% fades for amplitude modulation. The result is an audio grain that can be
% used for the process of granulation.
% INPUTS: Name of Audio File, Sample Start, Grain Length, Slope of Window
% OUTPUT: Audio grain with the modulated amplitude (y)

function y = grainForm(audioFile,startSample,grainLength,winType,slope)

%% Error Checking

if ~ischar(audioFile)
    error('Invalid audio input name');
elseif startSample < 0
    error('Invalid Sample value');
elseif grainLength < 0
    error('Invalid Grain length');
end

%% Initialization

% Reading an audio file into the function (disregarding the sample rate)
[x,~] = audioread(audioFile);

% Forcing a stereo conversion if audio file is mono since the output of the
% granulation synthesizer is stereo
if size(x,2) < 2 
    x = [x,x] ;
end

% The grain parameter is calculated as being 'grainLength' samples long,
% beginning from 'startSample'.
y_sample = x(startSample:(startSample+grainLength-1));

%% Window Function

% Given that we want to apply a window to our grain, we need to first
% detail its alpha value.
if strcmp(slope,'0.5')
    slope = 0.5;
elseif strcmp(slope,'1.5')
    slope = 1.5;
elseif strcmp(slope,'2.5')
    slope = 2.5;
end

% Defining the window function for amplitude modulation
if strcmp (winType,'Kaiser')
    win_y = window(@kaiser,grainLength,slope);
elseif strcmp (winType,'Tukey')
    win_y = window(@tukeywin,grainLength,slope);
elseif strcmp (winType,'Gaussian')
    win_y = window(@gausswin,grainLength,slope);
end

%% Main Function

% Tranposing the window to column form since audio data is available to us 
% in that format
win_y = win_y'; 

% Now that we have selected our inputs, we can apply the window function to
% the grain for amplitude modulation.
y = y_sample .* win_y; 

end