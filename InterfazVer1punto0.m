function varargout = InterfazVer1punto0(varargin)

%Department of Computer Science
%University of Guadalajara, Guadalajara, Jalisco, Mexico
%Last Modified by Sulema Torres, v4 17-nov-2017

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @InterfazVer1punto0_OpeningFcn, ...
    'gui_OutputFcn',  @InterfazVer1punto0_OutputFcn, ...
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

% --- Executes just before InterfazVer1punto0 is made visible.
function InterfazVer1punto0_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn. hObject    handle to
% figure eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA) varargin
% command line arguments to InterfazVer1punto0 (see VARARGIN)
addpath('./dlg');
addpath('./libraries');
% Choose default command line output for InterfazVer1punto0
handles.output = hObject;
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Initializing variables
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
handles.a = 0; %flag variable for combo_markersGroup
handles.b = 0; %flag variable for combo_markersMarker
handles.allPossibleMarkers = sort({'.';'o';'x';'+';'*';'s';'d';'v';'^';'<';'>';'p';'h';});
handles.allPossibleGroups = {'Group 1';'Group 2';'Group 3';'Group 4';'Group 5';...
    'Group 6';'Group 7';'Group 8';'Group 9';'Group 10';'Group 11';...
    'Group 12';'Group 13';};

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Viewing and enabling elements
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(handles.btn_runExperiment,'Enable','off');
%panel file
set(handles.btn_openFile,'Enable','on');
set(handles.btn_changeFile,'Enable','off');
set(handles.text11,'Visible','off');
set(handles.edit_fileName,'Visible','off');
set(handles.edit_fileName,'String','');
set(handles.text12,'Visible','off');
set(handles.edit_totalSequences,'Visible','off');
set(handles.edit_totalSequences,'String','');
set(handles.pnl_preview,'Visible','off');
set(handles.list_previewHeaders,'String','');
set(handles.list_previewSequences,'String','');
%panel experiment
set(handles.pnl_experiment,'Visible','off');
%panel cluster
set(handles.pnl_cluster,'Visible','off');
set(handles.text6,'Visible','off');
set(handles.edit_kNumber,'Visible','off');
set(handles.edit_kNumber,'Enable','on');
set(handles.edit_kNumber,'String','1');
set(handles.btn_setK,'Visible','off');
set(handles.btn_setK,'Enable','on');
set(handles.btn_editK,'Visible','off');
set(handles.btn_editK,'Enable','off');
set(handles.chk_manuallyGroup,'Visible','off');
set(handles.chk_manuallyGroup,'Value',0);
%panel groups
set(handles.pnl_groups,'Visible','off');
set(handles.text1,'Visible','off');
set(handles.edit_groups,'Enable','on');
set(handles.edit_groups,'Visible','off');
set(handles.edit_groups,'String','1');
set(handles.text5,'Visible','off');
set(handles.btn_setGroups,'Visible','off');
set(handles.btn_setGroups,'Enable','on');
set(handles.btn_editGroups,'Visible','off');
set(handles.btn_editGroups,'Enable','off');
%panel group-Sequences
set(handles.pnl_groupSequences,'Visible','off');
set(handles.combo_sequencesGroup,'Visible','off');
set(handles.combo_sequencesGroup,'String','');
set(handles.btn_selectSequences,'Visible','off');
set(handles.btn_selectSequences,'Enable','off');
set(handles.text16,'Visible','off');
set(handles.list_assignedGroupSequence,'Visible','off');
set(handles.list_assignedGroupSequence,'String','');
set(handles.list_assignedGroupSequence,'Enable','off');
set(handles.text18,'Visible','off');
set(handles.list_unassignedGroupSequence,'Visible','off');
set(handles.list_unassignedGroupSequence,'String','');
set(handles.text19,'Visible','off');
set(handles.btn_removeGroupSequence,'Visible','off');
set(handles.btn_removeallGroupSequence,'Visible','off');
set(handles.btn_removeGroupSequence,'Enable','off');
set(handles.btn_removeallGroupSequence,'Enable','off');
set(handles.btn_setGroupsSequences,'Visible','off');
set(handles.btn_setGroupsSequences,'Enable','off');
set(handles.btn_editGroupsSequences,'Visible','off');
set(handles.btn_editGroupsSequences,'Enable','off');
%panel group-Markers
set(handles.pnl_groupMarkers,'Visible','off');
set(handles.chk_assignMarkers,'Visible','off');
set(handles.chk_assignMarkers,'Value',0);
set(handles.combo_markersGroup,'Visible','off');
set(handles.combo_markersMarker,'Visible','off');
set(handles.combo_markersGroup,'String','');
set(handles.combo_markersMarker,'String','');
set(handles.btn_assignGroupMarker,'Visible','off');
set(handles.btn_assignGroupMarker,'Enable','off');
set(handles.text15,'Visible','off');
set(handles.list_assignGroupMarker,'Visible','off');
set(handles.list_assignGroupMarker,'String','');
set(handles.text10,'Visible','off');
set(handles.btn_removeGroupMarker,'Visible','off');
set(handles.btn_removeallGroupMarker,'Visible','off');
set(handles.btn_removeGroupMarker,'Enable','off');
set(handles.btn_removeallGroupMarker,'Enable','off');
set(handles.btn_setGroupsMarkers,'Visible','off');
set(handles.btn_setGroupsMarkers,'Enable','off');
set(handles.btn_editGroupsMarkers,'Visible','off');
set(handles.btn_editGroupsMarkers,'Enable','off');

%CW messages
disp('Welcome to Signal Tool for the Analysis of Relationship between Sequences');
disp('Version 1.0');
disp('This window show you the experiment status');
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes InterfazVer1punto0 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set(handles.figure1, 'Name', 'Signal Tool for the Analysis of Relationship between Sequences');
% --- Outputs from this function are returned to the command line.
function varargout = InterfazVer1punto0_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT); hObject
% handle to figure eventdata  reserved - to be defined in a future version
% of MATLAB handles    structure with handles and user data (see GUIDATA)
% Get default command line output from handles structure
varargout{1} = handles.output;

function edit_groups_Callback(hObject, eventdata, handles)
% hObject    handle to edit_groups (see GCBO) eventdata  reserved - to be
% defined in a future version of MATLAB handles    structure with handles
% and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_groups as text
%        str2double(get(hObject,'String')) returns contents of edit_groups
%        as a double

% --- Executes during object creation, after setting all properties.

function edit_groups_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_groups (see GCBO) eventdata  reserved - to be
% defined in a future version of MATLAB handles    empty - handles not
% created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in combo_markersMarker.
function combo_markersMarker_Callback(hObject, eventdata, handles)
% hObject    handle to combo_markersMarker (see GCBO) eventdata  reserved -
% to be defined in a future version of MATLAB handles    structure with
% handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns
% combo_markersMarker contents as cell array
%        contents{get(hObject,'Value')} returns selected item from
%        combo_markersMarker

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Viewing and enabling elements
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(handles.btn_removeGroupMarker,'Enable','off');
if get(hObject,'Value')==1
    b=0;
else
    b=1;
end
handles.b=b;
if handles.a==1 && handles.b==1
    set(handles.btn_assignGroupMarker,'Enable','on');
else
    set(handles.btn_assignGroupMarker,'Enable','off');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Saving selected value of Marker
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
M = cellstr(get(handles.combo_markersMarker, 'String'));
M = M{get(handles.combo_markersMarker, 'Value')};
handles.M=M;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Saving values of combo_markersMarker for removal
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
contentPop2 = cellstr(get(handles.combo_markersMarker, 'String'));
handles.contentPop2=contentPop2;

guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function combo_markersMarker_CreateFcn(hObject, eventdata, handles)
% hObject    handle to combo_markersMarker (see GCBO) eventdata  reserved -
% to be defined in a future version of MATLAB handles    empty - handles
% not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in combo_markersGroup.
function combo_markersGroup_Callback(hObject, eventdata, handles)
% hObject    handle to combo_markersGroup (see GCBO) eventdata  reserved -
% to be defined in a future version of MATLAB handles    structure with
% handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns
% combo_markersGroup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from
%        combo_markersGroup

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Viewing and enabling elements
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if get(hObject,'Value')==1
    a=0;
else
    a=1;
end
handles.a=a;
if handles.a==1 && handles.b==1
    set(handles.btn_assignGroupMarker,'Enable','on');
else
    set(handles.btn_assignGroupMarker,'Enable','off');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Saving selected value of Group
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
G = cellstr(get(handles.combo_markersGroup, 'String'));
G = G{get(handles.combo_markersGroup, 'Value')};
handles.G=G;
set(handles.btn_removeGroupMarker,'Enable','off');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Saving values of Popupmenu3 for removal
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
contentPop3 = cellstr(get(handles.combo_markersGroup, 'String'));
handles.contentPop3=contentPop3;

guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function combo_markersGroup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to combo_markersGroup (see GCBO) eventdata  reserved -
% to be defined in a future version of MATLAB handles    empty - handles
% not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox4.
function listbox4_Callback(hObject, eventdata, handles)
% hObject    handle to listbox4 (see GCBO) eventdata  reserved - to be
% defined in a future version of MATLAB handles    structure with handles
% and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox4
% contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox4

% --- Executes during object creation, after setting all properties.

function listbox4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox4 (see GCBO) eventdata  reserved - to be
% defined in a future version of MATLAB handles    empty - handles not
% created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in btn_assignGroupMarker.
function btn_assignGroupMarker_Callback(hObject, eventdata, handles)
% hObject    handle to btn_assignGroupMarker (see GCBO) eventdata  reserved
% - to be defined in a future version of MATLAB handles    structure with
% handles and user data (see GUIDATA)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Assigning group-marker to list_assignGroupMarker
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
assignment = cellstr(get(handles.list_assignGroupMarker,'String')); %old value listbox

new = [handles.G,', Marker: ',handles.M]; %new value (group+marker)
if(isempty(assignment{1}))
    assignment{end} = new; %adding new value to list
else
    assignment{end+1} = new; %adding new value to list
end

set(handles.list_assignGroupMarker,'String',assignment); %assign to listbox

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Eliminating from combo_markersGroup (group)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
SelectedG = handles.contentPop3{get(handles.combo_markersGroup,'Value')}; %get selected item

%%OP1: eliminating spaces%%
diffg = setdiff(handles.contentPop3,SelectedG,'stable'); %compare with original cell array

set(handles.combo_markersGroup,'String',diffg); %set difference to popup3
set(handles.combo_markersGroup,'Value',1);
handles.a=0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Eliminating from combo_markersMarker (marker)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
SelectedM = handles.contentPop2{get(handles.combo_markersMarker,'Value')}; %get selected item

%%OP1: eliminating spaces%%
diff = setdiff(handles.contentPop2,SelectedM,'stable'); %compare with original cell array
set(handles.combo_markersMarker,'String',diff); %set difference to popup2
set(handles.combo_markersMarker,'Value',1);
handles.b=0;

%verify combos to enable set
combo1 = cellstr(get(handles.combo_markersGroup, 'String'));
combo2 = cellstr(get(handles.combo_markersMarker, 'String'));
if strcmp(combo2{end},'Choose a Marker') && strcmp(combo1{end},'Choose a Group')
    set(handles.btn_setGroupsMarkers,'Enable','on');
    set(handles.btn_editGroupsMarkers,'Enable','off');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Viewing and enabling elements
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(handles.btn_assignGroupMarker,'Enable','off');
set(handles.btn_removeGroupMarker,'Enable','off');
set(handles.btn_removeallGroupMarker,'Enable','on');
set(handles.list_assignGroupMarker,'Enable','on')

guidata(hObject,handles);

% --- Executes during object deletion, before destroying properties.
function listbox4_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to listbox4 (see GCBO) eventdata  reserved - to be
% defined in a future version of MATLAB handles    structure with handles
% and user data (see GUIDATA)

% --- Executes on selection change in list_assignGroupMarker.
function list_assignGroupMarker_Callback(hObject, eventdata, handles)
% hObject    handle to list_assignGroupMarker (see GCBO) eventdata
% reserved - to be defined in a future version of MATLAB handles
% structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns
% list_assignGroupMarker contents as cell array
%        contents{get(hObject,'Value')} returns selected item from
%        list_assignGroupMarker

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Viewing and enabling elements
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if isempty(get(hObject,'String'))
    set(handles.list_assignGroupMarker,'Enable','off');
    set(handles.btn_removeGroupMarker,'Enable','off');
    set(handles.btn_removeallGroupMarker,'Enable','off');
else
    set(handles.btn_removeGroupMarker,'Enable','on');
    set(handles.btn_removeallGroupMarker,'Enable','on');
    set(handles.list_assignGroupMarker,'Enable','on');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Saving values of list_assigngroupmarker for removal
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
contentList5 = cellstr(get(handles.list_assignGroupMarker, 'String'));
handles.contentList5 = contentList5;

guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function list_assignGroupMarker_CreateFcn(hObject, eventdata, handles)
% hObject    handle to list_assignGroupMarker (see GCBO) eventdata
% reserved - to be defined in a future version of MATLAB handles    empty -
% handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in btn_removeGroupMarker.
function btn_removeGroupMarker_Callback(hObject, eventdata, handles)
% hObject    handle to btn_removeGroupMarker (see GCBO) eventdata  reserved
% - to be defined in a future version of MATLAB handles    structure with
% handles and user data (see GUIDATA)

SelectedAL = handles.contentList5{get(handles.list_assignGroupMarker,'Value')}; %get selected item

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Deleting group-marker from list_assignGroupMarker
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
AssignmentRemoval = get(handles.list_assignGroupMarker, 'String');
SelectedA = get(handles.list_assignGroupMarker,'Value');

AssignmentRemoval(SelectedA) = [];  %delete it in this list

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Viewing and enabling elements
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if isempty(AssignmentRemoval)
    set(handles.list_assignGroupMarker,'Enable','off');
    set(handles.list_assignGroupMarker, 'String', '');
    set(handles.btn_removeGroupMarker,'Enable','off');
    set(handles.btn_removeallGroupMarker,'Enable','off');
else
    set(handles.list_assignGroupMarker, 'String', AssignmentRemoval);
    set(handles.list_assignGroupMarker, 'Value', 1);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Returning Group to combo_markersGroup
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
contentPop3 = cellstr(get(handles.combo_markersGroup, 'String'));
handles.contentPop3=contentPop3;
AllPossibleGroups=handles.allPossibleGroups;
guidata(hObject,handles);

SelectedAL = handles.contentList5{SelectedA}; %get selected item

expressionG = '\, ';
splitStrG = regexp(SelectedAL,expressionG,'split'); %separating the group
obtain_group = splitStrG(1); %obtain marker from selected item

for i = 1:str2double(get(handles.edit_groups,'String'))+1
    findGroupRemoval{i} = strcmp(obtain_group, AllPossibleGroups{i}); %findind group position
end

for j = 1:str2double(get(handles.edit_groups,'String'))+1
    if findGroupRemoval{j}==1
        handles.contentPop3{end+1} = AllPossibleGroups{j}; %handles.contentPop2{j} = Markers{j} <-- not changing order!! check line 442
        newPop3 = handles.contentPop3;
        newPop3_order = sort(newPop3);
        set(handles.combo_markersGroup,'String',newPop3_order);
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Returning Marker to combo_markersMarker
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
contentPop2 = cellstr(get(handles.combo_markersMarker, 'String'));
handles.contentPop2 = contentPop2;
guidata(hObject,handles); %updating contentPop2

SelectedAL = handles.contentList5{SelectedA}; %get selected item

expression = '\: ';
splitStr = regexp(SelectedAL,expression,'split'); %separating the marker
obtain_marker = splitStr(2); %obtain marker from selected item

for i = 1:str2double(get(handles.edit_groups,'String'))+1
    findMarkerRemoval{i} = strcmp(obtain_marker,handles.allPossibleMarkers{i}); %findind marker position
end

for j = 1:str2double(get(handles.edit_groups,'String'))+1
    if findMarkerRemoval{j}==1
        handles.contentPop2{1} = handles.allPossibleMarkers{j}; %handles.contentPop2{j} = Markers{j} <-- not changing order!! check line 442
        newPop2 = sort(handles.contentPop2);
        newPop2 = ['Choose a Marker'; newPop2];
        handles.contentPop2=newPop2;
        set(handles.combo_markersMarker,'String',newPop2);
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Viewing and enabling elements
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(handles.btn_removeGroupMarker,'Enable','off');
set(handles.btn_setGroupsMarkers,'Enable','off');
set(handles.btn_editGroupsMarkers,'Enable','off');

guidata(hObject,handles);

% --- Executes on button press in btn_removeallGroupMarker.
function btn_removeallGroupMarker_Callback(hObject, eventdata, handles)
% hObject    handle to btn_removeallGroupMarker (see GCBO) eventdata
% reserved - to be defined in a future version of MATLAB handles
% structure with handles and user data (see GUIDATA)
ToPush=get(hObject,'Value');

if ToPush == 1
    
    Decision= AreYouSureDialogRemoveAll;
    %     Decision= AreYouSureDialog;
    
    if strcmp(Decision,'Yes')
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %Viewing and enabling elements
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        set(handles.list_assignGroupMarker,'Enable','off');
        set(handles.list_assignGroupMarker,'String','');
        set(handles.btn_removeGroupMarker,'Enable','off');
        set(handles.btn_removeallGroupMarker,'Enable','off');
        set(handles.btn_setGroupsMarkers,'Enable','off');
        set(handles.btn_editGroupsMarkers,'Enable','off');
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %Enabling Groups and Markers from User entry
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        NbOfGroups=str2double(get(handles.edit_groups,'String'));
        Marcadores = ['Choose a Marker'; handles.allPossibleMarkers];
        Grupos = ['Choose a Group'; handles.allPossibleGroups];
        
        set(handles.combo_markersMarker,'String',Marcadores(1:NbOfGroups+1));
        set(handles.combo_markersGroup,'String',Grupos(1:NbOfGroups+1));
        set(handles.combo_markersMarker,'Value',1);
        set(handles.combo_markersGroup,'Value',1);
    else
        set(hObject,'Value',0)
    end
end
guidata(hObject,handles);

function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO) eventdata  reserved - to be defined
% in a future version of MATLAB handles    structure with handles and user
% data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a
%        double


% --- Executes during object creation, after setting all properties.

function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO) eventdata  reserved - to be defined
% in a future version of MATLAB handles    empty - handles not created
% until after all CreateFcns called Hint: edit controls usually have a
% white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO) eventdata  reserved - to be
% defined in a future version of MATLAB handles    structure with handles
% and user data (see GUIDATA) Hint: get(hObject,'Value') returns toggle
% state of checkbox2 [HEADER, SEQ]=fastaread(file);


% --- Executes on selection change in list_previewSequences.
function list_previewSequences_Callback(hObject, eventdata, handles)
% hObject    handle to list_previewSequences (see GCBO) eventdata  reserved
% - to be defined in a future version of MATLAB handles    structure with
% handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns
% list_previewSequences contents as cell array
%        contents{get(hObject,'Value')} returns selected item from
%        list_previewSequences


% --- Executes during object creation, after setting all properties.
function list_previewSequences_CreateFcn(hObject, eventdata, handles)
% hObject    handle to list_previewSequences (see GCBO) eventdata  reserved
% - to be defined in a future version of MATLAB handles    empty - handles
% not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_fileName_Callback(hObject, eventdata, handles)
% hObject    handle to edit_fileName (see GCBO) eventdata  reserved - to be
% defined in a future version of MATLAB handles    structure with handles
% and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_fileName as text
%        str2double(get(hObject,'String')) returns contents of
%        edit_fileName as a double

% --- Executes during object creation, after setting all properties.
function edit_fileName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_fileName (see GCBO) eventdata  reserved - to be
% defined in a future version of MATLAB handles    empty - handles not
% created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_totalSequences_Callback(hObject, eventdata, handles)
% hObject    handle to edit_totalSequences (see GCBO) eventdata  reserved -
% to be defined in a future version of MATLAB handles    structure with
% handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_totalSequences as
% text
%        str2double(get(hObject,'String')) returns contents of
%        edit_totalSequences as a double


% --- Executes during object creation, after setting all properties.
function edit_totalSequences_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_totalSequences (see GCBO) eventdata  reserved -
% to be defined in a future version of MATLAB handles    empty - handles
% not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in list_previewHeaders.
function list_previewHeaders_Callback(hObject, eventdata, handles)
% hObject    handle to list_previewHeaders (see GCBO) eventdata  reserved -
% to be defined in a future version of MATLAB handles    structure with
% handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns
% list_previewHeaders contents as cell array
%        contents{get(hObject,'Value')} returns selected item from
%        list_previewHeaders

% --- Executes during object creation, after setting all properties.

function list_previewHeaders_CreateFcn(hObject, eventdata, handles)
% hObject    handle to list_previewHeaders (see GCBO) eventdata  reserved -
% to be defined in a future version of MATLAB handles    empty - handles
% not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in list_previewSequences.
function list_previewSequenes_Callback(hObject, eventdata, handles)
% hObject    handle to list_previewSequences (see GCBO) eventdata  reserved
% - to be defined in a future version of MATLAB handles    structure with
% handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns
% list_previewSequences contents as cell array
%        contents{get(hObject,'Value')} returns selected item from
%        list_previewSequences

% --- Executes on button press in btn_setGroups.
function btn_setGroups_Callback(hObject, eventdata, handles)
% hObject    handle to btn_setGroups (see GCBO) eventdata  reserved - to be
% defined in a future version of MATLAB handles    structure with handles
% and user data (see GUIDATA)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Validating number of groups
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Num=str2num(get(handles.edit_groups,'String'));
if isempty(Num)
    errordlg('Introduce a valid number of groups', 'Format number error');
    set(handles.edit_groups,'String','1');
else
    if Num>length(handles.allPossibleGroups) % if number of groups is > 13
        errordlg(strcat('The maximum number of Groups is ',num2str(length(handles.allPossibleGroups))), 'Maximum number accepted error')
        set(handles.edit_groups,'String',num2str(length(handles.allPossibleGroups)));
        %    Marcadores =
        %    AllPossibleMarkers(1:length(AllPossibleMarkers),1); Grupos =
        %    AllPossibleGroups(1:length(AllPossibleMarkers),1);
        %    set(handles.combo_markersMarker,'String',Marcadores(1:end))
        %    set(handles.combo_markersGroup,'String',Grupos(1:end))
    elseif Num<1 % if number of groups is < 1
        %NbOfGroups =1;
        %     disp('The minimum number of Groups is 1')
        errordlg('The minimum number of Groups is 1.', 'Minimum number accepted error');
        set(handles.edit_groups,'String','1');
        %set(handles.combo_markersMarker,'String','.')
        %set(handles.combo_markersGroup,'String','Group 1')
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Viewing and enabling elements
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    set(handles.btn_editGroups,'Enable','on');
    set(handles.btn_setGroups,'Enable','off');
    set(handles.edit_groups,'Enable','off');
    %panel group-Sequences
    set(handles.pnl_groupSequences,'Visible','on');
    set(handles.combo_sequencesGroup,'Visible','on');
    set(handles.combo_sequencesGroup,'Enable','on');
    set(handles.btn_selectSequences,'Visible','on');
    set(handles.text16,'Visible','on');
    set(handles.list_assignedGroupSequence,'Visible','on');
    set(handles.list_assignedGroupSequence,'String','');
    set(handles.text18,'Visible','on');
    set(handles.list_unassignedGroupSequence,'Visible','on');
    set(handles.list_unassignedGroupSequence,'Enable','on');
    set(handles.text19,'Visible','on');
    set(handles.btn_removeGroupSequence,'Visible','on');
    set(handles.btn_removeallGroupSequence,'Visible','on');
    set(handles.btn_setGroupsSequences,'Visible','on');
    set(handles.btn_editGroupsSequences,'Visible','on');
    %panel group-Markers
    set(handles.pnl_groupMarkers,'Visible','on');
    set(handles.chk_assignMarkers,'Visible','on');
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Enabling Groups from User entry
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    Grupos = ['Choose a Group'; handles.allPossibleGroups];
    set(handles.combo_sequencesGroup,'String',Grupos(1:str2double(get(handles.edit_groups,'String'))+1));
    set(handles.combo_sequencesGroup,'Value',1);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Create and load unassigned sequences
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    SequencesGroup = cellfun(@num2str,num2cell(1:length(handles.header)),'uniformoutput',0);
    group = cell(1,length(handles.header));
    group(:) = {'0'};
    SequencesGroup = [SequencesGroup; group];
    SequencesGroup(1,:)=strcat({'Sequence '}, SequencesGroup(1,:),{': '},handles.header);
    set(handles.list_unassignedGroupSequence,'String',SequencesGroup(1,:));
    handles.SequencesGroup=SequencesGroup;
    
end

guidata(hObject,handles);


% --- Executes on button press in btn_editGroups.
function btn_editGroups_Callback(hObject, eventdata, handles)
% hObject    handle to btn_editGroups (see GCBO) eventdata  reserved - to
% be defined in a future version of MATLAB handles    structure with
% handles and user data (see GUIDATA)

ToPush=get(hObject,'Value');

if ToPush == 1
    
    %     Decision= AreYouSureDialogRemoveAll;
    Decision= AreYouSureDialogEditGroups;
    
    if strcmp(Decision,'Yes')
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %Viewing and enabling elements
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        set(handles.btn_runExperiment,'Enable','off');
        %panel groups
        set(handles.edit_groups,'Enable','on');
        set(handles.btn_setGroups,'Enable','on');
        set(handles.btn_editGroups,'Enable','off');
        %panel group-Sequences
        set(handles.pnl_groupSequences,'Visible','off');
        set(handles.combo_sequencesGroup,'Visible','off');
        set(handles.combo_sequencesGroup,'String','');
        set(handles.btn_selectSequences,'Visible','off');
        set(handles.btn_selectSequences,'Enable','off');
        set(handles.text16,'Visible','off');
        set(handles.list_assignedGroupSequence,'Visible','off');
        set(handles.list_assignedGroupSequence,'Enable','off');
        set(handles.list_assignedGroupSequence,'String','');
        set(handles.text18,'Visible','off');
        set(handles.list_unassignedGroupSequence,'Visible','off');
        set(handles.list_unassignedGroupSequence,'String','');
        set(handles.text19,'Visible','off');
        set(handles.btn_removeGroupSequence,'Visible','off');
        set(handles.btn_removeallGroupSequence,'Visible','off');
        set(handles.btn_removeGroupSequence,'Enable','off');
        set(handles.btn_removeallGroupSequence,'Enable','off');
        set(handles.btn_setGroupsSequences,'Visible','off');
        set(handles.btn_setGroupsSequences,'Enable','off');
        set(handles.btn_editGroupsSequences,'Visible','off');
        set(handles.btn_editGroupsSequences,'Enable','off');
        %panel group-Markers
        set(handles.pnl_groupMarkers,'Visible','off');
        set(handles.chk_assignMarkers,'Visible','off');
        set(handles.chk_assignMarkers,'Value',0);
        set(handles.combo_markersGroup,'Visible','off');
        set(handles.combo_markersMarker,'Visible','off');
        set(handles.combo_markersGroup,'String','');
        set(handles.combo_markersMarker,'String','');
        set(handles.btn_assignGroupMarker,'Visible','off');
        set(handles.btn_assignGroupMarker,'Enable','off');
        set(handles.text15,'Visible','off');
        set(handles.list_assignGroupMarker,'Visible','off');
        set(handles.list_assignGroupMarker,'String','');
        set(handles.text10,'Visible','off');
        set(handles.btn_removeGroupMarker,'Visible','off');
        set(handles.btn_removeallGroupMarker,'Visible','off');
        set(handles.btn_removeGroupMarker,'Enable','off');
        set(handles.btn_removeallGroupMarker,'Enable','off');
        set(handles.btn_setGroupsMarkers,'Visible','off');
        set(handles.btn_setGroupsMarkers,'Enable','off');
        set(handles.btn_editGroupsMarkers,'Visible','off');
        set(handles.btn_editGroupsMarkers,'Enable','off');
    else
        set(hObject,'Value',0)
    end
end
guidata(hObject,handles);

% --- Executes on button press in chk_assignMarkers.
function chk_assignMarkers_Callback(hObject, eventdata, handles)
% hObject    handle to chk_assignMarkers (see GCBO) eventdata  reserved -
% to be defined in a future version of MATLAB handles    structure with
% handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chk_assignMarkers
ToMarker=get(hObject,'Value');

if ToMarker == 1
    set(handles.btn_runExperiment,'Enable','off');
    set(handles.combo_markersGroup,'Visible','on');
    set(handles.combo_markersMarker,'Visible','on');
    set(handles.combo_markersGroup,'Enable','on');
    set(handles.combo_markersMarker,'Enable','on');
    set(handles.btn_assignGroupMarker,'Visible','on');
    set(handles.list_assignGroupMarker,'Visible','on');
    set(handles.list_assignGroupMarker,'Enable','off');
    set(handles.text15,'Visible','on');
    set(handles.btn_removeGroupMarker,'Visible','on');
    set(handles.btn_removeallGroupMarker,'Visible','on');
    set(handles.text10,'Visible','on');
    set(handles.btn_setGroupsMarkers,'Visible','on');
    set(handles.btn_setGroupsMarkers,'Enable','off');
    set(handles.btn_editGroupsMarkers,'Visible','on');
    set(handles.btn_editGroupsMarkers,'Enable','off');
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Enabling Groups and Markers from User entry
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    NbOfGroups=str2double(get(handles.edit_groups,'String'));
    Marcadores = ['Choose a Marker'; handles.allPossibleMarkers];
    Grupos = ['Choose a Group'; handles.allPossibleGroups];
    
    set(handles.combo_markersMarker,'String',Marcadores(1:NbOfGroups+1));
    set(handles.combo_markersGroup,'String',Grupos(1:NbOfGroups+1));
    set(handles.combo_markersMarker,'Value',1);
    set(handles.combo_markersGroup,'Value',1);
else
    Decision= AreYouSureDialogAssignMarkers;
    
    if strcmp(Decision,'Yes')
        
        set(handles.combo_markersGroup,'Visible','off');
        set(handles.combo_markersMarker,'Visible','off');
        set(handles.combo_markersGroup,'String','');
        set(handles.combo_markersMarker,'String','');
        set(handles.btn_assignGroupMarker,'Visible','off');
        set(handles.btn_assignGroupMarker,'Enable','off');
        set(handles.text15,'Visible','off');
        set(handles.list_assignGroupMarker,'Visible','off');
        set(handles.list_assignGroupMarker,'String','');
        set(handles.text10,'Visible','off');
        set(handles.btn_removeGroupMarker,'Visible','off');
        set(handles.btn_removeallGroupMarker,'Visible','off');
        set(handles.btn_removeGroupMarker,'Enable','off');
        set(handles.btn_removeallGroupMarker,'Enable','off');
        set(handles.btn_setGroupsMarkers,'Visible','off');
        set(handles.btn_setGroupsMarkers,'Enable','off');
        set(handles.btn_editGroupsMarkers,'Visible','off');
        set(handles.btn_editGroupsMarkers,'Enable','off');
        if(strcmp(get(handles.btn_setGroupsSequences,'Enable'),'off'))
            set(handles.btn_runExperiment,'Enable','on');
        else
            set(handles.btn_runExperiment,'Enable','off');
        end
    else
        set(hObject,'Value',1);
    end
end

guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function chk_manuallyGroup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to chk_manuallyGroup (see GCBO) eventdata  reserved -
% to be defined in a future version of MATLAB handles    empty - handles
% not created until after all CreateFcns called

% --- Executes on button press in chk_manuallyGroup.
function chk_manuallyGroup_Callback(hObject, eventdata, handles)
% hObject    handle to chk_manuallyGroup (see GCBO) eventdata  reserved -
% to be defined in a future version of MATLAB handles    structure with
% handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chk_manuallyGroup
ToGroup=get(hObject,'Value');

if ToGroup == 1
    set(handles.btn_runExperiment,'Enable','off');
    set(handles.pnl_groups,'Visible','on');
    set(handles.text1,'Visible','on');
    set(handles.edit_groups,'Enable','on');
    set(handles.edit_groups,'Visible','on');
    set(handles.text5,'Visible','on');
    set(handles.btn_setGroups,'Visible','on');
    set(handles.btn_editGroups,'Visible','on');
else
    Decision= AreYouSureDialogManuallyGroup;
    
    if strcmp(Decision,'Yes')
        
        if strcmp(get(handles.btn_setK,'Enable'),'off')==1
            set(handles.btn_runExperiment,'Enable','on');
        else
            set(handles.btn_runExperiment,'Enable','off');
        end
        %panel groups
        set(handles.pnl_groups,'Visible','off');
        set(handles.text1,'Visible','off');
        set(handles.edit_groups,'Enable','on');
        set(handles.edit_groups,'Visible','off');
        set(handles.text5,'Visible','off');
        set(handles.btn_setGroups,'Visible','off');
        set(handles.btn_setGroups,'Enable','on');
        set(handles.btn_editGroups,'Visible','off');
        set(handles.btn_editGroups,'Enable','off');
        %panel group-Sequences
        set(handles.pnl_groupSequences,'Visible','off');
        set(handles.combo_sequencesGroup,'Visible','off');
        set(handles.combo_sequencesGroup,'String','');
        set(handles.btn_selectSequences,'Visible','off');
        set(handles.btn_selectSequences,'Enable','off');
        set(handles.text16,'Visible','off');
        set(handles.list_assignedGroupSequence,'Visible','off');
        set(handles.list_assignedGroupSequence,'Enable','off');
        set(handles.list_assignedGroupSequence,'String','');
        set(handles.text18,'Visible','off');
        set(handles.list_unassignedGroupSequence,'Visible','off');
        set(handles.list_unassignedGroupSequence,'String','');
        set(handles.text19,'Visible','off');
        set(handles.btn_removeGroupSequence,'Visible','off');
        set(handles.btn_removeallGroupSequence,'Visible','off');
        set(handles.btn_removeGroupSequence,'Enable','off');
        set(handles.btn_removeallGroupSequence,'Enable','off');
        set(handles.btn_setGroupsSequences,'Visible','off');
        set(handles.btn_setGroupsSequences,'Enable','off');
        set(handles.btn_editGroupsSequences,'Visible','off');
        set(handles.btn_editGroupsSequences,'Enable','off');
        %panel group-Markers
        set(handles.pnl_groupMarkers,'Visible','off');
        set(handles.chk_assignMarkers,'Visible','off');
        set(handles.chk_assignMarkers,'Value',0);
        set(handles.combo_markersGroup,'Visible','off');
        set(handles.combo_markersMarker,'Visible','off');
        set(handles.combo_markersGroup,'String','');
        set(handles.combo_markersMarker,'String','');
        set(handles.btn_assignGroupMarker,'Visible','off');
        set(handles.btn_assignGroupMarker,'Enable','off');
        set(handles.text15,'Visible','off');
        set(handles.list_assignGroupMarker,'Visible','off');
        set(handles.list_assignGroupMarker,'String','');
        set(handles.text10,'Visible','off');
        set(handles.btn_removeGroupMarker,'Visible','off');
        set(handles.btn_removeallGroupMarker,'Visible','off');
        set(handles.btn_removeGroupMarker,'Enable','off');
        set(handles.btn_removeallGroupMarker,'Enable','off');
        set(handles.btn_setGroupsMarkers,'Visible','off');
        set(handles.btn_setGroupsMarkers,'Enable','off');
        set(handles.btn_editGroupsMarkers,'Visible','off');
        set(handles.btn_editGroupsMarkers,'Enable','off');
    else
        set(hObject,'Value',1)
    end
    
end

guidata(hObject,handles);

% --- Executes on selection change in combo_sequencesGroup.
function combo_sequencesGroup_Callback(hObject, eventdata, handles)
% hObject    handle to combo_sequencesGroup (see GCBO) eventdata  reserved
% - to be defined in a future version of MATLAB handles    structure with
% handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns
% combo_sequencesGroup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from
%        combo_sequencesGroup
if get(hObject,'Value')==1
    set(handles.btn_selectSequences,'Enable','off');
else
    set(handles.btn_selectSequences,'Enable','on');
end
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function combo_sequencesGroup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to combo_sequencesGroup (see GCBO) eventdata  reserved
% - to be defined in a future version of MATLAB handles    empty - handles
% not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function chk_assignMarkers_CreateFcn(hObject, eventdata, handles)
% hObject    handle to chk_assignMarkers (see GCBO) eventdata  reserved -
% to be defined in a future version of MATLAB handles    empty - handles
% not created until after all CreateFcns called

% --- Executes on button press in btn_setGroupsMarkers.
function btn_setGroupsMarkers_Callback(hObject, eventdata, handles)
% hObject    handle to btn_setGroupsMarkers (see GCBO) eventdata  reserved
% - to be defined in a future version of MATLAB handles    structure with
% handles and user data (see GUIDATA)
set(handles.btn_setGroupsMarkers,'Enable','off');
set(handles.btn_editGroupsMarkers,'Enable','on');
set(handles.combo_markersGroup,'Enable','off');
set(handles.combo_markersMarker,'Enable','off');
set(handles.list_assignGroupMarker,'Enable','off');
set(handles.btn_removeGroupMarker,'Enable','off');
set(handles.btn_removeallGroupMarker,'Enable','off');
if strcmp(get(handles.btn_setGroupsSequences,'Enable'),'off')
    if strcmp(get(handles.btn_editGroupsSequences,'Enable'),'off')
        set(handles.btn_runExperiment,'Enable','off');
    else
        set(handles.btn_runExperiment,'Enable','on');
    end
else
    set(handles.btn_runExperiment,'Enable','off');
end


%parsing group-marker
contentList = cellstr(get(handles.list_assignGroupMarker, 'String'));
% contentList
numbers_i=cell2mat(regexp(contentList,' '));
numbers_f=cell2mat(regexp(contentList,','));
numwin=[numbers_i(:,1)+1:numbers_f(:,1)-1];
symwin=[numbers_i(1,3)+1];
contentList=char(contentList);
numbers = str2mat(contentList(:,numwin));
symbols = contentList(:,symwin);
vector2(str2num(numbers(1:length(numbers))),1)=cellstr(symbols(1:length(symbols)));
handles.mVector=cell2mat(vector2);

guidata(hObject,handles);

function edit_kNumber_Callback(hObject, eventdata, handles)
% hObject    handle to edit_kNumber (see GCBO) eventdata  reserved - to be
% defined in a future version of MATLAB handles    structure with handles
% and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_kNumber as text
%        str2double(get(hObject,'String')) returns contents of edit_kNumber
%        as a double

% --- Executes on button press in btn_setK.
function btn_setK_Callback(hObject, eventdata, handles)
% hObject    handle to btn_setK (see GCBO) eventdata  reserved - to be
% defined in a future version of MATLAB handles    structure with handles
% and user data (see GUIDATA)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Validating number of K
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Num=str2num(get(handles.edit_kNumber,'String'));
if isempty(Num)
    errordlg('Introduce a valid number of K', 'Format number error');
    set(handles.edit_kNumber,'String','1');
else
    if Num<1 % if number of groups is < 1
        errordlg('The minimum number of K is 1.', 'Minimum number accepted error');
        set(handles.edit_kNumber,'String','1');
    else
        set(handles.btn_editK,'Enable','on');
        set(handles.btn_setK,'Enable','off');
        set(handles.edit_kNumber,'Enable','off');
        if get(handles.chk_manuallyGroup,'Value')==0
            set(handles.btn_runExperiment,'Enable','on');
        end
    end
    
end

guidata(hObject,handles);

% --- Executes on button press in btn_editK.
function btn_editK_Callback(hObject, eventdata, handles)
% hObject    handle to btn_editK (see GCBO) eventdata  reserved - to be
% defined in a future version of MATLAB handles    structure with handles
% and user data (see GUIDATA)
set(handles.btn_setK,'Enable','on');
set(handles.edit_kNumber,'Enable','on');
set(handles.btn_editK,'Enable','off');
set(handles.btn_runExperiment,'Enable','off');

% --- Executes on button press in btn_runExperiment.
function btn_runExperiment_Callback(hObject, eventdata, handles)
% hObject    handle to btn_runExperiment (see GCBO) eventdata  reserved -
% to be defined in a future version of MATLAB handles    structure with
% handles and user data (see GUIDATA)

disp('Starting Experiment with the following parameters:');
disp(strcat('Number of clusters=',get(handles.edit_kNumber,'String')));
disp('Number of replications=100');
disp('Distance metric=Euclidean');
disp('DNA-to-Signal Transformation=Voss');

set(handles.btn_changeFile,'Enable','off');
set(handles.list_previewHeaders,'Enable','off');
set(handles.list_previewSequences,'Enable','off');
set(handles.btn_editK,'Enable','off');
set(handles.chk_manuallyGroup,'Enable','off');
set(handles.btn_editGroups,'Enable','off');
set(handles.btn_editGroupsSequences,'Enable','off');
set(handles.chk_assignMarkers,'Enable','off');
set(handles.btn_editGroupsMarkers,'Enable','off');
set(handles.btn_runExperiment,'Enable','off');

guidata(hObject,handles);
drawnow;

headers=handles.header;
sequences=handles.seq;
k=str2double(get(handles.edit_kNumber,'String'));
MARKER_VECTOR = ['s';'o';'<';'>';'v';'^';'d';'p';'h';'*'];

fileName=get(handles.edit_fileName,'String');

%parsing headers
% for i=1:length(headers)
%     h=char(headers(1,i));
%     index=regexp(h,'\|');
%     headers(1,i)=cellstr(h(index(4)+1:length(h)));
% end

try
    %without manual grouping
    if get(handles.chk_manuallyGroup,'Value')==0
        %set group 1 for all sequecnes
        groups = cell(1,length(headers));
        groups(:) = {'1'};
        %Perform clustering
        KMeansClusteringForDNADataset(sequences,headers,groups,k,MARKER_VECTOR(1),fileName);
        
        %whit manual grouping
    else
        if get(handles.chk_assignMarkers,'Value')==0
            %predefined markers
            groups=handles.SequencesGroup(2,:);
            KMeansClusteringForDNADataset(sequences,headers,groups,k,MARKER_VECTOR(1:str2double(get(handles.edit_groups,'String'))),fileName);
        else
            %user markers
            groups=handles.SequencesGroup(2,:);
            KMeansClusteringForDNADataset(sequences,headers,groups,k,handles.mVector,fileName);
        end
    end
 catch ME
     message=sprintf('Error generating clusters:\n%s\nTry again with the same configuration',ME.message);
     uiwait(warndlg(message));
     disp('Error generating clusters. Try again with the same configuration');
end

disp('Experiment Done');
set(handles.btn_changeFile,'Enable','on');
set(handles.list_previewHeaders,'Enable','on');
set(handles.list_previewSequences,'Enable','on');
set(handles.btn_editK,'Enable','on');
set(handles.chk_manuallyGroup,'Enable','on');
set(handles.btn_editGroups,'Enable','on');
set(handles.btn_editGroupsSequences,'Enable','on');
set(handles.chk_assignMarkers,'Enable','on');
set(handles.btn_editGroupsMarkers,'Enable','on');
set(handles.btn_runExperiment,'Enable','on');

guidata(hObject,handles);



% --- Executes on button press in btn_openFile.
function btn_openFile_Callback(hObject, eventdata, handles)
% hObject    handle to btn_openFile (see GCBO) eventdata  reserved - to be
% defined in a future version of MATLAB handles    structure with handles
% and user data (see GUIDATA)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Opening file & enabling buttons
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

try
   
[f ,filepath] = uigetfile({'*.txt';'*.fasta'});
if ~isequal(f, 0)
    file=strcat(filepath,f);
    [HEADER, SEQ]=fastaread(file);
    handles.header=HEADER;
    handles.seq=SEQ;
    
    set(handles.edit_fileName,'String',f);
    set(handles.edit_totalSequences,'String',size(HEADER,2));
    set(handles.list_previewHeaders,'string',HEADER);
    set(handles.list_previewSequences,'string',SEQ);
    %set visible and enabled
    set(handles.btn_openFile,'Enable','off');
    set(handles.btn_changeFile,'Enable','on');
    set(handles.text11,'Visible','on');
    set(handles.edit_fileName,'Visible','on');
    set(handles.text12,'Visible','on');
    set(handles.edit_totalSequences,'Visible','on');
    set(handles.pnl_preview,'Visible','on');
    set(handles.pnl_experiment,'Visible','on');
    set(handles.pnl_cluster,'Visible','on');
    set(handles.text6,'Visible','on');
    set(handles.edit_kNumber,'Visible','on');
    set(handles.btn_setK,'Visible','on');
    set(handles.btn_editK,'Visible','on');
    set(handles.chk_manuallyGroup,'Visible','on');
else
end
    catch ME
    message=sprintf('Error openin file:\n%s',ME.message);
    uiwait(warndlg(message));
end

guidata(hObject,handles);

% --- Executes on button press in btn_changeFile.
function btn_changeFile_Callback(hObject, eventdata, handles)
% hObject    handle to btn_changeFile (see GCBO) eventdata  reserved - to
% be defined in a future version of MATLAB handles    structure with
% handles and user data (see GUIDATA)

ToPush=get(hObject,'Value');

if ToPush == 1
    
    Decision= AreYouSureDialogChangeFile;
    
    if strcmp(Decision,'Yes')
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %Viewing and enabling elements
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        set(handles.btn_runExperiment,'Enable','off');
        %panel file
        set(handles.btn_openFile,'Enable','on');
        set(handles.btn_changeFile,'Enable','off');
        set(handles.text11,'Visible','off');
        set(handles.edit_fileName,'Visible','off');
        set(handles.edit_fileName,'String','');
        set(handles.text12,'Visible','off');
        set(handles.edit_totalSequences,'Visible','off');
        set(handles.edit_totalSequences,'String','');
        set(handles.pnl_preview,'Visible','off');
        set(handles.list_previewHeaders,'String','');
        set(handles.list_previewSequences,'String','');
        %panel experiment
        set(handles.pnl_experiment,'Visible','off');
        %panel cluster
        set(handles.pnl_cluster,'Visible','off');
        set(handles.text6,'Visible','off');
        set(handles.edit_kNumber,'Visible','off');
        set(handles.edit_kNumber,'Enable','on');
        set(handles.edit_kNumber,'String','1');
        set(handles.btn_setK,'Visible','off');
        set(handles.btn_setK,'Enable','on');
        set(handles.btn_editK,'Visible','off');
        set(handles.btn_editK,'Enable','off');
        set(handles.chk_manuallyGroup,'Visible','off');
        set(handles.chk_manuallyGroup,'Value',0);
        %panel groups
        set(handles.pnl_groups,'Visible','off');
        set(handles.text1,'Visible','off');
        set(handles.edit_groups,'Enable','on');
        set(handles.edit_groups,'Visible','off');
        set(handles.edit_groups,'String','1');
        set(handles.text5,'Visible','off');
        set(handles.btn_setGroups,'Visible','off');
        set(handles.btn_setGroups,'Enable','on');
        set(handles.btn_editGroups,'Visible','off');
        set(handles.btn_editGroups,'Enable','off');
        %panel group-Sequences
        set(handles.pnl_groupSequences,'Visible','off');
        set(handles.combo_sequencesGroup,'Visible','off');
        set(handles.combo_sequencesGroup,'String','');
        set(handles.btn_selectSequences,'Visible','off');
        set(handles.btn_selectSequences,'Enable','off');
        set(handles.text16,'Visible','off');
        set(handles.list_assignedGroupSequence,'Visible','off');
        set(handles.list_assignedGroupSequence,'Enable','off');
        set(handles.list_assignedGroupSequence,'String','');
        set(handles.text18,'Visible','off');
        set(handles.list_unassignedGroupSequence,'Visible','off');
        set(handles.list_unassignedGroupSequence,'String','');
        set(handles.text19,'Visible','off');
        set(handles.btn_removeGroupSequence,'Visible','off');
        set(handles.btn_removeallGroupSequence,'Visible','off');
        set(handles.btn_removeGroupSequence,'Enable','off');
        set(handles.btn_removeallGroupSequence,'Enable','off');
        set(handles.btn_setGroupsSequences,'Visible','off');
        set(handles.btn_setGroupsSequences,'Enable','off');
        set(handles.btn_editGroupsSequences,'Visible','off');
        set(handles.btn_editGroupsSequences,'Enable','off');
        %panel group-Markers
        set(handles.pnl_groupMarkers,'Visible','off');
        set(handles.chk_assignMarkers,'Visible','off');
        set(handles.chk_assignMarkers,'Value',0);
        set(handles.combo_markersGroup,'Visible','off');
        set(handles.combo_markersMarker,'Visible','off');
        set(handles.combo_markersGroup,'String','');
        set(handles.combo_markersMarker,'String','');
        set(handles.btn_assignGroupMarker,'Visible','off');
        set(handles.btn_assignGroupMarker,'Enable','off');
        set(handles.text15,'Visible','off');
        set(handles.list_assignGroupMarker,'Visible','off');
        set(handles.list_assignGroupMarker,'String','');
        set(handles.text10,'Visible','off');
        set(handles.btn_removeGroupMarker,'Visible','off');
        set(handles.btn_removeallGroupMarker,'Visible','off');
        set(handles.btn_removeGroupMarker,'Enable','off');
        set(handles.btn_removeallGroupMarker,'Enable','off');
        set(handles.btn_setGroupsMarkers,'Visible','off');
        set(handles.btn_setGroupsMarkers,'Enable','off');
        set(handles.btn_editGroupsMarkers,'Visible','off');
        set(handles.btn_editGroupsMarkers,'Enable','off');
    else
        set(hObject,'Value',0)
    end
end
% Update handles structure
guidata(hObject, handles);

% --- Executes on button press in btn_selectSequences.
function btn_selectSequences_Callback(hObject, eventdata, handles)
% hObject    handle to btn_selectSequences (see GCBO) eventdata  reserved -
% to be defined in a future version of MATLAB handles    structure with
% handles and user data (see GUIDATA)

% Show multiple selection list for unassigned sequences
d = get(handles.list_unassignedGroupSequence,'String');
[s,v] = listdlg('PromptString','Select sequence(s):',...
    'SelectionMode','multiple',...
    'ListString',d) ;

if v==1
    % Get selected sequences
    assignment = cellstr(get(handles.list_unassignedGroupSequence,'String'));
    for i=1:length(s)
        index=cell2mat(regexp(assignment(s(i)),' '));
        new_a=char(assignment(s(i)));
        idSequence=new_a(index(1)+1:index(2)-2);
        handles.SequencesGroup(2,str2num(idSequence))=cellstr(num2str(get(handles.combo_sequencesGroup,'Value')-1));
    end
    
    %Get and load assigned and unassigned sequences
    unassignedindex = find(strcmp(handles.SequencesGroup(2,:),'0'));
    assignedindex = find(not(strcmp(handles.SequencesGroup(2,:),'0')));
    assignedSequences = strcat({'Group '},cellstr(handles.SequencesGroup(2,assignedindex)),{' - '},cellstr(handles.SequencesGroup(1,assignedindex)));
    set(handles.list_assignedGroupSequence,'String',assignedSequences);
    set(handles.list_assignedGroupSequence,'Enable','on');
    set(handles.list_unassignedGroupSequence,'String',handles.SequencesGroup(1,unassignedindex));
    set(handles.combo_sequencesGroup,'Value',1);
    set(handles.btn_selectSequences,'Enable','off');
    set(handles.btn_removeallGroupSequence,'Enable','on');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Viewing and enabling elements
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if isempty(get(handles.list_unassignedGroupSequence,'String'))
    set(handles.list_unassignedGroupSequence,'Enable','off');
    set(handles.combo_sequencesGroup,'Enable','off');
    set(handles.btn_setGroupsSequences,'Enable','on');
else
    set(handles.list_unassignedGroupSequence,'Enable','on');
    set(handles.combo_sequencesGroup,'Enable','on');
    set(handles.btn_setGroupsSequences,'Enable','off');
end

guidata(hObject,handles);

% --- Executes on selection change in list_assignedGroupSequence.
function list_assignedGroupSequence_Callback(hObject, eventdata, handles)
% hObject    handle to list_assignedGroupSequence (see GCBO) eventdata
% reserved - to be defined in a future version of MATLAB handles
% structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns
% list_assignedGroupSequence contents as cell array
%        contents{get(hObject,'Value')} returns selected item from
%        list_assignedGroupSequence

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Viewing and enabling elements
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if isempty(get(hObject,'String'))
    set(handles.btn_removeGroupSequence,'Enable','off');
    set(handles.btn_removeallGroupSequence,'Enable','off');
    set(handles.list_assignedGroupSequence,'Enable','off');
else
    set(handles.btn_removeGroupSequence,'Enable','on');
    set(handles.btn_removeallGroupSequence,'Enable','on');
    set(handles.list_assignedGroupSequence,'Enable','on');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Saving values of list_assignedGroupSequence for removal
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
selectedValueGroupSequence = get(handles.list_assignedGroupSequence, 'Value');
handles.selectedValueGroupSequence = selectedValueGroupSequence;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function list_assignedGroupSequence_CreateFcn(hObject, eventdata, handles)
% hObject    handle to list_assignedGroupSequence (see GCBO) eventdata
% reserved - to be defined in a future version of MATLAB handles    empty -
% handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_setGroupsSequences.
function btn_setGroupsSequences_Callback(hObject, eventdata, handles)
% hObject    handle to btn_setGroupsSequences (see GCBO) eventdata
% reserved - to be defined in a future version of MATLAB handles
% structure with handles and user data (see GUIDATA)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Viewing and enabling elements
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(handles.btn_setGroupsSequences,'Enable','off');
set(handles.btn_editGroupsSequences,'Enable','on');
set(handles.combo_sequencesGroup,'Enable','off');
set(handles.btn_selectSequences,'Enable','off');
set(handles.list_assignedGroupSequence,'Enable','off');
set(handles.list_unassignedGroupSequence,'Enable','off');
set(handles.btn_removeGroupSequence,'Enable','off');
set(handles.btn_removeallGroupSequence,'Enable','off');

if get(handles.chk_assignMarkers,'Value')==0
    set(handles.btn_runExperiment,'Enable','on');
else
    if strcmp(get(handles.btn_setGroupsMarkers,'Enable'),'off')
        if strcmp(get(handles.btn_editGroupsMarkers,'Enable'),'off')
            set(handles.btn_runExperiment,'Enable','off');
        else
            set(handles.btn_runExperiment,'Enable','on');
        end
    else
        set(handles.btn_runExperiment,'Enable','off');
    end
end
guidata(hObject, handles);

% --- Executes on selection change in list_unassignedGroupSequence.
function list_unassignedGroupSequence_Callback(hObject, eventdata, handles)
% hObject    handle to list_unassignedGroupSequence (see GCBO) eventdata
% reserved - to be defined in a future version of MATLAB handles
% structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns
% list_unassignedGroupSequence contents as cell array
%        contents{get(hObject,'Value')} returns selected item from
%        list_unassignedGroupSequence

% --- Executes during object creation, after setting all properties.
function list_unassignedGroupSequence_CreateFcn(hObject, eventdata, handles)
% hObject    handle to list_unassignedGroupSequence (see GCBO) eventdata
% reserved - to be defined in a future version of MATLAB handles    empty -
% handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_removeGroupSequence.
function btn_removeGroupSequence_Callback(hObject, eventdata, handles)
% hObject    handle to btn_removeGroupSequence (see GCBO) eventdata
% reserved - to be defined in a future version of MATLAB handles
% structure with handles and user data (see GUIDATA)

%get selected idsequence
assignedGroupSequences=cellstr(get(handles.list_assignedGroupSequence,'String'));
assignedGroupSequences2=assignedGroupSequences{handles.selectedValueGroupSequence};
index=regexp(assignedGroupSequences2,' ');
idSequence=assignedGroupSequences2(1,index(4)+1:index(5)-2);

%set group 0 for idsequence in SequencesGroup cellarray
handles.SequencesGroup(2,str2num(idSequence))=cellstr('0');

%get and load assigned and unassigned sequences
unassignedindex = find(strcmp(handles.SequencesGroup(2,:),'0'));
assignedindex = find(not(strcmp(handles.SequencesGroup(2,:),'0')));
assignedSequences = strcat({'Group '},handles.SequencesGroup(2,assignedindex),{' - '},handles.SequencesGroup(1,assignedindex));
set(handles.list_assignedGroupSequence,'String',assignedSequences);
set(handles.list_unassignedGroupSequence,'String',handles.SequencesGroup(1,unassignedindex));
set(handles.list_assignedGroupSequence, 'Value',1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Viewing and enabling elements
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if isempty(get(handles.list_assignedGroupSequence,'String'))
    set(handles.list_assignedGroupSequence,'Enable','off');
    set(handles.btn_removeallGroupSequence,'Enable','off');
end
set(handles.btn_removeGroupSequence,'Enable','off');
set(handles.list_unassignedGroupSequence,'Enable','on');
set(handles.combo_sequencesGroup,'Enable','on');
set(handles.btn_setGroupsSequences,'Enable','off');

guidata(hObject,handles);

% --- Executes on button press in btn_removeallGroupSequence.
function btn_removeallGroupSequence_Callback(hObject, eventdata, handles)
% hObject    handle to btn_removeallGroupSequence (see GCBO) eventdata
% reserved - to be defined in a future version of MATLAB handles
% structure with handles and user data (see GUIDATA)
ToPush=get(hObject,'Value');

if ToPush == 1
    
    Decision= AreYouSureDialogRemoveAll;
    %     Decision= AreYouSureDialog;
    
    if strcmp(Decision,'Yes')
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %Enabling Groups from User entry
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        Grupos = ['Choose a Group'; handles.allPossibleGroups];
        set(handles.combo_sequencesGroup,'String',Grupos(1:str2double(get(handles.edit_groups,'String'))+1));
        set(handles.combo_sequencesGroup,'Value',1);
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %Create and load unasigned sequences
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        SequencesGroup = cellfun(@num2str,num2cell(1:length(handles.header)),'uniformoutput',0);
        group = cell(1,length(handles.header));
        group(:) = {'0'};
        SequencesGroup = [SequencesGroup; group];
        SequencesGroup(1,:)=strcat({'Sequence '}, SequencesGroup(1,:),{': '},handles.header);
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %Viewing and enabling elements
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        set(handles.list_unassignedGroupSequence,'String',SequencesGroup(1,:));
        set(handles.list_assignedGroupSequence,'String','');
        set(handles.list_assignedGroupSequence,'Enable','off');
        set(handles.list_unassignedGroupSequence,'Enable','on');
        set(handles.btn_removeallGroupSequence,'Enable','off');
        set(handles.btn_removeGroupSequence,'Enable','off');
        set(handles.combo_sequencesGroup,'Enable','on');
        set(handles.btn_setGroupsSequences,'Enable','off');
        
        %update SequencesGroup
        handles.SequencesGroup=SequencesGroup;
        
    else
        set(hObject,'Value',0)
    end
end
guidata(hObject,handles);

% --- Executes on button press in btn_editGroupsMarkers.
function btn_editGroupsMarkers_Callback(hObject, eventdata, handles)
% hObject    handle to btn_editGroupsMarkers (see GCBO) eventdata  reserved
% - to be defined in a future version of MATLAB handles    structure with
% handles and user data (see GUIDATA)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Viewing and enabling elements
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(handles.btn_setGroupsMarkers,'Enable','on');
set(handles.btn_editGroupsMarkers,'Enable','off');
set(handles.combo_markersGroup,'Enable','on');
set(handles.combo_markersMarker,'Enable','on');
set(handles.list_assignGroupMarker,'Enable','on');
set(handles.btn_removeGroupMarker,'Enable','off');
set(handles.btn_removeallGroupMarker,'Enable','on');
set(handles.btn_runExperiment,'Enable','off');

guidata(hObject, handles);

% --- Executes on button press in btn_editGroupsSequences.
function btn_editGroupsSequences_Callback(hObject, eventdata, handles)
% hObject    handle to btn_editGroupsSequences (see GCBO) eventdata
% reserved - to be defined in a future version of MATLAB handles
% structure with handles and user data (see GUIDATA)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Viewing and enabling elements
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(handles.btn_setGroupsSequences,'Enable','on');
set(handles.btn_editGroupsSequences,'Enable','off');
set(handles.list_assignedGroupSequence,'Enable','on');
set(handles.list_unassignedGroupSequence,'Enable','on');
set(handles.btn_removeallGroupSequence,'Enable','on');
set(handles.btn_runExperiment,'Enable','off');

guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function btn_selectSequences_CreateFcn(hObject, eventdata, handles)
% hObject    handle to btn_selectSequences (see GCBO) eventdata  reserved -
% to be defined in a future version of MATLAB handles    empty - handles
% not created until after all CreateFcns called
