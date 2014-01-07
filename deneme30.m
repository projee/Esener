function varargout = deneme30(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @deneme30_OpeningFcn, ...
                   'gui_OutputFcn',  @deneme30_OutputFcn, ...
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

function deneme30_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);
global abc;
abc=1;
set(handles.orgIm,'HandleVisibility','ON');
axes(handles.orgIm);
axis equal;
axis tight;
axis off;
set(handles.orgIm,'HandleVisibility','OFF');

function varargout = deneme30_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


function load_image_Callback(hObject, eventdata, handles)
[filename, pathname] = uigetfile('*.jpg', 'Select an Image');
if ~isequal(filename,0)
   img=fullfile(pathname,filename);
set(handles.edit1, 'String', filename);
if ~isempty(img)
im_original=imread(char(img));
set(handles.orgIm,'HandleVisibility','ON');
axes(handles.orgIm);
image(im_original);
axis equal;
axis tight;
axis off;
set(handles.orgIm,'HandleVisibility','OFF');
handles.filename=filename;
handles.pathname=pathname;
guidata(hObject,handles);
end;
end;


function edit1_Callback(hObject, eventdata, handles)


function edit1_CreateFcn(hObject, eventdata, handles)
axis off;
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function soft_button_Callback(hObject, eventdata, handles)  
filename=handles.filename;
pathname=handles.pathname;
 
img=fullfile(pathname,filename);

if ~isempty(img)
img_soft=imread(char(img));
img_soft = imadjust(img_soft,[0.20 0.00 0.00; 0.70 1.00 1.00],[]);
image(img_soft);
axis equal;
axis tight;
axis off;
end

function hard_button_Callback(hObject, eventdata, handles)
SE = strel('Disk',18);
filename=handles.filename;
pathname=handles.pathname;
img=fullfile(pathname,filename);
if ~isempty(img)
img_hard=imread(char(img));
img_hard = imsubtract(imadd(img_hard,imtophat(img_hard,SE)),imbothat(img_hard,SE));
image(img_hard);
axis equal;
axis tight;
axis off;
end

function dark_button_Callback(hObject, eventdata, handles)
filename=handles.filename;
pathname=handles.pathname;
img=fullfile(pathname,filename);
if ~isempty(img)
img_dark=imread(char(img));
img_dark = imadjust(img_dark,[0.3; 0.75],[], 0.8);
image(img_dark);
axis equal;
axis tight;
axis off;
end

function light_button_Callback(hObject, eventdata, handles)
filename=handles.filename;
pathname=handles.pathname;
img=fullfile(pathname,filename);
if ~isempty(img)
img_light=imread(char(img));
img_light = imadjust(img_light,[0.05; 0.45],[],1.4);
image(img_light);
axis equal;
axis tight;
axis off;
end

function reverse_button_Callback(hObject, eventdata, handles)
filename=handles.filename;
pathname=handles.pathname;
img=fullfile(pathname,filename);
if ~isempty(img)
img_reverse=imread(char(img));
img_reverse =  imadjust(img_reverse,[0.30; 0.85],[0.90; 0.00], 0.90);
image(img_reverse);
axis equal;
axis tight;
axis off;
end

function vintage_button_Callback(hObject, eventdata, handles)
filename=handles.filename;
pathname=handles.pathname;
img=fullfile(pathname,filename);
if ~isempty(img)
img_vintage=imread(char(img));
img_vintage = imadjust(img_vintage,[.2 .3 0; .6 .7 1],[]);
image(img_vintage);
axis equal;
axis tight;
axis off;
end

function red_button_Callback(hObject, eventdata, handles)
filename=handles.filename;
pathname=handles.pathname;
img=fullfile(pathname,filename);
if ~isempty(img)
img_red=imread(char(img));
img_red = imadjust(img_red,[.02 .2 0; .3 .6 1],[]);
image(img_red);
axis equal;
axis tight;
axis off;
end

function purple_button_Callback(hObject, eventdata, handles)
filename=handles.filename;
pathname=handles.pathname;
img=fullfile(pathname,filename);
if ~isempty(img)
img_purple=imread(char(img));
img_purple = imadjust(img_purple,[.02 .2 0; .6 .8 0.3],[]);
image(img_purple);
axis equal;
axis tight;
axis off;
end

function green_button_Callback(hObject, eventdata, handles)
filename=handles.filename;
pathname=handles.pathname;
img=fullfile(pathname,filename);
if ~isempty(img)
img_green=imread(char(img));
img_green = imadjust(img_green,[.02 .2 0; .6 .8 0.3],[0.9; 0.09],0.9);
image(img_green);
axis equal;
axis tight;
axis off;
end

function blue_button_Callback(hObject, eventdata, handles)
filename=handles.filename;
pathname=handles.pathname;
img=fullfile(pathname,filename);
if ~isempty(img)
img_blue=imread(char(img));
img_blue = imadjust(img_blue,[.02 .2 0.7; .1 .7 0.8],[0.9; 0.1],0.8);
image(img_blue);
axis equal;
axis tight;
axis off;
end


function black_button_Callback(hObject, eventdata, handles)
filename=handles.filename;
pathname=handles.pathname;
img=fullfile(pathname,filename);
if ~isempty(img)
img_black=imread(char(img));
img_black = rgb2gray(img_black);
image(img_black);
colormap(gray(256));
axis equal;
axis tight;
axis off;
end


function button_sketch_Callback(hObject, eventdata, handles)
filename=handles.filename;
pathname=handles.pathname;
img=fullfile(pathname,filename);
if ~isempty(img)
img_en=imread(char(img));
imgEnhanced = entropyfilt(img_en,getnhood(strel('Disk',4)));
imgEnhanced = imgEnhanced/max(imgEnhanced(:));
imgEnhanced = imadjust(imgEnhanced,[0.40; 0.95],[0.50; 0.00], 0.90);
image(imgEnhanced);
axis equal;
axis tight;
axis off;
end

function button_noisy_Callback(hObject, eventdata, handles)
filename=handles.filename;
pathname=handles.pathname;
img=fullfile(pathname,filename);
if ~isempty(img)
img_r=imread(char(img));
img_r = imnoise(img_r,'gaussian',0.02);
image(img_r);
axis equal;
axis tight;
axis off;
end


function button_left_Callback(hObject, eventdata, handles)
img=getimage();
if ~isempty(img)
img = imrotate(img,90);
image(img);
axis equal;
axis tight;
axis off;
end

function button_right_Callback(hObject, eventdata, handles)
img=getimage();
if ~isempty(img)
img = imrotate(img,-90);
image(img);
axis equal;
axis tight;
axis off;
end


function exit_button_Callback(hObject, eventdata, handles)
close all

function save_button_Callback(hObject, eventdata, handles)
I=getimage();
if ~isempty(I)
[FileName, PathName] = uiputfile('*.jpg', 'Save As');
Name = fullfile(PathName,FileName);
set(handles.newIm,'HandleVisibility','ON');
axes(handles.newIm);
imwrite(I, Name, 'jpg');
else
msgbox('Resim ya da Efekt Seçilmedi');
end

function button_background_Callback(hObject, eventdata, handles)
global abc;
if abc==1
pathname='%HOMEPATH%/Desktop';
filename='bg1.jpg';
ha = axes('units','normalized','position',[0 0 1 1]);
uistack(ha,'bottom');
img=imread(filename);
imagesc(img);
set(ha,'handlevisibility','off','visible','off');
abc=2;
end
