%       Name: Karan Pareek
%       Student ID: kp2218
% |------------------Click 'Run' to access the GUI!-----------------------|
% This GUI script runs the Granular Synthesizer by calling the 'granulator'
% function script. The various input arguments are can be selected via the
% various GUI parameters. 
% Note: Jump to line 406 to view the 'Granulate' callback funtion. This 
% function also contains parameters that are not used at part of the code. 

function varargout = SynthGUI(varargin)
% SYNTHGUI MATLAB code for SynthGUI.fig
%      SYNTHGUI, by itself, creates a new SYNTHGUI or raises the existing
%      singleton*.
%
%      H = SYNTHGUI returns the handle to a new SYNTHGUI or the handle to
%      the existing singleton*.
%
%      SYNTHGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SYNTHGUI.M with the given input arguments.
%
%      SYNTHGUI('Property','Value',...) creates a new SYNTHGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SynthGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SynthGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SynthGUI

% Last Modified by GUIDE v2.5 30-Apr-2018 22:55:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SynthGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @SynthGUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before SynthGUI is made visible.
function SynthGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SynthGUI (see VARARGIN)

% Choose default command line output for SynthGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SynthGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SynthGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in windowType.
function windowType_Callback(hObject, eventdata, handles)
% hObject    handle to windowType (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns windowType contents as cell array
%        contents{get(hObject,'Value')} returns selected item from windowType


% --- Executes during object creation, after setting all properties.
function windowType_CreateFcn(hObject, eventdata, handles)
% hObject    handle to windowType (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in readSequence.
function readSequence_Callback(hObject, eventdata, handles)
% hObject    handle to readSequence (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns readSequence contents as cell array
%        contents{get(hObject,'Value')} returns selected item from readSequence


% --- Executes during object creation, after setting all properties.
function readSequence_CreateFcn(hObject, eventdata, handles)
% hObject    handle to readSequence (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function lengthOut_Callback(hObject, eventdata, handles)
% hObject    handle to lengthOut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lengthOut as text
%        str2double(get(hObject,'String')) returns contents of lengthOut as a double


% --- Executes during object creation, after setting all properties.
function lengthOut_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lengthOut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function windowSlope_Callback(hObject, eventdata, handles)
% hObject    handle to windowSlope (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of windowSlope as text
%        str2double(get(hObject,'String')) returns contents of windowSlope as a double


% --- Executes during object creation, after setting all properties.
function windowSlope_CreateFcn(hObject, eventdata, handles)
% hObject    handle to windowSlope (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in ampEnvelope.
function ampEnvelope_Callback(hObject, eventdata, handles)
% hObject    handle to ampEnvelope (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns ampEnvelope contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ampEnvelope


% --- Executes during object creation, after setting all properties.
function ampEnvelope_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ampEnvelope (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in EQtype.
function EQtype_Callback(hObject, eventdata, handles)
% hObject    handle to EQtype (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns EQtype contents as cell array
%        contents{get(hObject,'Value')} returns selected item from EQtype


% --- Executes during object creation, after setting all properties.
function EQtype_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EQtype (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function GrainsL_Callback(hObject, eventdata, handles)
% hObject    handle to GrainsL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of GrainsL as text
%        str2double(get(hObject,'String')) returns contents of GrainsL as a double


% --- Executes during object creation, after setting all properties.
function GrainsL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to GrainsL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function minGrainsL_Callback(hObject, eventdata, handles)
% hObject    handle to minGrainsL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of minGrainsL as text
%        str2double(get(hObject,'String')) returns contents of minGrainsL as a double


% --- Executes during object creation, after setting all properties.
function minGrainsL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to minGrainsL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function maxGrainsL_Callback(hObject, eventdata, handles)
% hObject    handle to maxGrainsL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of maxGrainsL as text
%        str2double(get(hObject,'String')) returns contents of maxGrainsL as a double


% --- Executes during object creation, after setting all properties.
function maxGrainsL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to maxGrainsL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function GrainsR_Callback(hObject, eventdata, handles)
% hObject    handle to GrainsR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of GrainsR as text
%        str2double(get(hObject,'String')) returns contents of GrainsR as a double


% --- Executes during object creation, after setting all properties.
function GrainsR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to GrainsR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function minGrainsR_Callback(hObject, eventdata, handles)
% hObject    handle to minGrainsR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of minGrainsR as text
%        str2double(get(hObject,'String')) returns contents of minGrainsR as a double


% --- Executes during object creation, after setting all properties.
function minGrainsR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to minGrainsR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function maxGrainsR_Callback(hObject, eventdata, handles)
% hObject    handle to maxGrainsR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of maxGrainsR as text
%        str2double(get(hObject,'String')) returns contents of maxGrainsR as a double


% --- Executes during object creation, after setting all properties.
function maxGrainsR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to maxGrainsR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inputFile_Callback(hObject, eventdata, handles)
% hObject    handle to inputFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inputFile as text
%        str2double(get(hObject,'String')) returns contents of inputFile as a double


% --- Executes during object creation, after setting all properties.
function inputFile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function outputFile_Callback(hObject, eventdata, handles)
% hObject    handle to outputFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of outputFile as text
%        str2double(get(hObject,'String')) returns contents of outputFile as a double


% --- Executes during object creation, after setting all properties.
function outputFile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to outputFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in granulationButton.
function granulationButton_Callback(hObject, eventdata, handles)
% hObject    handle to granulationButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

audioFile = get(handles.inputFile,'String');
outFile = get(handles.outputFile,'String');
lenOut = str2double(get(handles.lengthOut,'String'));

grainNumberL = str2double(get(handles.GrainsL,'String'));
grainMaxL = str2double(get(handles.maxGrainsL,'String'));
grainMinL = str2double(get(handles.minGrainsL,'String'));
grainNumberR = str2double(get(handles.GrainsR,'String'));
grainMaxR = str2double(get(handles.maxGrainsR,'String'));
grainMinR = str2double(get(handles.minGrainsR,'String'));

param01 = cellstr(get(handles.Readsequence,'String'));
readSeq = param01{get(handles.Readsequence,'Value')};

param02 = cellstr(get(handles.Convolutiontype,'String'));
convType = param02{get(handles.Convolutiontype,'Value')};

param03 = cellstr(get(handles.EQType,'String'));
EQ = param03{get(handles.EQType,'Value')};

param04 = cellstr(get(handles.Windowtype,'String'));
winType = param04{get(handles.Windowtype,'Value')};

param05 = cellstr(get(handles.Amplitudeenvelope,'String'));
ampEnv = param05{get(handles.Amplitudeenvelope,'Value')};

param06 = cellstr(get(handles.Windowslope,'String'));
slope = param06{get(handles.Windowslope,'Value')};

% Calling the two functions for granulation
YL = granulator(audioFile,grainNumberL,lenOut,grainMaxL,grainMinL,...
                readSeq,winType,slope,ampEnv,EQ,convType);
YR = granulator(audioFile,grainNumberR,lenOut,grainMaxR,grainMinR,...
                readSeq,winType,slope,ampEnv,EQ,convType);
            
% Concatenated Output
Y = [YL,YR]; % Concatenating the L and R matrices  

% Writes the output file at a sample rate of 44.1 kHz (only if selected)
if (get(handles.saveParameter,'Value') == get(handles.saveParameter,'Max'))
    audiowrite(outFile,Y,44100);
end
% Playback of output at sample rate of 44.1 kHz (only if selected)
if (get(handles.soundParameter,'Value') == get(handles.soundParameter,'Max'))
	soundsc(Y,44100);
end


% --- Executes on selection change in convolutionType.
function convolutionType_Callback(hObject, eventdata, handles)
% hObject    handle to convolutionType (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns convolutionType contents as cell array
%        contents{get(hObject,'Value')} returns selected item from convolutionType


% --- Executes during object creation, after setting all properties.
function convolutionType_CreateFcn(hObject, eventdata, handles)
% hObject    handle to convolutionType (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to windowType (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of windowType as text
%        str2double(get(hObject,'String')) returns contents of windowType as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to windowType (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to readSequence (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of readSequence as text
%        str2double(get(hObject,'String')) returns contents of readSequence as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to readSequence (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit15_Callback(hObject, eventdata, handles)
% hObject    handle to convolutionType (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of convolutionType as text
%        str2double(get(hObject,'String')) returns contents of convolutionType as a double


% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to convolutionType (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit16_Callback(hObject, eventdata, handles)
% hObject    handle to EQtype (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EQtype as text
%        str2double(get(hObject,'String')) returns contents of EQtype as a double


% --- Executes during object creation, after setting all properties.
function edit16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EQtype (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function amplitudeEnvelope_Callback(hObject, eventdata, handles)
% hObject    handle to amplitudeEnvelope (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of amplitudeEnvelope as text
%        str2double(get(hObject,'String')) returns contents of amplitudeEnvelope as a double


% --- Executes during object creation, after setting all properties.
function amplitudeEnvelope_CreateFcn(hObject, eventdata, handles)
% hObject    handle to amplitudeEnvelope (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in soundParameter.
function soundParameter_Callback(hObject, eventdata, handles)
% hObject    handle to soundParameter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of soundParameter


% --- Executes on button press in saveParameter.
function saveParameter_Callback(hObject, eventdata, handles)
% hObject    handle to saveParameter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of saveParameter


% --- Executes on selection change in Readsequence.
function Readsequence_Callback(hObject, eventdata, handles)
% hObject    handle to Readsequence (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Readsequence contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Readsequence


% --- Executes during object creation, after setting all properties.
function Readsequence_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Readsequence (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Readsequence.
function popupmenu8_Callback(hObject, eventdata, handles)
% hObject    handle to Readsequence (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Readsequence contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Readsequence


% --- Executes during object creation, after setting all properties.
function popupmenu8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Readsequence (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Convolutiontype.
function Convolutiontype_Callback(hObject, eventdata, handles)
% hObject    handle to Convolutiontype (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Convolutiontype contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Convolutiontype


% --- Executes during object creation, after setting all properties.
function Convolutiontype_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Convolutiontype (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in EQType.
function EQType_Callback(hObject, eventdata, handles)
% hObject    handle to EQType (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns EQType contents as cell array
%        contents{get(hObject,'Value')} returns selected item from EQType


% --- Executes during object creation, after setting all properties.
function EQType_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EQType (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Windowtype.
function Windowtype_Callback(hObject, eventdata, handles)
% hObject    handle to Windowtype (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Windowtype contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Windowtype


% --- Executes during object creation, after setting all properties.
function Windowtype_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Windowtype (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Windowslope.
function Windowslope_Callback(hObject, eventdata, handles)
% hObject    handle to Windowslope (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Windowslope contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Windowslope


% --- Executes during object creation, after setting all properties.
function Windowslope_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Windowslope (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Amplitudeenvelope.
function Amplitudeenvelope_Callback(hObject, eventdata, handles)
% hObject    handle to Amplitudeenvelope (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Amplitudeenvelope contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Amplitudeenvelope


% --- Executes during object creation, after setting all properties.
function Amplitudeenvelope_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Amplitudeenvelope (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
