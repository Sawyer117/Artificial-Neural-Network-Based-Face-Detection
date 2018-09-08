function varargout = AutoFaceDetect(varargin)
% AUTOFACEDETECT M-file for AutoFaceDetect.fig
%      AUTOFACEDETECT, by itself, creates a new AUTOFACEDETECT or raises the existing
%      singleton*.
%
%      H = AUTOFACEDETECT returns the handle to a new AUTOFACEDETECT or the handle to
%      the existing singleton*.
%
%      AUTOFACEDETECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AUTOFACEDETECT.M with the given input arguments.
%
%      AUTOFACEDETECT('Property','Value',...) creates a new AUTOFACEDETECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before AutoFaceDetect_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to AutoFaceDetect_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AutoFaceDetect

% Last Modified by GUIDE v2.5 18-Apr-2016 22:58:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AutoFaceDetect_OpeningFcn, ...
                   'gui_OutputFcn',  @AutoFaceDetect_OutputFcn, ...
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


% --- Executes just before AutoFaceDetect is made visible.
function AutoFaceDetect_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to AutoFaceDetect (see VARARGIN)

global pic_cut down;   
pic_cut=0;
down=0;
axes(handles.axes2);
set(gca,'ytick',[]);
set(gca,'xtick',[]);
axes(handles.axes3);
set(gca,'ytick',[]);
set(gca,'xtick',[]);
axes(handles.axes4);
set(gca,'ytick',[]);
set(gca,'xtick',[]);
axes(handles.axes5);
set(gca,'ytick',[]);
set(gca,'xtick',[]);
% Choose default command line output for AutoFaceDetect
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes AutoFaceDetect wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = AutoFaceDetect_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in ImageLoad.
function ImageLoad_Callback(hObject, eventdata, handles)
% hObject    handle to ImageLoad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname]=uigetfile({'*.bmp;*.jpg;*.gif','(*.bmp;*.jpg;*.gif)';'*.bmp','(*.bmp)';'*.jpg','(*.jpg)';'*.gif','(*.gif)';},'打开图片');

A=imread([pathname,filename]);
cla(handles.axes1);
axes(handles.axes1);
imshow(A);
handles.image=A;
guidata(hObject,handles);





% --- Executes on button press in crop.
function crop_Callback(hObject, eventdata, handles)
% hObject    handle to crop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pic_cut;
pic_cut=1;

handles.begin_point=get(gca,'currentpoint'); %先初始化开始的点的坐标，否则程序会报错
guidata(hObject,handles);


% --- Executes on button press in save.
function save_Callback(hObject, eventdata, handles)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

newdata=handles.newdata;

 [file,path]=uiputfile('*.jpg;','保存图像');
 filename=fullfile(path,file);     
 imwrite(newdata,filename);  


% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function figure1_WindowButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global pic_cut down;
down=1;
if pic_cut==1&&down==1
    begin_point=get(gca,'currentpoint'); %------按下鼠标左键时取得鼠标当前的坐标值-------
    handles.begin_point=begin_point;
end
guidata(hObject,handles);

% --- Executes on mouse motion over figure - except title and menu.
function figure1_WindowButtonMotionFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pic_cut down;
if pic_cut==1&&down==1
    begin_point=handles.begin_point;
    end_point=get(gca,'currentpoint'); %----------鼠标移动时取得鼠标当前的坐标值-------
    
    x0=begin_point(1,1);
    y0=begin_point(1,2);
    x=end_point(1,1);
    y=end_point(1,2);
    
    width=abs(x-x0);
    height=abs(y-y0);
    
   rect=[min(x,x0) min(y, y0) width height];
   
   if width*height~=0       
    data=handles.image;
    axes(handles.axes1);
    imshow(data);
    %------------用rectangle函数显示选中的图像截取区域------------------------
    rectangle('Position',rect,'edgecolor','g','LineWidth',2,'LineStyle','--');
    
    handles.rect=rect;
    guidata(hObject,handles);
   end
end
guidata(hObject,handles);


% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function figure1_WindowButtonUpFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pic_cut down;

if pic_cut==1
    rect=handles.rect;
    data=handles.image;
    newdata=imcrop(data,rect);%------截取图像的选中区域---------
    axes(handles.axes1);
     A=handles.image;
     imshow(A);
    rectangle('Position',rect,'edgecolor','g','LineWidth',2,'LineStyle','--');
   %cla;%----------取消图像上的矩形选中区域---------------
   axes(handles.axes2);
   imshow(newdata);

   pic_cut=0;
   down=0;
   handles.newdata=newdata;
   guidata(hObject,handles);
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
A=handles.image;
axes(handles.axes1);
imshow(A);
B=zeros(20,20);
axes(handles.axes2);
imshow(B);
%state2=num2str(N/A);
set(handles.text2,'string','N/A');


% --- Executes on button press in Neural.
function Neural_Callback(hObject, eventdata, handles)
% hObject    handle to Neural (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I=handles.newdata;
%% Preprocessing

 f=imresize(rgb2gray(I),[20,20]);

   f=Hist_Equalization(CorrectLight(f));
    f(1,1:4)=0;f(1,17:20)=0;
    f(2,1:3)=0;f(2,18:20)=0;
    f(3,1:2)=0;f(3,19:20)=0;
    f(4,1)=0;f(4,20)=0;
    
    f(17,1)=0;f(17,20)=0;
    f(18,1:2)=0;f(18,19:20)=0;
    f(19,1:3)=0;f(19,18:20)=0;
    f(20,1:4)=0;f(20,17:20)=0;
    I=f;
    I=reshape(I,[400 1]);
    %%
load('E:\Course Documentation\Master-Uottawa\2015Winter\ELG7172 Topics in Signal Processing\Face Detection Project\net.mat');

y=sim(net,I);
state1=num2str(y);
set(handles.text2,'string',state1);

%I=handles.newdata;
%I=rgb2gray(I);
%[row,col]=size(I);
%ratio=max(row,col)/20


% --- Executes on button press in AutoFaceDetect.
function AutoFaceDetect_Callback(hObject, eventdata, handles)
% hObject    handle to AutoFaceDetect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% 
global MP;
I=handles.newdata;
I=rgb2gray(I);
[row,col]=size(I);
%% 
A=handles.image;
%rect=handles.rect;
%ratio=max(rect(3),rect(4))/20;
ratio=max(row,col)/20;
handles.ratio=ratio;
load('E:\课程记录\研究生-渥太华大学\2016Winter\ELG7172 Topics in Signal Processing\Project-Face Detection\NetWorkDataFile\net100.mat');
load('E:\课程记录\研究生-渥太华大学\2016Winter\ELG7172 Topics in Signal Processing\Project-Face Detection\NetWorkDataFile\Nnet100.mat');
axes(handles.axes1);
%% 
Image=rgb2gray(A);
Image=imresize(Image,1/ratio);




Ss=0;

Gap=2;

[n,m]=size(Image);
MP=zeros(n,m);

for i=1:Gap:n
    for j=1:Gap:m
        
       if ((i+19+Gap<n)&&(j+19+Gap<m))

            plate=Image(i:i+19,j:j+19);
          Ss=Ss+1
          set(handles.text4,'string',num2str(Ss));
          %%  f=Hist_Equalization(CorrectLight(plate));
     plate=Hist_Equalization(CorrectLight(plate));
    plate(1,1:4)=0;plate(1,17:20)=0;
    plate(2,1:3)=0;plate(2,18:20)=0;
    plate(3,1:2)=0;plate(3,19:20)=0;
    plate(4,1)=0;plate(4,20)=0;
    
    plate(17,1)=0;plate(17,20)=0;
    plate(18,1:2)=0;plate(18,19:20)=0;
    plate(19,1:3)=0;plate(19,18:20)=0;
    plate(20,1:4)=0;plate(20,17:20)=0;
    I1=plate;
    I1=reshape(I1,[400 1]);
       
       y1=sim(Nnet100,I1);
        y2=sim(net100,I1);
         y=0.5*y1+0.5*y2;
         MP(i,j)=y;
      
  MP(i,j)=y;
 
       if y>0.90      
           rectangle('Position',[j*ratio,i*ratio,20*ratio,20*ratio],'edgecolor',[0.93 0.78 0.06],'LineWidth',2);
       end
     
       end
       %% 

       %% 
    end
end
%handles.MP=MP;
  axes(handles.axes3);
  imshow(MP);
  guidata(hObject,handles);
%end


% --- Executes on button press in Merging.
function Merging_Callback(hObject, eventdata, handles)
% hObject    handle to Merging (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global MP;
%MP=handles.MP;
A=handles.image;
ratio=handles.ratio;
axes(handles.axes1);
%cla;
cla(handles.axes1);
imshow(A);
[zz xx]=size(MP);
J=zeros(zz,xx);

for iii=1:zz
    for jjj=1:xx
        
     if MP(iii,jjj)>0.98
         J(iii,jjj)=1;
     end
     
    end
end


% se=[0,1,0;
%    1,1,1;
%     0,1,0];
    
    se=[1,0;
    0,0];
%     

Ff=imerode(J,se);

axes(handles.axes4);imshow(J);
axes(handles.axes5);imshow(Ff);

%figure,imshow(Image1);
[pp qq]=size(Ff);
pointer=zeros(1,2);
pointer(1,:)=[];

point=0;

for vv=1:pp
    for cc=1:qq
        if Ff(vv,cc)==1
            vect=[vv cc];
            pointer=[pointer;vect];

        end
    end
end

[s,s1]=size(pointer);

distance=zeros(1,3);
d_for_s=zeros();


for iter=1:s
    dis=sqrt(pointer(iter,1)^2+pointer(iter,2)^2);
    distance=[distance;dis,pointer(iter,1),pointer(iter,2)];
    
    d_for_s=[d_for_s,dis];
    A=sort(d_for_s);
end
axes(handles.axes1);
 for iter1=1:s
     error=A(iter1+1)-A(iter1);
     if error>1
         for iter2=1:s
             if distance(iter2,1)==A(iter1+1)
                 rol=distance(iter2,2);
                 col=distance(iter2,3);
                    rectangle('Position',[col*ratio,rol*ratio,20*ratio,20*ratio],'edgecolor',[0.93 0.78 0.06],'LineWidth',2);
         
             end

     end
     end
 end
