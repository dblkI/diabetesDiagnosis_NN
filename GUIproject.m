function varargout = GUIproject(varargin)
% GUIPROJECT MATLAB code for GUIproject.fig
%      GUIPROJECT, by itself, creates a new GUIPROJECT or raises the existing
%      singleton*.
%
%      H = GUIPROJECT returns the handle to a new GUIPROJECT or the handle to
%      the existing singleton*.
%
%      GUIPROJECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIPROJECT.M with the given input arguments.
%
%      GUIPROJECT('Property','Value',...) creates a new GUIPROJECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUIproject_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUIproject_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUIproject

% Last Modified by GUIDE v2.5 17-Jun-2023 16:51:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUIproject_OpeningFcn, ...
                   'gui_OutputFcn',  @GUIproject_OutputFcn, ...
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


% --- Executes just before GUIproject is made visible.
function GUIproject_OpeningFcn(hObject, eventdata, handles, varargin)
historial = readmatrix("testing.csv");
set(handles.Table1, 'Data',historial);

set(handles.Gendermenu,'Value',3);
set(handles.SmokingMenu,'Value',5);
set(handles.hypertens,'Value',3);
set(handles.Heartdisease,'Value',3);
set(handles.BMI,'Value',7);


% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUIproject (see VARARGIN)

% Choose default command line output for GUIproject
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUIproject wait for user response (see UIRESUME)
% uiwait(handles.figure1);
axes(handles.axes1);
background = imread("Diabetes.jpeg");
axis off;
imshow(background);
set(handles.Diabets,'string',"Consult your doctor if you have any suspicions.");

% --- Outputs from this function are returned to the command line.
function varargout = GUIproject_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in Gendermenu.
function Gendermenu_Callback(hObject, eventdata, handles)
gnder = get (hObject,'Value');
if gnder == 1
    handles.Gendermenu = 0 ;
else 
    handles.Gendermenu = 1;
end
guidata(hObject, handles);
% hObject    handle to Gendermenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns Gendermenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Gendermenu


% --- Executes during object creation, after setting all properties.
function Gendermenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Gendermenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in SmokingMenu.
function SmokingMenu_Callback(hObject, eventdata, handles)
smoke = get(hObject,'Value');
if smoke == 1 
    handles.SmokingMenu = 0;
elseif smoke == 2
    handles.SmokingMenu = 1;
elseif smoke == 3
    handles.SmokingMenu = 2;
elseif smoke == 4
    handles.SmokingMenu = 3;
end
guidata(hObject, handles);
% hObject    handle to SmokingMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns SmokingMenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from SmokingMenu


% --- Executes during object creation, after setting all properties.
function SmokingMenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SmokingMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Age_in_Callback(hObject, eventdata, handles)

% hObject    handle to Age_in (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Age_in as text
%        str2double(get(hObject,'String')) returns contents of Age_in as a double


% --- Executes during object creation, after setting all properties.
function Age_in_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Age_in (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in hypertens.
function hypertens_Callback(hObject, eventdata, handles)
hypert = get (hObject,'Value');
if hypert == 1
    handles.hypertens = 1 ;
else 
    handles.hypertens = 0;
end
guidata(hObject, handles);

% hObject    handle to hypertens (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns hypertens contents as cell array
%        contents{get(hObject,'Value')} returns selected item from hypertens


% --- Executes during object creation, after setting all properties.
function hypertens_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hypertens (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Heartdisease.
function Heartdisease_Callback(hObject, eventdata, handles)
heartd = get (hObject,'Value');
if heartd == 1
    handles.Heartdisease = 1 ;
else 
    handles.Heartdisease = 0;
end
guidata(hObject, handles);
% hObject    handle to Heartdisease (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Heartdisease contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Heartdisease


% --- Executes during object creation, after setting all properties.
function Heartdisease_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Heartdisease (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function BMI_Callback(hObject, eventdata, handles)
bmi = get (hObject,'Value');
if bmi == 1
    handles.BMI = 0 ;
elseif bmi == 2 
    handles.BMI = 1;
elseif bmi == 3 
    handles.BMI = 2;
elseif bmi == 4 
    handles.BMI = 3;
elseif bmi == 5 
    handles.BMI = 4;    
elseif bmi == 6 
    handles.BMI = 5;
end
guidata(hObject, handles);
% hObject    handle to BMI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of BMI as text
%        str2double(get(hObject,'String')) returns contents of BMI as a double


% --- Executes during object creation, after setting all properties.
function BMI_CreateFcn(hObject, eventdata, handles)
% hObject    handle to BMI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function HbA1c_Callback(hObject, eventdata, handles)

% hObject    handle to HbA1c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of HbA1c as text
%        str2double(get(hObject,'String')) returns contents of HbA1c as a double


% --- Executes during object creation, after setting all properties.
function HbA1c_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HbA1c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bloodGluc_Callback(hObject, eventdata, handles)

% hObject    handle to bloodGluc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bloodGluc as text
%        str2double(get(hObject,'String')) returns contents of bloodGluc as a double


% --- Executes during object creation, after setting all properties.
function bloodGluc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bloodGluc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Diabets_Callback(hObject, eventdata, handles)
% hObject    handle to Diabets (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Diabets as text
%        str2double(get(hObject,'String')) returns contents of Diabets as a double


% --- Executes during object creation, after setting all properties.
function Diabets_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Diabets (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
load("variablesNN.mat");
P_gender = handles.Gendermenu;
P_smoke = handles.SmokingMenu/3;
P_age = str2double(get(handles.Age_in,'String'))/80;
P_hype = handles.hypertens;
P_heart = handles.Heartdisease;
P_bmi =  handles.BMI/5;
P_lvl = str2double(get(handles.HbA1c,'String'))/9;
P_blood = str2double(get(handles.bloodGluc,'String'))/300;

Pattern = [P_gender;P_smoke;P_age;P_hype;P_heart;P_bmi;P_lvl;P_blood];

%disp('Pattern: ')
%disp(Pattern)

a1 = logsig(W1 * Pattern + b1);
a2 = logsig(W2 * a1 + b2);
a3 = purelin(W3 * a2 + b3);

if a3 >= 0
    %disp("Tienes Diabetes mano")
    set(handles.Diabets,'string',"It is possible that you have diabetes, you must consult your doctor.");
    axes(handles.axes1);
    background = imread("consecuenses.png");
    axis off;
    imshow(background);
else
    %disp("Tas bueno pa")
    set(handles.Diabets,'string',"Your health seems to be fine, but if you have any doubts consult your doctor.");
    axes(handles.axes1);
    background = imread("advice.jpeg");
        axis off;
    imshow(background);

end


% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
