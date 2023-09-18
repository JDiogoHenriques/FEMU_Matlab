%% Input

% D. Henriques, J. Xavier, Gilac 2018


% clear workSpace
clc; close all; clear all;
% switch warning off
warning('off','all');
% clera history (In MATLAB 7.0 (R14) or greater)
com.mathworks.mlservices.MLCommandHistoryServices.removeAll;
% ensure root units are pixels and get the size of the screen
set(0,'Units','pixels');
script.scnsize = get(0,'ScreenSize');
% define the size and location of the figures
script.fig_pos = [script.scnsize(3)/5, script.scnsize(4)/5, ...
    script.scnsize(3)*1/2, script.scnsize(4)*1/1.4];

% image info
script.size_font1 = 19; % antes: 18
script.size_font2 = 22; % antes: 20
script.size_font3 = 24;
script.nomeF      = 'Times New Roman';
script.imgformat  = '-djpeg';
script.filetype   = '.jpg';
script.filetype2  = '.eps';
script.mat        = '.mat';
script.dat        = '.dat';
script.ext        = '.txt';
script.csv        = '.csv';
script.resol      = '-r300';
script.xls        = '.xls';
script.MatchIDext = '.tif';

% Change default axes fonts.
set(0,'DefaultAxesFontName', script.nomeF)
set(0,'DefaultAxesFontSize', script.size_font2)

% Change default text fonts.
set(0,'DefaultTextFontname', script.nomeF)
set(0,'DefaultTextFontSize', script.size_font2)

% ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: %
caminho = 'D:\JDHenriques\Compression\';
angle = 'A00';
projeto = 'A00_10';
Stage = 27;
% Points_removed = 6;
Points_removed_h = 0;
Points_removed_v = 0;
% ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: %

% struture variable
MatchID = struct;
MatchID.project.name = projeto;

switch projeto
    case 'A00_10'
        MatchID.SubsetSize = 17;
        MatchID.StepSize = 5;
        MatchID.Correlation = 'ZNSSD';
        MatchID.GreyInterpolation = 'Bicubic spline';
        MatchID.SubsetTransformation = 'Quadratic';
        MatchID.StrainWindow = 9;
        MatchID.StrainConvention = 'GreenLagrange';
        MatchID.StrainInterpolation = 'Q4'; % Bilinear Quadrilateral
        % -
             % -
        MatchID.loadCFact = 100;
        load([caminho,angle,filesep,projeto,filesep,projeto,'_ConvFact',script.mat])
        MatchID.mm2pixel = converfactor;
        % -        
        MatchID.ROI.X = 33; %pixel
        MatchID.ROI.Y = 208; %pixel
        X_end = 1582; %pixel
        Y_end = 1003; %pixel
                
    case 'A60_10'
        MatchID.SubsetSize = 17;
        MatchID.StepSize = 5;
        MatchID.Correlation = 'ZNSSD';
        MatchID.GreyInterpolation = 'Bicubic spline';
        MatchID.SubsetTransformation = 'Quadratic';
        MatchID.StrainWindow = 9;
        MatchID.StrainConvention = 'GreenLagrange';
        MatchID.StrainInterpolation = 'Q4'; % Bilinear Quadrilateral
        % -
        MatchID.loadCFact = 100;
        load([caminho,angle,filesep,projeto,filesep,projeto,'_ConvFact',script.mat])
        MatchID.mm2pixel = converfactor;
end

script.MatchIDext = '.tif';
script.MatchIDextR = '.tif_';

%% Read load data

% e.g., measured for an universal tentile machine - unit: N
fileload    = [caminho,angle,filesep,projeto,filesep,projeto,'_load',script.dat];
if ~exist(fileload,'file'); warning('Load file from Aramis does not exist'); disp('Load file from Aramis does not exist'); return; end;
delimiter   = ';';
startRow    = 3;
demp        = importdata(fileload,delimiter,startRow);
if isstruct(demp)
    test.time   = demp.data(:,1);
    test.load   = demp.data(:,2);
else
    test.time   = demp(:,1);
    test.load   = demp(:,2);
end
test.load = test.load - test.load(1);


% MatchID.load = test.load(2:end).*MatchID.loadCFact;    % eliminating first stage: reference stage
% MatchID.time = test.time(2:end);


%% Import DIC data

nomeFile = [caminho,angle,filesep,projeto,filesep,'MatchID',filesep,'Current Analysis',filesep,...
            projeto,'_MatchID_P1_Synt_Reference_',script.mat];

% number of stages
MatchID.stages = 0;
MatchID.index = [];
try
    for i = 1:999
        filen = [caminho,angle,filesep,projeto,filesep,projeto,'_',...
            num2str(floor(i/1000)), num2str(floor(i/100)),...
            num2str(mod(floor(i/10),10)) num2str(mod(i,10)),...
            script.MatchIDext];
        if exist(filen,'file')
            MatchID.stages = MatchID.stages + 1;
            MatchID.index = cat(1,MatchID.index,i);
        end
    end
catch
end

% Updating FEM Force component

for i = 1:MatchID.stages
    MatchID.load(i,1) = 0;
end

%Importing FEM Force Value
Force_scalar_RB = importdata([caminho,angle,filesep,projeto,filesep,'MatchID',filesep,'Current Analysis',filesep,...
    'ScalarsFE_RightBoundary',script.dat]); %Sum of force matrix:
                                            % Column 1:Node Index;
                                            % Column 2:FX; Column 3:FY;
MatchID.load(Stage,1) = abs(Force_scalar_RB(1,1));

% CoodX - Convert units pixel to mm
Mcomp = 'x_pic';
eval(['MatchID.',Mcomp,' = [];'])

% All Stages

% for j = 1:length(MatchID.index)
%     i = MatchID.index(j);
%     disp([projeto,' : reading cvs files : ',Mcomp,'...stage : ',num2str(i)])
%     filen = [caminho,projeto,filesep,'MatchID',filesep,Mcomp,filesep,projeto,'_',...
%         num2str(floor(i/1000)), num2str(floor(i/100)),...
%         num2str(mod(floor(i/10),10)) num2str(mod(i,10)),...
%         script.MatchIDextR,Mcomp,script.csv];
%     eval(['MatchID.',Mcomp,'.s',num2str(j),' = dlmread(filen).*MatchID.mm2pixel;'])
%     MatchID.Exx = cat(3,MatchID.Exx,dlmread(filen));
% end

%Some Stages

for j = 1:1
    MatchID_SmallAna = [Stage];
    i = MatchID_SmallAna (j);
    disp([projeto,' : reading cvs files : ',Mcomp,'...stage : ',num2str(i)])
    filen = [caminho,angle,filesep,projeto,filesep,'MatchID',filesep,'Current Analysis',filesep,...
        Mcomp,filesep,projeto,'_',num2str(0), num2str(0),num2str(0),num2str(0),...
        '_Numerical_1_0.def_',Mcomp,script.csv];
    eval(['MatchID.',Mcomp,'.s',num2str(i),' = dlmread(filen).*MatchID.mm2pixel;'])
    %MatchID.Exx = cat(3,MatchID.Exx,dlmread(filen));
end


% CoodY - Convert units pixel to mm
Mcomp = 'y_pic';
eval(['MatchID.',Mcomp,' = [];'])

% All Stages

% for j = 1:length(MatchID.index)
%     i = MatchID.index(j);
%     disp([projeto,' : reading cvs files : ',Mcomp,'...stage : ',num2str(i)])
%     filen = [caminho,projeto,filesep,'MatchID',filesep,Mcomp,filesep,projeto,'_',...
%         num2str(floor(i/1000)), num2str(floor(i/100)),...
%         num2str(mod(floor(i/10),10)) num2str(mod(i,10)),...
%         script.MatchIDextR,Mcomp,script.csv];
%     eval(['MatchID.',Mcomp,'.s',num2str(j),' = dlmread(filen).*MatchID.mm2pixel;'])
%     MatchID.Exx = cat(3,MatchID.Exx,dlmread(filen));
% end

%Some Stages

for j = 1:1
    MatchID_SmallAna = [Stage];
    i = MatchID_SmallAna (j);
    disp([projeto,' : reading cvs files : ',Mcomp,'...stage : ',num2str(i)])
    filen = [caminho,angle,filesep,projeto,filesep,'MatchID',filesep,'Current Analysis',filesep,...
        Mcomp,filesep,projeto,'_',num2str(0), num2str(0),num2str(0),num2str(0),...
        '_Numerical_1_0.def_',Mcomp,script.csv];
    eval(['MatchID.',Mcomp,'.s',num2str(i),' = dlmread(filen).*MatchID.mm2pixel;'])
    %MatchID.Exx = cat(3,MatchID.Exx,dlmread(filen));
end


% UX - Convert units pixel to mm
Mcomp = 'u';
eval(['MatchID.',Mcomp,' = [];'])

% All Stages

% for j = 1:length(MatchID.index)
%     i = MatchID.index(j);
%     disp([projeto,' : reading cvs files : ',Mcomp,'...stage : ',num2str(i)])
%     filen = [caminho,projeto,filesep,'MatchID',filesep,Mcomp,filesep,projeto,'_',...
%         num2str(floor(i/1000)), num2str(floor(i/100)),...
%         num2str(mod(floor(i/10),10)) num2str(mod(i,10)),...
%         script.MatchIDextR,Mcomp,script.csv];
%     eval(['MatchID.',Mcomp,'.s',num2str(j),' = dlmread(filen).*MatchID.mm2pixel;'])
%     MatchID.Exx = cat(3,MatchID.Exx,dlmread(filen));
% end

%Some Stages

for j = 1:1
    MatchID_SmallAna = [Stage];
    i = MatchID_SmallAna (j);
    disp([projeto,' : reading cvs files : ',Mcomp,'...stage : ',num2str(i)])
    filen = [caminho,angle,filesep,projeto,filesep,'MatchID',filesep,'Current Analysis',filesep,...
        Mcomp,filesep,projeto,'_',num2str(0), num2str(0),num2str(0),num2str(0),...
        '_Numerical_1_0.def_',Mcomp,script.csv];
    eval(['MatchID.',Mcomp,'.s',num2str(i),' = dlmread(filen).*MatchID.mm2pixel;'])
    %MatchID.Exx = cat(3,MatchID.Exx,dlmread(filen));
end


% UY - Convert units pixel to mm
Mcomp = 'v';
eval(['MatchID.',Mcomp,' = [];'])

% All Stages

% for j = 1:length(MatchID.index)
%     i = MatchID.index(j);
%     disp([projeto,' : reading cvs files : ',Mcomp,'...stage : ',num2str(i)])
%     filen = [caminho,projeto,filesep,'MatchID',filesep,Mcomp,filesep,projeto,'_',...
%         num2str(floor(i/1000)), num2str(floor(i/100)),...
%         num2str(mod(floor(i/10),10)) num2str(mod(i,10)),...
%         script.MatchIDextR,Mcomp,script.csv];
%     eval(['MatchID.',Mcomp,'.s',num2str(j),' = dlmread(filen).*MatchID.mm2pixel;'])
%     %MatchID.Exx = cat(3,MatchID.Exx,dlmread(filen));
% end

%Some Stages

for j = 1:1
    MatchID_SmallAna = [Stage];
    i = MatchID_SmallAna (j);
    disp([projeto,' : reading cvs files : ',Mcomp,'...stage : ',num2str(i)])
    filen = [caminho,angle,filesep,projeto,filesep,'MatchID',filesep,'Current Analysis',filesep,...
        Mcomp,filesep,projeto,'_',num2str(0), num2str(0),num2str(0),num2str(0),...
        '_Numerical_1_0.def_',Mcomp,script.csv];
    eval(['MatchID.',Mcomp,'.s',num2str(i),' = dlmread(filen).*MatchID.mm2pixel;'])
    %MatchID.Exx = cat(3,MatchID.Exx,dlmread(filen));
end



% EpsX
Mcomp = 'exx';
eval(['MatchID.',Mcomp,' = [];'])

% All Stages

% for j = 1:length(MatchID.index)
%     i = MatchID.index(j);
%     disp([projeto,' : reading cvs files : ',Mcomp,'...stage : ',num2str(i)])
%     filen = [caminho,projeto,filesep,'MatchID',filesep,Mcomp,filesep,projeto,'_',...
%         num2str(floor(i/1000)), num2str(floor(i/100)),...
%         num2str(mod(floor(i/10),10)) num2str(mod(i,10)),...
%         script.MatchIDextR,Mcomp,script.csv];
%     eval(['MatchID.',Mcomp,'.s',num2str(j),' = dlmread(filen);'])
%     MatchID.Exx = cat(3,MatchID.Exx,dlmread(filen));
% end

%Some Stages

for j = 1:1
    MatchID_SmallAna = [Stage];
    i = MatchID_SmallAna (j);
    disp([projeto,' : reading cvs files : ',Mcomp,'...stage : ',num2str(i)])
    filen = [caminho,angle,filesep,projeto,filesep,'MatchID',filesep,'Current Analysis',filesep,...
        Mcomp,filesep,projeto,'_',num2str(0), num2str(0),num2str(0),num2str(0),...
        '_Numerical_1_0.def_',Mcomp,script.csv];
    eval(['MatchID.',Mcomp,'.s',num2str(i),' = dlmread(filen);'])
    %MatchID.Exx = cat(3,MatchID.Exx,dlmread(filen));
end



% EpsY
Mcomp = 'eyy';
eval(['MatchID.',Mcomp,' = [];'])

% All Stages

% for j = 1:length(MatchID.index)
%     i = MatchID.index(j);
%     disp([projeto,' : reading cvs files : ',Mcomp,'...stage : ',num2str(i)])
%     filen = [caminho,projeto,filesep,'MatchID',filesep,Mcomp,filesep,projeto,'_',...
%         num2str(floor(i/1000)), num2str(floor(i/100)),...
%         num2str(mod(floor(i/10),10)) num2str(mod(i,10)),...
%         script.MatchIDextR,Mcomp,script.csv];
%     eval(['MatchID.',Mcomp,'.s',num2str(j),' = dlmread(filen);'])
%     MatchID.Eyy = cat(3,MatchID.Eyy,dlmread(filen));
% end

%Some Stages

for j = 1:1
    MatchID_SmallAna = [Stage];
    i = MatchID_SmallAna (j);
    disp([projeto,' : reading cvs files : ',Mcomp,'...stage : ',num2str(i)])
    filen = [caminho,angle,filesep,projeto,filesep,'MatchID',filesep,'Current Analysis',filesep,...
        Mcomp,filesep,projeto,'_',num2str(0), num2str(0),num2str(0),num2str(0),...
        '_Numerical_1_0.def_',Mcomp,script.csv];
    eval(['MatchID.',Mcomp,'.s',num2str(i),' = dlmread(filen);'])
    %MatchID.Eyy = cat(3,MatchID.Eyy,dlmread(filen));
end



% EpsXY
Mcomp = 'exy';
eval(['MatchID.',Mcomp,' = [];'])

% All Stages

% for j = 1:length(MatchID.index)
%     i = MatchID.index(j);
%     disp([projeto,' : reading cvs files : ',Mcomp,'...stage : ',num2str(i)])
%     filen = [caminho,projeto,filesep,'MatchID',filesep,Mcomp,filesep,projeto,'_',...
%         num2str(floor(i/1000)), num2str(floor(i/100)),...
%         num2str(mod(floor(i/10),10)) num2str(mod(i,10)),...
%         script.MatchIDextR,Mcomp,script.csv];
%     eval(['MatchID.',Mcomp,'.s',num2str(j),' = dlmread(filen);'])
%     %MatchID.Exy = cat(3,MatchID.Exy,dlmread(filen));
% end

%Some Stages

for j = 1:1
    MatchID_SmallAna = [Stage];
    i = MatchID_SmallAna (j);
    disp([projeto,' : reading cvs files : ',Mcomp,'...stage : ',num2str(i)])
    filen = [caminho,angle,filesep,projeto,filesep,'MatchID',filesep,'Current Analysis',filesep,...
        Mcomp,filesep,projeto,'_',num2str(0), num2str(0),num2str(0),num2str(0),...
        '_Numerical_1_0.def_',Mcomp,script.csv];
    eval(['MatchID.',Mcomp,'.s',num2str(i),' = dlmread(filen);'])
    %MatchID.Exy = cat(3,MatchID.Exy,dlmread(filen));
end


%% -------------Extrapolation for Experimental DIC Data Points-------------

%Importing Experimental DIC Data
ExpDIC = load([caminho,angle,filesep,projeto,filesep,'MatchID',filesep,'Current Analysis',filesep,...
               projeto,'_MatchID_P1',script.mat]);     

% Constructing X Coord Vector from Synthetic DIC

xx_synt = MatchID.x_pic.s27(1+Points_removed_h:end-Points_removed_h,1+Points_removed_v:end-1-Points_removed_v);
xx_synt_vec = zeros(size(xx_synt,1)*size(xx_synt,2),1);

for j = 1:size(xx_synt,2)
    for i =1:size(xx_synt,1)
    xx_synt_vec(i+(size(xx_synt,1)*(j-1)),1) = xx_synt(i,j);
    end
end


% Constructing Y Coord Vector from Synthetic DIC

yy_synt = MatchID.y_pic.s27(1+Points_removed_h:end-Points_removed_h,1+Points_removed_v:end-1-Points_removed_v);
yy_synt_vec = zeros(size(xx_synt,1)*size(xx_synt,2),1);

for j = 1:size(yy_synt,2)
    for i =1:size(yy_synt,1)
    yy_synt_vec(i+(size(yy_synt,1)*(j-1)),1) = yy_synt(i,j);
    end
end

% Experimental DIC data Mesh

xx_ExpDIC = ExpDIC.MatchID.x_pic.s27(1:end,1:end-1);


yy_ExpDIC = ExpDIC.MatchID.y_pic.s27(1:end,1:end-1);

% switch projeto
%     case'A60_10'
%         
% xx_ExpDIC(:,310)=xx_ExpDIC(1,310);
% xx_ExpDIC(:,311)=xx_ExpDIC(1,311);
% 
% for i =102:112
%     yy_ExpDIC(i,:)=yy_ExpDIC(i,1);
% end
% end

% Comparing meshes from Experimental DIC and Synthetic DIC

figure('color',[1 1 1]);
plot(xx_synt_vec,yy_synt_vec,'r*'); 
hold on;
plot(xx_ExpDIC,yy_ExpDIC,'k--o'); 
legend('Synthetic Image Mesh','Experimental DIC Mesh')
title('Mesh DIC VS FEM') 
xlabel('x [mm]')  
ylabel('y [mm]')
set(gca, 'YDir','reverse')
% -
h1=figure(1);
saveas(h1,[caminho,angle,filesep,projeto,filesep,'MatchID',filesep,'Current Analysis',filesep,...
            projeto,'_SyntVsExpDIC Mesh.fig']);
        
        
%% Plotting results 

disp(['Plotting results...']) 
escala     = 'igual'; % 'igual'; 'no'
script.colormap = 'hot';
% ============================================== %
% X: components of the displacement (UX) .................................
% ============================================== %
UX_synt = MatchID.u.s27;
UX_ExpDIC = ExpDIC.MatchID.u.s27;

uxmax = max(UX_synt(:));

[~,absmax_ux] = max(abs(UX_synt(:)));
ux_absmax = UX_synt(absmax_ux);

uxmin = min(UX_synt(:));

fig = figure('Color',[1,1,1]);
axes('Position',[0.05 0.5 0.5 0.5],'Parent',fig);
imagesc(xx_synt(1,:),yy_synt(:,1),UX_synt, [uxmin uxmax]); 
axis equal tight off; colorbar; 
colormap(script.colormap); title('UX- Reference Synthetic image','FontSize',14)
axes('Position',[0.05 0.05 0.5 0.5],'Parent',fig);
if isequal(escala,'igual') 
    imagesc(xx_ExpDIC(1,:),yy_ExpDIC(:,1),UX_ExpDIC, [uxmin uxmax]); 
else imagesc(xx_ExpDIC(1,:),yy_ExpDIC(:,1),UX_ExpDIC); 
end
axis equal tight off; colorbar; 
colormap(script.colormap); title('UX- Experimental DIC','FontSize',14)
% -
h2=figure(2);
saveas(h2,[caminho,angle,filesep,projeto,filesep,'MatchID',filesep,'Current Analysis',filesep,...
            projeto,'UX - Experimental DIC vs Reference Synthetic image.fig']);
hold off;

% ============================================== %
% Y: components of the displacement (UY) .................................
% ============================================== %

UY_synt = MatchID.v.s27;
UY_ExpDIC = ExpDIC.MatchID.v.s27;

uymax = max(UY_synt(:));

[~,absmax_uy] = max(abs(UY_synt(:)));
uy_absmax = UY_synt(absmax_ux);

uymin = min(UY_synt(:));

fig = figure('Color',[1,1,1]);
axes('Position',[0.05 0.5 0.5 0.5],'Parent',fig);
imagesc(xx_synt(1,:),yy_synt(:,1),UY_synt, [uymin uymax]); 
axis equal tight off; colorbar; 
colormap(script.colormap); title('UY- Reference Synthetic image','FontSize',14)
axes('Position',[0.05 0.05 0.5 0.5],'Parent',fig);
if isequal(escala,'igual') 
    imagesc(xx_ExpDIC(1,:),yy_ExpDIC(:,1),UY_ExpDIC, [uymin uymax]); 
else imagesc(xx_ExpDIC(1,:),yy_ExpDIC(:,1),UY_ExpDIC); 
end
axis equal tight off; colorbar; 
colormap(script.colormap); title('UY- Experimental DIC','FontSize',14)
% -
h3=figure(3);
saveas(h3,[caminho,angle,filesep,projeto,filesep,'MatchID',filesep,'Current Analysis',filesep,...
            projeto,'UY - Experimental DIC vs Reference Synthetic image.fig']);
        
% ============================================== %
% epsX: strain components 
% ============================================== %
EPSX_synt = MatchID.exx.s27;
EPSX_ExpDIC = ExpDIC.MatchID.exx.s27;

epsxmax = max(EPSX_synt(:));

[~,absmax_epsx] = max(abs(EPSX_synt(:)));
epsx_absmax = EPSX_synt(absmax_epsx);

epsxmin = min(EPSX_synt(:));

fig = figure('Color',[1,1,1]);
axes('Position',[0.05 0.5 0.5 0.5],'Parent',fig);
imagesc(xx_synt(1,:),yy_synt(:,1),EPSX_synt, [epsxmin epsxmax]); 
axis equal tight off; colorbar; 
colormap(script.colormap); title('EPS X- Reference Synthetic image','FontSize',14)
axes('Position',[0.05 0.05 0.5 0.5],'Parent',fig);
if isequal(escala,'igual') 
    imagesc(xx_ExpDIC(1,:),yy_ExpDIC(:,1),EPSX_ExpDIC, [epsxmin epsxmax]); 
else imagesc(xx_ExpDIC(1,:),yy_ExpDIC(:,1),EPSX_ExpDIC); 
end
axis equal tight off; colorbar; 
colormap(script.colormap); title('EPS X- Experimental DIC ','FontSize',14)
% -
h4=figure(4);
saveas(h4,[caminho,angle,filesep,projeto,filesep,'MatchID',filesep,'Current Analysis',filesep,...
            projeto,'epsXX - Experimental DIC vs Reference Synthetic image.fig']);

% ============================================== %
% epsY: strain components 
% ============================================== %
EPSY_synt = MatchID.eyy.s27;
EPSY_ExpDIC = ExpDIC.MatchID.eyy.s27;

epsymax = max(EPSY_synt(:));

[~,absmax_epsy] = max(abs(EPSY_synt(:)));
epsy_absmax = EPSY_synt(absmax_epsy);

epsymin = min(EPSY_synt(:));

fig = figure('Color',[1,1,1]);
axes('Position',[0.05 0.5 0.5 0.5],'Parent',fig);
imagesc(xx_synt(1,:),yy_synt(:,1),EPSY_synt, [epsymin epsymax]); 
axis equal tight off; colorbar; 
colormap(script.colormap); title('EPS Y- Reference Synthetic image','FontSize',14)
axes('Position',[0.05 0.05 0.5 0.5],'Parent',fig);
if isequal(escala,'igual') 
    imagesc(xx_ExpDIC(1,:),yy_ExpDIC(:,1),EPSY_ExpDIC, [epsymin epsymax]); 
else imagesc(xx_ExpDIC(1,:),yy_ExpDIC(:,1),EPSY_ExpDIC); 
end
axis equal tight off; colorbar; 
colormap(script.colormap); title('EPS Y- Experimental DIC','FontSize',14)
% -
h5=figure(5);
saveas(h5,[caminho,angle,filesep,projeto,filesep,'MatchID',filesep,'Current Analysis',filesep,...
            projeto,'epsYY - Experimental DIC vs Reference Synthetic image.fig']);
        
% ============================================== %
% epsS: strain components 
% ============================================== %

EPSXY_synt = MatchID.exy.s27;
EPSXY_ExpDIC = ExpDIC.MatchID.exy.s27;

epssmax = max(EPSXY_synt(:));

[~,absmax_epsxy] = max(abs(EPSXY_synt(:)));
epsxy_absmax = EPSXY_synt(absmax_epsxy);

epssmin = min(EPSXY_synt(:));

fig = figure('Color',[1,1,1]);
axes('Position',[0.05 0.5 0.5 0.5],'Parent',fig);
imagesc(xx_synt(1,:),yy_synt(:,1),EPSXY_synt, [epssmin epssmax]); 
axis equal tight off; colorbar; 
colormap(script.colormap); title('EPS XY-Synthetic image DIC','FontSize',14)
axes('Position',[0.05 0.05 0.5 0.5],'Parent',fig);
if isequal(escala,'igual') 
    imagesc(xx_ExpDIC(1,:),yy_ExpDIC(:,1),EPSXY_ExpDIC, [epssmin epssmax]); 
else imagesc(xx_ExpDIC(1,:),yy_ExpDIC(:,1),EPSXY_ExpDIC); 
end
axis equal tight off; colorbar; 
colormap(script.colormap); title('EPS XY-Synthetic Image after extrapolation','FontSize',14)
% -
h6=figure(6);
saveas(h6,[caminho,angle,filesep,projeto,filesep,'MatchID',filesep,'Current Analysis',filesep,...
            projeto,'epsYY - Experimental DIC vs Reference Synthetic image.fig']);
              
       
%% Boundary Conditions plot
script.cor        = [0.88 0.917647063732147 0.796078443527222];

ux_dic = ExpDIC.MatchID.u.s27;
uy_dic = ExpDIC.MatchID.v.s27;
%UX Left
% -
y00aux1 = yy_ExpDIC(:,1)./max(yy_ExpDIC(:));
y001_L = yy_synt(:,1)./max(yy_synt(:));

fig = figure('color', [1 1 1]); axes1 = axes('Parent',fig);
p1 = plot(y00aux1,ux_dic(:,1),'*--'); hold on; 
p3 = plot(y00aux1 , UX_synt(:,1),'ro--'); 
l = legend([p1,p3],{'Experimental DIC','Reference synthetic image'});
set(l,'Color',script.cor,'FontSize',12,'FontName','Lucida Console',...
    'EdgeColor',script.cor,'Color',script.cor,'Location','best');
xlabel('y/y_{max}, [mm]');
ylabel('ux, [mm] (BC Left) '); 
set(axes1,'Color',script.cor);
print([caminho,angle,filesep,projeto,filesep,'MatchID',filesep,'Current Analysis',filesep,...
            projeto,'_synt_BC_UX_L'],'-djpeg','-r300')

%UY Left
% -
y00aux1 = yy_ExpDIC(:,1)./max(yy_ExpDIC(:));
y001_L = yy_synt(:,1)./max(yy_synt(:));

fig = figure('color', [1 1 1]); axes1 = axes('Parent',fig);
p1 = plot(y00aux1,uy_dic(:,1),'*--'); hold on; 
p3 = plot(y00aux1 , UY_synt(:,1),'ro--'); 
l = legend([p1,p3],{'Experimental DIC','Reference synthetic image'});
set(l,'Color',script.cor,'FontSize',12,'FontName','Lucida Console',...
    'EdgeColor',script.cor,'Color',script.cor,'Location','best');
xlabel('y/y_{max}, [mm]');
ylabel('uy, [mm] (BC Left) '); 
set(axes1,'Color',script.cor);
print([caminho,angle,filesep,projeto,filesep,'MatchID',filesep,'Current Analysis',filesep,...
            projeto,'_synt_BC_UY_L'],'-djpeg','-r300')
        
%UX Right
% -
y00aux1 = yy_ExpDIC(:,1)./max(yy_ExpDIC(:));
y001_L = yy_synt(:,1)./max(yy_synt(:));

fig = figure('color', [1 1 1]); axes1 = axes('Parent',fig);
p1 = plot(y00aux1, ux_dic(:,end-1),'*--'); hold on; 
p3 = plot(y00aux1 , UX_synt(:,end-1),'ro--'); 
l = legend([p1,p3],{'Experimental DIC','Reference synthetic image'});
set(l,'Color',script.cor,'FontSize',12,'FontName','Lucida Console',...
    'EdgeColor',script.cor,'Color',script.cor,'Location','best');
xlabel('y/y_{max}, [mm]');
ylabel('ux, [mm] (BC Right) '); 
set(axes1,'Color',script.cor);
print([caminho,angle,filesep,projeto,filesep,'MatchID',filesep,'Current Analysis',filesep,...
            projeto,'_synt_BC_UX_R'],'-djpeg','-r300')
        
%UY Right
% -
y00aux1 = yy_ExpDIC(:,1)./max(yy_ExpDIC(:));
y001_L = yy_synt(:,1)./max(yy_synt(:));

fig = figure('color', [1 1 1]); axes1 = axes('Parent',fig);
p1 = plot(y00aux1, uy_dic(:,end-1),'*--'); hold on; 
p3 = plot(y00aux1 , UY_synt(:,end-1),'ro--'); 
l = legend([p1,p3],{'Experimental DIC','Reference synthetic image After Extrapolation'});
set(l,'Color',script.cor,'FontSize',12,'FontName','Lucida Console',...
    'EdgeColor',script.cor,'Color',script.cor,'Location','best');
xlabel('y/y_{max}, [mm]');
ylabel('uy, [mm] (BC Right) '); 
set(axes1,'Color',script.cor);
print([caminho,angle,filesep,projeto,filesep,'MatchID',filesep,'Current Analysis',filesep,...
            projeto,'_synt_BC_UY_R'],'-djpeg','-r300')
        

%% -------------specimen size-------------

% ROI size
        
 MatchID.ROI.width  = (X_end-MatchID.ROI.X); %pixel
 MatchID.ROI.height = (Y_end-MatchID.ROI.Y); %pixel


% Save data
disp(['Saving mat file of projet: ',projeto])
save(nomeFile,'MatchID')


