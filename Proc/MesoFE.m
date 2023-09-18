%% Input

% D. Henriques, J. Xavier, G. Andrade-Campos, 2021
clear; clc; close all

tic
d2f = struct;
script = struct;

% USER ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
% Diogo:
caminho = 'D:\JDHenriques\Compression\';
directy = 'C:\Program Files\ANSYS Inc\ANSYS Student\v211\ansys\bin\winx64\'; % ANSYS Directory
ansysV = 'ANSYS211';        % ANSYS Version

angle = 'A00';      % A00; A60;
projeto = 'A00_08'; % A00_01;A00_02;A00_03;A00_04;A00_05;A00_06;A00_07;A00_08;A00_09;A00_10; 
                    % A60_01;A60_02;A60_03;A60_04;A60_05;A60_06;A60_07;A60_08;A60_09;A60_10; 
                    
% Parameters
materialTipo = 'homog';     % 'homog', 'heter' (initialPropertiesEWLW.m)
DIC_Sett_Point = 'P1';      % P1 for lower smoothing, P2 for intermediate smoothing,
                            % P3 for large smoothing
tipoBC = 'experimental';    % 'teorico', 'experimental'
SyntImag_approach = 'no';  % 'yes' if FEM data goes through synthetic image DIC vs DIC
                            %'no' if comparison is FEM vs DIC                                                       
FEM_as_DIC = 'no';          %'no' if using DIC data
                            %'yes' to use FEM data as DIC,
Virtual_Reference = 'no';   %'yes' if using Synthetic images approach for refence
                            %'no'  if not using Synthetic images approach for reference                            
                            
% Boundary Conditions Interpolation
u2fit = 'fit1'; % fit1: values smoother by fitting curve; 
                % fit2: values from raw data
porder = 4;     % Only used if 'fit1' is used, order of the polynomial                       
                         

%FE to DIC Extrapolation 
funcInt = 'scatteredInterpolant'; % scatteredInterpolant; griddata

%--------------------------------------------------------------------------
DIC_Software = 'MatchID';   % 'MatchID'
nomedoc = projeto;
caminho2 = [caminho,angle,filesep,projeto,'\ANSYS\'];
caminhoMAT=[caminho,'Proc\'];
caminhoMatchID = [caminho,angle,filesep,projeto,'\MatchID\'];
caminhoFE_DEF = [caminhoMatchID,'Updating Synthetic images',filesep,'FE_DEF\'];
caminhoFE_VAL = [caminhoMatchID,'Updating Synthetic images',filesep,'FE_VAL\'];
% :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

% ensure root units are pixels and get the size of the screen
set(0,'Units','pixels'); scnsize = get(0,'ScreenSize');
% define the size and location of the figures
script.fig_pos = [scnsize(3)/4 scnsize(4)/4 scnsize(3)*1/2 scnsize(4)*1/2];
% working directory
% image info
script.size_font1 = 18;
script.size_font2 = 22;
script.nomeF      = 'Times New Roman';
script.imgformat  = '-djpeg';
script.resol      = '-r300';
script.filetype   = '.tif';
script.filetype2  = '.jpg';
% extension files
script.mac        = '.mac';
script.txt        = '.txt';
script.dat        = '.dat';
script.mat        = '.mat';
script.tex        = '.tex';
script.xls        = '.xls';
script.cor        = [0.88 0.917647063732147 0.796078443527222];
script.colormap   = 'jet'; % 'hot'; 'jet'; 'bone'

%% Loading data

% Loading convert factor
load([caminho,angle,filesep,projeto,filesep,projeto,'_ConvFact',script.mat])
% other data
test.name = projeto;
%inpdata % database with the specimen information
inpdata
datafem

%% Material parameters - reference values

initialPropertiesEWLW

disp(['Writting material properties...']) 

% Earlywood
Q11_EW = mater.E2_EW/(1-mater.CP23_EW*mater.CP32_EW);
Q12_EW = mater.E2_EW*mater.CP32_EW/(1-mater.CP23_EW*mater.CP32_EW);
Q22_EW = mater.E3_EW/(1-mater.CP23_EW*mater.CP32_EW);
Q66_EW = mater.G23_EW;

% matriz C_EW
C_EW = [Q11_EW Q12_EW 0; Q12_EW Q22_EW 0; 0 0 Q66_EW];

% LateWood
Q11_LW = mater.E2_LW/(1-mater.CP23_LW*mater.CP32_LW);
Q12_LW = mater.E2_LW*mater.CP32_LW/(1-mater.CP23_LW*mater.CP32_LW);
Q22_LW = mater.E3_LW/(1-mater.CP23_LW*mater.CP32_LW);
Q66_LW = mater.G23_LW;

% matriz C_LW
C_LW   = [Q11_LW Q12_LW 0; Q12_LW Q22_LW 0;0 0 Q66_LW];

%Writting Material Properties

%Early Wood   % unit: MPa 1, 2, 3 = L, R, T
Fixed_EW = [mater.E1_EW;mater.CP31_EW;mater.CP12_EW;... % E_L;CP_TL;CP_LR
            mater.G13_EW;mater.G12_EW];                 % G_LT; GLR
     
%   mater.E2_EW = 1534.914;      
%   mater.E3_EW = 1473.536;
%   mater.CP23_EW = 0.77013;
%   mater.G23_EW = 143.429;
  
Variable_EW = [mater.E2_EW;mater.E3_EW;mater.CP23_EW;mater.G23_EW]; %E_R; E_T; CP_RT;G_RT
                  
%Late Wood     % unit: MPa 1, 2, 3 = L, R, T         
Fixed_LW = [mater.E1_LW;mater.CP31_LW;mater.CP12_LW;... % E_L;CP_TL;CP_LR
            mater.G13_LW;mater.G12_LW];                 % G_LT; GLR
            
Variable_LW = [mater.E2_LW;mater.E3_LW;mater.CP23_LW;mater.G23_LW]; %E_R; E_T; CP_RT;G_RT

% Imporing thickness and theta
test.name = projeto;
inpdata
thickness = test.dimension.thickness; % width, mm

tetha_aux = load([caminho,angle,filesep,projeto,filesep,projeto,'_theta',script.mat]);
% theta = abs(rad2deg(tetha_aux.theta)); 
theta = rad2deg(tetha_aux.theta); 

switch materialTipo

        case 'heter' % valores de referencia
            
nomeFic3 = [caminho2,'Fixed_materialproperties_Heter',script.dat];
fid  = fopen(nomeFic3,'w');
WriteContent3 = [Fixed_EW,Fixed_LW];
formatSpec = ['%12.6f  %12.6f  \n'];
fprintf(fid,formatSpec, WriteContent3.');
status = fclose(fid);

nomeFic4 = [caminho2,'Number_Materials',script.dat];
fid  = fopen(nomeFic4,'w');
WriteContent4 = [2,thickness,theta,d2f.EFsize];
formatSpec = ['%12.6f  %12.6f  %12.6f  %12.6f\n'];
fprintf(fid,formatSpec, WriteContent4.');
status = fclose(fid);

nomeFic5 = [caminho2,filesep,'Variable_materialproperties_Heter',script.dat];
fid  = fopen(nomeFic5,'w');
WriteContent5 = [Variable_EW,Variable_LW];
formatSpec = ['%12.6f  %12.6f  \n'];
fprintf(fid,formatSpec, WriteContent5.');
status = fclose(fid);

        case 'homog' % valores de referencia
            
nomeFic3 = [caminho2,'Fixed_materialproperties_Homog',script.dat];
fid  = fopen(nomeFic3,'w');
WriteContent3 = [Fixed_EW];
formatSpec = ['%12.6f  \n'];
fprintf(fid,formatSpec, WriteContent3.');
status = fclose(fid);

nomeFic4 = [caminho2,'Number_Materials',script.dat];
fid  = fopen(nomeFic4,'w');
WriteContent4 = [1,thickness,theta,d2f.EFsize];
formatSpec = ['%12.6f  %12.6f  %12.6f  %12.6f\n'];
fprintf(fid,formatSpec, WriteContent4.');
status = fclose(fid);

nomeFic5 = [caminho2,'Variable_materialproperties_Homog',script.dat];
fid  = fopen(nomeFic5,'w');
WriteContent5 = [Variable_EW];
formatSpec = ['%12.6f  \n'];
fprintf(fid,formatSpec, WriteContent5.');
status = fclose(fid);

end
%% read DIC measurements

disp(['Reading DIC measurements...']) 

        switch Virtual_Reference
           case 'no' 
load([caminho,angle,filesep,projeto,filesep,projeto,'_MatchID_',DIC_Sett_Point,script.mat]) 
            
% Plot load-displacement with stage
fig = figure('color', [1 1 1]); 
axes1 = axes('Position',[0.2 0.2 .75 .75],'FontSize',20,'Parent',fig); 
%axes('FontName',script.nomeF,'FontSize',script.size_font1,'Parent',fig_sel)
xp  = 1:MatchID.stages; 
yp = abs(MatchID.load);
plot(xp,yp,'ko--'); hold on; 
Lpoint = abs(MatchID.load(d2f.stagio)); plot(d2f.stagio,Lpoint,'MarkerFaceColor',[1 0 0],...
    'MarkerSize',8,'Marker','square','LineStyle','none','Color',[1 0 0]);
inip    = 1;
declive = (Lpoint-abs(MatchID.load(inip)))/(xp(d2f.stagio)-xp(inip));
plot(xp,declive.*xp,'--b'); 
xlabel('Tempo (s)','interpreter','latex','FontSize',22); 
ylh = ylabel('Força (N)','interpreter','latex','FontSize',22); 
% ylh.Position(2) = ylh.Position(2) - abs(ylh.Position(2)*.8);
hold on; grid on; box on;
set(gca,'FontSize',18)
set(gca,'TickLabelInterpreter','latex')
ylim([0 max(abs(MatchID.load(:)))]); set(axes1,'Color',script.cor);
print([caminho,angle,filesep,projeto,filesep,'','ForcaTempo'],'-djpeg','-r300')
xdic    = MatchID.x_pic.s1;
ydic    = MatchID.y_pic.s1;            
           case 'yes'
load([caminho,angle,filesep,projeto,filesep,projeto,'_MatchID_',DIC_Sett_Point,'_Synt_Reference_',script.mat])
xdic    = eval(['MatchID.x_pic.s',num2str(d2f.stagio)]);
ydic    = eval(['MatchID.y_pic.s',num2str(d2f.stagio)]);
        end


% read DIC data from MatchID @ stage i
% units: mm (created by MatchID2mat.m)
% xdic    = eval(['MatchID.x_pic.s',num2str(d2f.stagio)]);
% ydic    = eval(['MatchID.y_pic.s',num2str(d2f.stagio)]);
% xdic    = MatchID.x_pic.s1;
% ydic    = MatchID.y_pic.s1;
uxdic   = eval(['MatchID.u.s',num2str(d2f.stagio)]);
uydic   = eval(['MatchID.v.s',num2str(d2f.stagio)]);
epsXdic = eval(['MatchID.exx.s',num2str(d2f.stagio)]);
epsYdic = eval(['MatchID.eyy.s',num2str(d2f.stagio)]);
epsSdic = eval(['MatchID.exy.s',num2str(d2f.stagio)]);

% removing nan edges
% xdic
xdic(xdic == 0) = NaN;                          % Turning zeros to NaN
row_index = find(~any(~isnan(xdic), 2));        % row with all NaN values
row_index = sort (row_index,'descend');
    for i = 1:length(row_index)
        xdic(row_index(1,end),:)=[];
    end
    
column_index =find(~any(~isnan(xdic), 1));      %column with all NaN values 
column_index = sort (column_index,'descend');    
    for i = 1:length(column_index)
        xdic(:,column_index(1,i))=[];
    end

% ydic    
    
ydic(ydic == 0) = NaN;                          % Turning zeros to NaN
row_index = find(~any(~isnan(ydic), 2));        % row with all NaN values
row_index = sort (row_index,'descend');
    for i = 1:length(row_index)
        ydic(row_index(1,end),:)=[];
    end
    
column_index =find(~any(~isnan(ydic), 1));      %column with all NaN values 
column_index = sort (column_index,'descend');    
    for i = 1:length(column_index)
        ydic(:,column_index(1,i))=[];
    end

%uxdic

uxdic(uxdic == 0) = NaN;                         % Turning zeros to NaN
row_index = find(~any(~isnan(uxdic), 2));        % row with all NaN values
row_index = sort (row_index,'descend');
    for i = 1:length(row_index)
        uxdic(row_index(1,end),:)=[];
    end
    
column_index =find(~any(~isnan(uxdic), 1));      %column with all NaN values 
column_index = sort (column_index,'descend');    
    for i = 1:length(column_index)
        uxdic(:,column_index(1,i))=[];
    end

% uydic

uydic(uydic == 0) = NaN;                         % Turning zeros to NaN
row_index = find(~any(~isnan(uydic), 2));        % row with all NaN values
row_index = sort (row_index,'descend');
    for i = 1:length(row_index)
        uydic(row_index(1,end),:)=[];
    end
    
column_index =find(~any(~isnan(uydic), 1));      %column with all NaN values 
column_index = sort (column_index,'descend');    
    for i = 1:length(column_index)
        uydic(:,column_index(1,i))=[];
    end

% epsXdic

epsXdic(epsXdic == 0) = NaN;                       % Turning zeros to NaN
row_index = find(~any(~isnan(epsXdic), 2));        % row with all NaN values
row_index = sort (row_index,'descend');
    for i = 1:length(row_index)
        epsXdic(row_index(1,end),:)=[];
    end
    
column_index =find(~any(~isnan(epsXdic), 1));      %column with all NaN values 
column_index = sort (column_index,'descend');    
    for i = 1:length(column_index)
        epsXdic(:,column_index(1,i))=[];
    end

% epsYdic

epsYdic(epsYdic == 0) = NaN;                       % Turning zeros to NaN
row_index = find(~any(~isnan(epsYdic), 2));        % row with all NaN values
row_index = sort (row_index,'descend');
    for i = 1:length(row_index)
        epsYdic(row_index(1,end),:)=[];
    end
    
column_index =find(~any(~isnan(epsYdic), 1));      %column with all NaN values 
column_index = sort (column_index,'descend');    
    for i = 1:length(column_index)
        epsYdic(:,column_index(1,i))=[];
    end

% epsSdic

epsSdic(epsSdic == 0) = NaN;                       % Turning zeros to NaN
row_index = find(~any(~isnan(epsSdic), 2));        % row with all NaN values
row_index = sort (row_index,'descend');
    for i = 1:length(row_index)
        epsSdic(row_index(1,end),:)=[];
    end
    
column_index =find(~any(~isnan(epsSdic), 1));      %column with all NaN values 
column_index = sort (column_index,'descend');    
    for i = 1:length(column_index)
        epsSdic(:,column_index(1,i))=[];
    end

epsSdic = 2*epsSdic;                                % epsXY to epsS


% shift origin coord system @ (0,0)
% xdic = xdic - xdic(1,1);
% ydic = ydic - ydic(1,1);
       
xdic = xdic - MatchID.ROI.X*converfactor;
ydic = ydic - MatchID.ROI.Y*converfactor;
% Region of interest for the all analysis based on DIC.roi (Aramis 2D)
roiX = xdic/converfactor; % unit: pixel , Coord system on the upper left corner of the specimen
roiY = ydic/converfactor; % unit: pixel , X+ ->  ; Y+ | down
                                                     

% prescribed ux for theoretical analysis
% uxprecDIC = min(uxdic(:)); % unit : mm
uxprecDIC = -0.1; % unit : mm

% specimen geometry
% Lx        = MatchID.image.width; % length, mm
% Ly        = MatchID.image.height;  % width, mm
Lx = xdic(end); % length, mm
Ly = ydic(end);  % width, mm
thickness = test.dimension.thickness; % width, mm

% extract line information at edges
xdicline   = transpose(xdic(end,:));  % x+ > left to right
ydicline   = ydic(:,1);  % Y+ >down
uxdicleft  = uxdic(:,1);
uydicleft  = uydic(:,1);
uxdicright = uxdic(:,end);
uydicright = uydic(:,end);

MatLineY = [ydicline,uxdicleft,uydicleft,uxdicright,uydicright]; 


%% Read image info

imagem.file = [caminho,angle,filesep,projeto,filesep,projeto,'_Rings.tif'];
imagem.file2 = [caminho,angle,filesep,projeto,filesep,projeto,'_0000.tif'];
imagem.iref = double(imread(imagem.file));
imagem.iref2 = double(imread(imagem.file2));
% Region of interest - DIC
imcam = [caminho,angle,filesep,projeto,filesep,projeto,'_icrop',script.mat];
if ~exist(imcam,'file')  
    icrop     = [];
    icrop.X      = MatchID.ROI.X;
    icrop.Y      = MatchID.ROI.Y;
    icrop.width  = MatchID.ROI.width;
    icrop.height = MatchID.ROI.height;
    save(imcam,'icrop')
else
    load(imcam,'icrop')
end
imagem.X      = icrop.X; % unit: pixel
imagem.Y      = icrop.Y;
imagem.Width  = icrop.width;
imagem.Height = icrop.height;


imagem.icrop = imagem.iref(imagem.Y:imagem.Y+imagem.Height,...
                imagem.X:imagem.X+imagem.Width); % Rings figure
        
imagem.icrop2 = imagem.iref2(imagem.Y:imagem.Y+imagem.Height,...
                imagem.X:imagem.X+imagem.Width); % Speckle pattern reference figure     
     


%Flipping image

imagem.iref = flipud(imagem.iref);
imagem.icrop = flipud(imagem.icrop);

% convert pixel to mm - TC09
imagem.mm2pixel = converfactor; % unit: mm/pixel

figure('color',[1 1 1])
imagesc(imagem.icrop); colormap('gray'); hold on;
axis off tight
print([caminho,angle,filesep,projeto,filesep,nomedoc,'doc01'],'-djpeg','-r300')

figure('color',[1 1 1])
imagesc(imagem.icrop2); colormap('gray'); hold on;
axis off tight
print([caminho,angle,filesep,projeto,filesep,nomedoc,'doc02'],'-djpeg','-r300')


%% FE meshing

disp(['Creating Mesh in ANSYS...']) 

% ======================================================================= %
% Mesh generation 
% ======================================================================= %

nnel   = 4; % Number of nodes per Element - Q4
    
filname1 = [projeto,'_CoordWriting_MatchID'];
filname3 = 'outansys';

% executing ANSYS with the actual EF parameters:
% ======================================================================= %
cd(caminho2);   % changing Directory by the one where ANSYS files are stored
% dos(['"' directy ansysV '" -b nolist -i ' filname1 script.mac ' -j ' ...
%     projeto ' -o ' filname3 script.dat]); % ANSYS is executed in batch mode
 dos(['"' directy ansysV '" -b nolist -i ' filname1 script.mac ' -j ' ...
     projeto ' -o ' filname3 script.dat]); % ANSYS is executed in batch mode
% ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: %

% Reading numerical results from ANSYS
% ======================================================================= %
cd(caminhoMAT);    % rechanging Directory to the 'Identification' one

%% Interpolation between DIC and FEM

% DoF : [ u1, u2, ..., uend | v1, v2, ..., vend ]
% list of nodes on the left edge of the rectangular specimen

%Importing data from ANSYS

disp(['Interpolation between DIC and FEM...']) 

Mesh_LeftEdge = importdata([caminho2,'Mesh_LeftEdge',script.dat]);
Mesh_RightEdge = importdata([caminho2,'Mesh_RightEdge',script.dat]);

% list of nodes on the left edge of the rectangular specimen
index_Left = Mesh_LeftEdge(:,1); 

% list of nodes on the right edge of the rectangular specimen
index_Right = Mesh_RightEdge(:,1);

% Coordinates of nodes on the left edge of the rectangular specimen
coor_xL    = Mesh_LeftEdge(:,2); 
coor_yL    = Mesh_LeftEdge(:,3); 

% Coordinates of nodes on the right edge of the rectangular specimen
coor_xR    = Mesh_RightEdge(:,2);
coor_yR    = Mesh_RightEdge(:,3);

% Interpolation of data between DIC subset points and mesh nodes ::::::::
% Set up fittype and options.
ft = fittype(['poly',num2str(porder)]);

% I - UX: Left ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
% Coord DIC
y000 = ydicline;
x000 = xdic(:,1);
% Coord FEM 
y001_L  = coor_yL;
x001_L  = coor_xL;  
%removing NaN
u000 = uxdicleft;
[row1] = find(isnan(u000));
u000 = rmmissing(u000);
y00aux1=y000;
y00aux1(row1,:)=[];
%-
uxFE_aux1 = uxdic(:);
[row1_FE] = find(isnan(uxFE_aux1));
uxFE_aux1 = rmmissing(uxFE_aux1);

y00aux1_FE=ydic(:);
y00aux1_FE(row1_FE,:)=[];

x00aux1_FE=xdic(:);
x00aux1_FE(row1_FE,:)=[];

% Extrapolation with scatteredInterpolant
 uxL_interp = scatteredInterpolant(x00aux1_FE,y00aux1_FE,uxFE_aux1);
 yFEM_UX_leftBC = uxL_interp(x001_L,y001_L);
 yFEM_UX_leftBC = inpaint_nans(yFEM_UX_leftBC);


switch u2fit
    case 'fit1'                   
 % Smoothing with a polynomial
 [xData, yData]      = prepareCurveData(y001_L, yFEM_UX_leftBC); % DIC data
 [fitresult, gof]    = fit( xData, yData, ft );
 uxdicleft_Poly_coef = [];
 for j = 1:porder+1
     eval(['uxdicleft_Poly_coef = cat(1,uxdicleft_Poly_coef,',...
         'fitresult.p',num2str(j),');']);
 end
 yFEM_UX_leftBC = polyval(uxdicleft_Poly_coef,y001_L);
        
% -
fig = figure('color', [1 1 1]); axes1 = axes('Parent',fig);
p1 = plot(y00aux1, u000,'*--'); hold on; 
p2 = plot(y001_L , yFEM_UX_leftBC,'ro--'); 
l = legend([p1,p2],{'dic','FEM C.F.'});
set(l,'Color',script.cor,'FontSize',12,'FontName','Lucida Console',...
    'EdgeColor',script.cor,'Color',script.cor,'Location','best');
xlabel('y, [mm]');
ylabel('ux, [mm] (Left BC) '); 
set(axes1,'Color',script.cor);
print([caminho,angle,filesep,projeto,filesep,nomedoc,'doc04'],'-djpeg','-r300')

figure('color', [1 1 1]);        
surf(xdic,ydic,uxdic);hold on
plot3(x001_L,y001_L,yFEM_UX_leftBC,'ro','LineWidth',1);
xlabel('x, [mm]');
ylabel('y, [mm]');
zlabel('ux, [mm] (Left BC) ');
print([caminho,angle,filesep,projeto,filesep,nomedoc,'doc04_surf'],'-djpeg','-r300')


    case 'fit2'
        % values from raw data
% -
fig = figure('color', [1 1 1]); axes1 = axes('Parent',fig);
p1 = plot(y00aux1, u000,'*--'); hold on; 
p3 = plot(y001_L , yFEM_UX_leftBC,'ro--'); 
l = legend([p1,p3],{'dic','FEM C.F.'});
set(l,'Color',script.cor,'FontSize',12,'FontName','Lucida Console',...
    'EdgeColor',script.cor,'Color',script.cor,'Location','best');
xlabel('y/y_{max}, [mm]');
ylabel('ux, [mm] (Left BC) '); 
set(axes1,'Color',script.cor);
print([caminho,angle,filesep,projeto,filesep,nomedoc,'doc04'],'-djpeg','-r300')

figure('color', [1 1 1]);        
surf(xdic,ydic,uxdic);hold on
plot3(x001_L,y001_L,yFEM_UX_leftBC,'ro','LineWidth',1);
xlabel('x, [mm]');
ylabel('y, [mm]');
zlabel('ux, [mm] (Left BC) ');
print([caminho,angle,filesep,projeto,filesep,nomedoc,'doc04_surf'],'-djpeg','-r300')        
end

% ----------------------------------------------------------------------- %
% II - UY: Left :::::::::::::::::::::::::::::::::::::::::::::::::::::::::

u000 = uydicleft;
[row2] = find(isnan(u000));
u000 = rmmissing(u000);
y00aux2=y000;
y00aux2(row2,:)=[];
%-
uyFE_aux2 = uydic(:);
[row2_FE] = find(isnan(uyFE_aux2));
uyFE_aux2 = rmmissing(uyFE_aux2);

y00aux2_FE=ydic(:);
y00aux2_FE(row2_FE,:)=[];

x00aux2_FE=xdic(:);
x00aux2_FE(row2_FE,:)=[];


% Extrapolation with scatteredInterpolant
 uyL_interp = scatteredInterpolant(x00aux2_FE,y00aux2_FE,uyFE_aux2);
 yFEM_UY_leftBC = uyL_interp(x001_L,y001_L);
 yFEM_UY_leftBC = inpaint_nans(yFEM_UY_leftBC);

 
switch u2fit
    case 'fit1'
 % Smoothing with a polynomial
 [xData, yData]      = prepareCurveData(y001_L, yFEM_UY_leftBC); % DIC data
 [fitresult, gof]    = fit( xData, yData, ft );
 uydicleft_Poly_coef = [];
 for j = 1:porder+1
     eval(['uydicleft_Poly_coef = cat(1,uydicleft_Poly_coef,',...
         'fitresult.p',num2str(j),');']);
 end
 yFEM_UY_leftBC = polyval(uydicleft_Poly_coef,y001_L);
% -
fig = figure('color', [1 1 1]); axes1 = axes('Parent',fig);
p1 = plot(y00aux2, u000,'*--'); hold on; % dic 
p2 = plot(y001_L , yFEM_UY_leftBC,'ro--');  
l = legend([p1,p2],{'dic','FEM C.F.'});
set(l,'Color',script.cor,'FontSize',12,'FontName','Lucida Console',...
    'EdgeColor',script.cor,'Color',script.cor,'Location','best');
xlabel('y, [mm]'); 
ylabel('uy, [mm] (CF Left BC)'); 
set(axes1,'Color',script.cor);
print([caminho,angle,filesep,projeto,filesep,nomedoc,'doc05'],'-djpeg','-r300')

figure('color', [1 1 1]);        
surf(xdic,ydic,uydic);hold on
plot3(x001_L,y001_L,yFEM_UY_leftBC,'ro','LineWidth',1);
xlabel('x, [mm]');
ylabel('y, [mm]');
zlabel('uy, [mm] (Left BC) ');
print([caminho,angle,filesep,projeto,filesep,nomedoc,'doc05_surf'],'-djpeg','-r300')       
    case 'fit2'

% -
fig = figure('color', [1 1 1]); axes1 = axes('Parent',fig);
p1 = plot(y00aux2, u000,'*--'); hold on; % dic 
p3 = plot(y001_L , yFEM_UY_leftBC,'ro--');  
l = legend([p1,p3],{'dic','FEM C.F.'});
set(l,'Color',script.cor,'FontSize',12,'FontName','Lucida Console',...
    'EdgeColor',script.cor,'Color',script.cor,'Location','best');
xlabel('y/y_{max}, [mm]'); 
ylabel('uy, [mm] (Left BC)'); 
set(axes1,'Color',script.cor);
print([caminho,angle,filesep,projeto,filesep,nomedoc,'doc05'],'-djpeg','-r300')

figure('color', [1 1 1]);        
surf(xdic,ydic,uydic);hold on
plot3(x001_L,y001_L,yFEM_UY_leftBC,'ro','LineWidth',1);
xlabel('x, [mm]');
ylabel('y, [mm]');
zlabel('uy, [mm] (Left BC) ');
print([caminho,angle,filesep,projeto,filesep,nomedoc,'doc05_surf'],'-djpeg','-r300')  
end

% ----------------------------------------------------------------------- %

% III - UX: right ::::::::::::::::::::::::::::::::::::::::::::::::::::::::

% note: coor_yR = coor_yL
% Coord DIC
x000 = xdic(:,end);
% Coord FEM 
y001_R  = coor_yR;
x001_R  = coor_xR;  
%removing NaN
u000 = uxdicright;
[row3] = find(isnan(u000));
u000 = rmmissing(u000);
y00aux3=y000;
y00aux3(row3,:)=[];
%-
uxFE_aux3 = uxdic(:);
[row3_FE] = find(isnan(uxFE_aux3));
uxFE_aux3 = rmmissing(uxFE_aux3);

y00aux3_FE=ydic(:);
y00aux3_FE(row3_FE,:)=[];

x00aux3_FE=xdic(:);
x00aux3_FE(row3_FE,:)=[];

%Extrapolation with scatteredinterpolant

 uxR_interp = scatteredInterpolant(x00aux3_FE,y00aux3_FE,uxFE_aux3);
 yFEM_UX_rightBC = uxR_interp(x001_R,y001_R);
 yFEM_UX_rightBC = inpaint_nans(yFEM_UX_rightBC);
  
 
switch u2fit
    case 'fit1'
 % Smoothing with a polynomial
 [xData, yData]      = prepareCurveData(y001_R, yFEM_UX_rightBC); % DIC data
 [fitresult, gof]    = fit( xData, yData, ft );
 uxdicright_Poly_coef = [];
 for j = 1:porder+1
     eval(['uxdicright_Poly_coef = cat(1,uxdicright_Poly_coef,',...
         'fitresult.p',num2str(j),');']);
 end
 yFEM_UX_rightBC = polyval(uxdicright_Poly_coef,y001_R);
% -
fig = figure('color', [1 1 1]); axes1 = axes('Parent',fig);
p1 = plot(y00aux3, u000,'*--'); hold on; 
p2 = plot(y001_R, yFEM_UX_rightBC,'ro--'); 
l = legend([p1,p2],{'dic','FEM C.F.'});
set(l,'Color',script.cor,'FontSize',12,'FontName','Lucida Console',...
    'EdgeColor',script.cor,'Color',script.cor,'Location','best');
xlabel('y, [mm]');  
ylabel('ux, [mm] (Right BC)');
set(axes1,'Color',script.cor);
print([caminho,angle,filesep,projeto,filesep,nomedoc,'doc06'],'-djpeg','-r300')

figure('color', [1 1 1]);        
surf(xdic,ydic,uxdic);hold on
plot3(x001_R,y001_R,yFEM_UX_rightBC,'ro','LineWidth',1);
xlabel('x, [mm]');
ylabel('y, [mm]');
zlabel('ux, [mm] (Rigth BC) ');
print([caminho,angle,filesep,projeto,filesep,nomedoc,'doc06_surf'],'-djpeg','-r300')

    case 'fit2'
% -
fig = figure('color', [1 1 1]); axes1 = axes('Parent',fig);
p1 = plot(y00aux3, u000,'*--'); hold on;  
p2 = plot(y001_R, yFEM_UX_rightBC,'ro--'); 
l = legend([p1,p2],{'dic','FEM C.F.'});
set(l,'Color',script.cor,'FontSize',12,'FontName','Lucida Console',...
    'EdgeColor',script.cor,'Color',script.cor,'Location','best');
xlabel('y, [mm]');  
ylabel('ux, [mm] (Rigth BC)');
set(axes1,'Color',script.cor);
print([caminho,angle,filesep,projeto,filesep,nomedoc,'doc06'],'-djpeg','-r300')

figure('color', [1 1 1]);        
surf(xdic,ydic,uxdic);hold on
plot3(x001_R,y001_R,yFEM_UX_rightBC,'ro','LineWidth',1);
xlabel('x, [mm]');
ylabel('y, [mm]');
zlabel('ux, [mm] (Rigth BC) ');
print([caminho,angle,filesep,projeto,filesep,nomedoc,'doc06_surf'],'-djpeg','-r300')
end


% ----------------------------------------------------------------------- %

% IV. UY-right ::::::::::::::::::::::::::::::::::::::::::::::::::::::::

u000 = uydicright;
[row4] = find(isnan(u000));
u000 = rmmissing(u000);
y00aux4=y000;
y00aux4(row4,:)=[];
%-
uyFE_aux4 = uydic(:);
[row4_FE] = find(isnan(uyFE_aux4));
uyFE_aux4 = rmmissing(uyFE_aux4);

y00aux4_FE=ydic(:);
y00aux4_FE(row4_FE,:)=[];

x00aux4_FE=xdic(:);
x00aux4_FE(row4_FE,:)=[];

%Extrapolation with scatteredinterpolant

 uyR_interp = scatteredInterpolant(x00aux4_FE,y00aux4_FE,uyFE_aux4);
 yFEM_UY_rightBC = uyR_interp(x001_R,y001_R);
 yFEM_UY_rightBC = inpaint_nans(yFEM_UY_rightBC);
  
 
 
switch u2fit
    case 'fit1'
 % Smoothing with a polynomial
 [xData, yData]      = prepareCurveData(y001_R, yFEM_UY_rightBC); % DIC data
 [fitresult, gof]    = fit( xData, yData, ft );
 uydicright_Poly_coef = [];
 for j = 1:porder+1
     eval(['uydicright_Poly_coef = cat(1,uydicright_Poly_coef,',...
         'fitresult.p',num2str(j),');']);
 end
 yFEM_UY_rightBC = polyval(uydicright_Poly_coef,y001_R);
% -
fig = figure('color', [1 1 1]); axes1 = axes('Parent',fig);
p1 = plot(y00aux4, u000,'*--'); hold on;  
p2 = plot(y001_R, yFEM_UY_rightBC,'ro--');  
l = legend([p1,p2],{'dic','FEM C.F.'});
set(l,'Color',script.cor,'FontSize',12,'FontName','Lucida Console',...
    'EdgeColor',script.cor,'Color',script.cor,'Location','best');
xlabel('y, [mm]');  
ylabel('uy, [mm] (Right BC)');
set(axes1,'Color',script.cor);
print([caminho,angle,filesep,projeto,filesep,nomedoc,'doc07'],'-djpeg','-r300')

figure('color', [1 1 1]);        
surf(xdic,ydic,uydic);hold on
plot3(x001_R,y001_R,yFEM_UY_rightBC,'ro','LineWidth',1);
xlabel('x, [mm]');
ylabel('y, [mm]');
zlabel('uy, [mm] (Rigth BC) ');
print([caminho,angle,filesep,projeto,filesep,nomedoc,'doc07_surf'],'-djpeg','-r300')

    case 'fit2'
% -
fig = figure('color', [1 1 1]); axes1 = axes('Parent',fig);
p1 = plot(y00aux4, u000,'*--'); hold on; 
p2 = plot(y001_R, yFEM_UY_rightBC,'ro--');  
l = legend([p1,p2],{'dic','FEM C.F.'});
set(l,'Color',script.cor,'FontSize',12,'FontName','Lucida Console',...
    'EdgeColor',script.cor,'Color',script.cor,'Location','best');
xlabel('y, [mm]');  
ylabel('uy, [mm] (Rigth BC)');
set(axes1,'Color',script.cor);
print([caminho,angle,filesep,projeto,filesep,nomedoc,'doc07'],'-djpeg','-r300')

figure('color', [1 1 1]);        
surf(xdic,ydic,uydic);hold on
plot3(x001_R,y001_R,yFEM_UY_rightBC,'ro','LineWidth',1);
xlabel('x, [mm]');
ylabel('y, [mm]');
zlabel('uy, [mm] (Rigth BC) ');
print([caminho,angle,filesep,projeto,filesep,nomedoc,'doc07_surf'],'-djpeg','-r300')     
end

%% Boundary conditions

% yFEM_UX_leftBC  - prescribed UX at nodes on the left
% yFEM_UY_leftBC  - prescribed UY at nodes on the left
% yFEM_UX_rightBC - prescribed UX at nodes on the right
% yFEM_UY_rightBC - prescribed UY at nodes on the right

% indeces of ux and uy DOF for the right edge nodes
% force vector (distributed load applied at xx=Lx)
% force = zeros(GDof,1);

% impose in the force vector B.C. written in terms of prescribed
% displacement, that can even be obtained experimentally by DIC
switch tipoBC
    case 'teorico'
        yFEM_UX_leftBC = zeros(length(yFEM_UX_leftBC),1); % note: in the future DIC data can be updated at these positions
        yFEM_UY_leftBC = zeros(length(yFEM_UY_leftBC),1);
        yFEM_UX_rightBC = ones(length(yFEM_UX_rightBC),1)*uxprecDIC; % x component displac.
        yFEM_UY_rightBC = zeros(length(yFEM_UY_rightBC),1); % y component displac.
    case 'experimental'
        yFEM_UX_leftBC = yFEM_UX_leftBC; % note: in the future DIC data can be updated at these positions
        yFEM_UY_leftBC = yFEM_UY_leftBC;
        yFEM_UX_rightBC = yFEM_UX_rightBC; % x component displac.
        yFEM_UY_rightBC = yFEM_UY_rightBC; % y component displac.
end

%% Writting interpolation data DIC2FEM to Data File

nomeFic = [caminho2,'Mesh_Left_DIC2FEM',script.dat];
fid  = fopen(nomeFic,'w');
WriteContent = [index_Left,yFEM_UX_leftBC,yFEM_UY_leftBC];

formatSpec = ['%12.6f  %16.10f  %16.10f\n'];
fprintf(fid,formatSpec, WriteContent.');
status = fclose(fid);

nomeFic2 = [caminho2,'Mesh_Right_DIC2FEM',script.dat];
fid  = fopen(nomeFic2,'w');
WriteContent2 = [index_Right,yFEM_UX_rightBC,yFEM_UY_rightBC];
formatSpec = ['%12.6f  %16.10f  %16.10f\n'];
fprintf(fid,formatSpec, WriteContent2.');
status = fclose(fid);


%% Ansys in Batch mode

disp(['FEA Analysis in ANSYS...']) 

filname1 = [projeto,'_FEA_MatchID'];


% executing ANSYS with the actual EF parameters:
% ======================================================================= %
cd(caminho2);   % changing Directory by the one where ANSYS files are stored
dos(['"' directy ansysV '" -b nolist -i ' filname1 script.mac ' -j ' ...
    projeto ' -o ' filname3 script.dat]); % ANSYS is executed in batch mode
% ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: %

% Reading numerical results from ANSYS
% ======================================================================= %
cd(caminhoMAT);    % rechanging Directory to the 'Identification' one


%% Results
switch SyntImag_approach
    case 'no'

% Importing solution from ANSYS


disp(['Importing results from ANSYS...']) 

Nodal_FEA = importdata([caminho2,'Nodal_fea',script.dat]); % Column 1:Node Index;
                                                                   % Column 2:Coord X; Column 3:Coord Y;
                                                                   % Column 4:Displ X; Column 5:Displ Y;
                                                                   % Column 6:Strain X; Column 7:Strain Y; 
                                                                   % Column 8:Strain XY;
                                                                   
Elem_Connec = importdata([caminho2,'Connectivity',script.dat]); %Connectivity matrix:
                                                                        % Column 1:Element Index;
                                                                        % Column 2:Node 1; Column 3:Node 2;
                                                                        % Column 4:Node w; Column 5:Node 4;

nodeCoordinates = zeros(length(Nodal_FEA),2);
nodeCoordinates = Nodal_FEA(:,2:3);
elementNodes = Elem_Connec(:,2:5);
disp(['total number of nodes : ',num2str(size(nodeCoordinates,1))])
disp(['total number of elements: ',num2str(size(elementNodes,1))])

% ----------
nel = size(elementNodes,1);
% Plotting the Finite Element Mesh
% Initialization of the required matrices
X = zeros(nnel,nel);
Y = zeros(nnel,nel);
% Extract X,Y coordinates for the (iel)-th element
for iel = 1:nel
    X(:,iel) = nodeCoordinates(elementNodes(iel,:),1);
    Y(:,iel) = nodeCoordinates(elementNodes(iel,:),2);
end
% Figure
figure('Color',[1,1,1])
patch(X,Y,'w')
title('Finite Element Mesh of Plate') 
xlabel('x [mm]')  
ylabel('y [mm]')
axis([0. Lx*1.01 0. Ly*1.01])
set(gca, 'YDir','reverse')
%axis off tight 
if Lx == Ly
    axis equal ;
end
print([caminho,angle,filesep,projeto,filesep,nomedoc,'doc03'],'-djpeg','-r300')
% ----------

xx = nodeCoordinates(:,1);
yy = nodeCoordinates(:,2);

%drawingMesh(nodeCoordinates,elementNodes,'Q4','k-');
numberNodes    = size(xx,1);
numberElements = size(elementNodes,1);

% GDof: global number of degrees of freedom
GDof = 2*numberNodes;     

% list of nodes on the left edge of the rectangular specimen
index_xL   = index_Left;
index_yL   = index_xL + numberNodes;

% list of nodes on the right edge of the rectangular specimen
index_xR   = index_Right;
index_yR   = index_xR + numberNodes;

presDoF = [index_xL; index_yL; index_xR; index_yR];

%% Solution EF

displacements = cat(1,Nodal_FEA(:,4),Nodal_FEA(:,5));

Nodal_Forces = importdata([caminho2,'Nodal_forces',script.dat]); %Nodal forces matrix:
                                                                        % Column 1:Node Index;
                                                                        % Column 2:FX; Column 3:FY;                                                                        
vecForce = cat(1,Nodal_Forces(:,2),Nodal_Forces(:,3));

Force_scalar_LB = importdata([caminho2,'ScalarsFE_LeftBoundary',script.dat]); %Sum of force matrix:
                                                                        % Column 1:Node Index;
                                                                        % Column 2:FX; Column 3:FY;
fReacLB_x = Force_scalar_LB(1,1);
fReacLB_y = Force_scalar_LB(1,2);
fReacLB = fReacLB_x;


Force_scalar_RB = importdata([caminho2,'ScalarsFE_RightBoundary',script.dat]); %Sum of force matrix:
                                                                        % Column 1:Node Index;
                                                                        % Column 2:FX; Column 3:FY;
fReacRB_x = Force_scalar_RB(1,1);
fReacRB_y = Force_scalar_RB(1,2);
fReacRB = fReacRB_x;
    
fReacEXP = abs(MatchID.load(d2f.stagio));
      
disp(['Force Exp = ',num2str(fReacEXP)]) 
disp(['Force Num = ',num2str(abs(fReacRB))]) 

% figure(100); plot(vecForce);

%% Results

% displacements
% disp('Displacements')
jj = 1:GDof; format
f = [jj; displacements'];
% fprintf('node U\n')
% fprintf('%3d %12.8e\n',f)
UX = displacements(1:numberNodes);
UY = displacements(numberNodes+1:GDof);
glibNOS = [transpose(1:numberNodes), UX,UY];
scaleFactor = 10;

amp = 1;
xdef = nodeCoordinates(:,1) + UX.*amp;
ydef = nodeCoordinates(:,2) + UY.*amp;

figure('Color',[1,1,1])
plot(nodeCoordinates(:,1),nodeCoordinates(:,2),'*' )
hold on;
plot(xdef,ydef,'s')
set(gca, 'YDir','reverse')
legend('Initial mesh','Mesh with displacements')
title('Displacements visualization FEM') 
xlabel('x [mm]')  
ylabel('y [mm]')


%% Strain

strain = zeros(numberElements,size(elementNodes,2),3);

for i=1:size(elementNodes,1)
    for k =1:nnel
    strain(i,k,1) = Nodal_FEA(elementNodes(i,k),6);
    end
end

for i=1:size(elementNodes,1)
    for k =1:nnel
    strain(i,k,2) = Nodal_FEA(elementNodes(i,k),7);
    end
end

for i=1:size(elementNodes,1)
    for k =1:nnel
    strain(i,k,3) = Nodal_FEA(elementNodes(i,k),8);
    end
end

strainEF    = [];
strainEF.XX = zeros(numberElements,1);
strainEF.YY = zeros(numberElements,1);
strainEF.XY = zeros(numberElements,1);

for e = 1:numberElements
    auXX = 0;
    auYY = 0;
    auXY = 0;
    for q = 1:nnel
        auXX = auXX + strain(e,q,1); % 1: xx component
        auYY = auYY + strain(e,q,2); % 2: yy component
        auXY = auXY + strain(e,q,3); % 3: xy component
    end
    strainEF.XX(e) = auXX/4;
    strainEF.YY(e) = auYY/4;
    strainEF.XY(e) = auXY/4;
end

filenome = [caminho,angle,filesep,projeto,filesep,projeto,'_Strain_Centroid','.mat'];
save(filenome,'numberNodes','numberElements','strainEF');

%% Coordinates of elements centroid

coodXElements = [];
coodYElements = [];
for i = 1:size(elementNodes,1)
    % number of node
    numNO1 = elementNodes(i,1);
    numNO2 = elementNodes(i,2);
    numNO3 = elementNodes(i,3);
    numNO4 = elementNodes(i,4);
    % coordinates X of each node
    aX1 = nodeCoordinates(numNO1,1);
    aX2 = nodeCoordinates(numNO2,1);
    aX3 = nodeCoordinates(numNO3,1);
    aX4 = nodeCoordinates(numNO4,1);
    coodXElements = cat(1,coodXElements,mean([aX1,aX2,aX3,aX4]));
    % coordinates Y of each node
    aY1 = nodeCoordinates(numNO1,2);
    aY2 = nodeCoordinates(numNO2,2);
    aY3 = nodeCoordinates(numNO3,2);
    aY4 = nodeCoordinates(numNO4,2);
    coodYElements = cat(1,coodYElements,mean([aY1,aY2,aY3,aY4]));
end

%% FEM2DIC

disp(['FEM2DIC...']) 

xx    = nodeCoordinates(:,1);
yy    = nodeCoordinates(:,2);

[xxE, yyE] = meshgrid(xdicline,ydicline);

switch funcInt
    case 'scatteredInterpolant'
        UX2 = scatteredInterpolant(xx,yy,UX);
        UXfem2dic = UX2(xxE,yyE);
        UXfem2dic = inpaint_nans(UXfem2dic);
        % -
        UY2 = scatteredInterpolant(xx,yy,UY);
        UYfem2dic = UY2(xxE,yyE);
        UYfem2dic = inpaint_nans(UYfem2dic);
        % -
        epsXX2 = scatteredInterpolant(coodXElements,coodYElements,strainEF.XX);
        epsXXfem2dic = epsXX2(xxE,yyE);
        epsXXfem2dic = inpaint_nans(epsXXfem2dic);
        % -
        epsYY2 = scatteredInterpolant(coodXElements,coodYElements,strainEF.YY);
        epsYYfem2dic = epsYY2(xxE,yyE);
        epsYYfem2dic = inpaint_nans(epsYYfem2dic);
        % -
        epsXY2 = scatteredInterpolant(coodXElements,coodYElements,strainEF.XY);
        epsXYfem2dic = epsXY2(xxE,yyE);
        epsXYfem2dic = inpaint_nans(epsXYfem2dic);
    case 'griddata'
        UXfem2dic = griddata(xx,yy,UX,xxE,yyE);
        UXfem2dic = inpaint_nans(UXfem2dic);
        UYfem2dic = griddata(xx,yy,UY,xxE,yyE);
        UYfem2dic = inpaint_nans(UYfem2dic); 
        % -
        epsXXfem2dic = griddata(coodXElements,coodYElements,strainEF.XX,xxE,yyE);
        epsXXfem2dic = inpaint_nans(epsXXfem2dic);
        epsYYfem2dic = griddata(coodXElements,coodYElements,strainEF.YY,xxE,yyE);
        epsYYfem2dic = inpaint_nans(epsYYfem2dic); 
        epsXYfem2dic = griddata(coodXElements,coodYElements,strainEF.XY,xxE,yyE);
        epsXYfem2dic = inpaint_nans(epsXYfem2dic);
end

% Comparing meshes from experimental and numerical
figure('color',[1 1 1]);
plot(xx,yy,'r*'); 
hold on;
plot(xdic,ydic,'k--o'); 
legend('FEM Mesh','DIC Mesh')
title('Mesh DIC VS FEM') 
xlabel('x [mm]')  
ylabel('y [mm]')
set(gca, 'YDir','reverse')


    case 'yes'

% Copying .mesh and .csv files from ansys directory to MatchID FE_DEF directory

stage = num2str(d2f.stagio);  

copyfile([caminho2,projeto,'_displacements_s',stage,'.csv'],[caminhoFE_DEF,projeto,'_displacements_s',stage,'.csv'],'f'); 

copyfile([caminho2,projeto,'_nodes_elements_s',stage,'.mesh'],[caminhoFE_DEF,projeto,'_nodes_elements_s',stage,'.mesh'],'f');     

%-------- Running FE Deformation module in batch mode---------------------%

disp(['Running FE Deformation in MatchID...']) 

filname1 = [projeto,'_FE_DEF_s',stage];


% executing MatchID .mtind file:
% ======================================================================= %
 cd(caminhoFE_DEF);   % changing Directory by the one where MatchID files are stored
 dos(['matchid.exe ',filname1,'.mtind']); % MatchID is executed in batch mode
% ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: %
 
% ======================================================================= %
 cd(caminhoMAT);    % rechanging Directory to the 'Identification' one
%-------------------------------------------------------------------------%
 
% Copying .def files from FE_DEF directory to FE_VAL directory
 
copyfile([caminhoFE_DEF,projeto,'_0000_Numerical_0_0','.def'],[caminhoFE_VAL,projeto,'_0000_Numerical_0_0','.def'],'f'); 

copyfile([caminhoFE_DEF,projeto,'_0000_Numerical_1_0','.def'],[caminhoFE_VAL,projeto,'_0000_Numerical_1_0','.def'],'f'); 

%Copying DIC .dat file to FE_VAL directory

switch Virtual_Reference
    case 'no'

stagename_MatchID = num2str(d2f.stagio,'%04.f');

copyfile([caminhoMatchID,'1.Experimental DIC\',DIC_Sett_Point,filesep,projeto,'_',stagename_MatchID,'.tif.dat'],...
    [caminhoFE_VAL,projeto,'_',stagename_MatchID,'.tif.dat'],'f'); 

    case 'yes'
        
stagename_MatchID = num2str(d2f.stagio,'%04.f');

copyfile([caminhoMatchID,'2.FE_DEF\Synthetic virtual reference\',DIC_Sett_Point,filesep,projeto,'_0000_Numerical_1_0','.def.dat'],...
    [caminhoFE_VAL,projeto,'_',stagename_MatchID,'.tif.dat'],'f'); 
end

%-------- Running FE Validation module in batch mode---------------------%

disp(['Running FE Validation in MatchID...']) 

filname1 = [projeto,'_FE_VAL_s',stage];


% executing MatchID .feval file:
% ======================================================================= %
 cd(caminhoFE_VAL);   % changing Directory by the one where MatchID files are stored
 dos(['matchid.exe ',filname1,'.feval']); % MatchID is executed in batch mode
% ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: %
 
% ======================================================================= %
 cd(caminhoMAT);    % rechanging Directory to the 'Identification' one
%-------------------------------------------------------------------------%
 
%importing results from Synthetic images

DIC_differences_aux = importdata([caminhoFE_VAL,'difference_0','.csv']);    %differences matrix:
                                                                        
DIC_differences = DIC_differences_aux.data;

xx_FEA_synt_vec = DIC_differences(:,1)*converfactor; %mm
xx_FEA_synt_vec = xx_FEA_synt_vec-MatchID.ROI.X*converfactor; %mm

yy_FEA_synt_vec = DIC_differences(:,2)*converfactor; %mm
yy_FEA_synt_vec = yy_FEA_synt_vec-MatchID.ROI.Y*converfactor; %mm

ROI_X = MatchID.ROI.X;
ROI_Y = MatchID.ROI.Y;

ux_FEA_synt = DIC_differences(:,12)*converfactor; %mm
uy_FEA_synt = DIC_differences(:,14)*converfactor; %mm

epsXX_FEA_synt = DIC_differences(:,16);
epsYY_FEA_synt = DIC_differences(:,18);
epsXY_FEA_synt = 2*DIC_differences(:,20); %epsxy to epsS

%Creating matrixes 
xgv = sort(unique(xx_FEA_synt_vec));
ygv = sort(unique(yy_FEA_synt_vec));

[xx,yy] = meshgrid(xgv,ygv);

UXfem2dic = griddata(xx_FEA_synt_vec,yy_FEA_synt_vec,ux_FEA_synt,xx,yy);
UYfem2dic = griddata(xx_FEA_synt_vec,yy_FEA_synt_vec,uy_FEA_synt,xx,yy);

epsXXfem2dic = griddata(xx_FEA_synt_vec,yy_FEA_synt_vec,epsXX_FEA_synt,xx,yy);
epsYYfem2dic = griddata(xx_FEA_synt_vec,yy_FEA_synt_vec,epsYY_FEA_synt,xx,yy);
epsXYfem2dic = griddata(xx_FEA_synt_vec,yy_FEA_synt_vec,epsXY_FEA_synt,xx,yy);

% Adding the NaNs to the same indexes from DIC

[row,column] = find(isnan(uxdic));

for i =1:length(row)
UXfem2dic(row(i,1),column(i,1)) = NaN;
end

for i =1:length(row)
UYfem2dic(row(i,1),column(i,1)) = NaN;
end

for i =1:length(row)
epsXXfem2dic(row(i,1),column(i,1)) = NaN;
end

for i =1:length(row)
epsYYfem2dic(row(i,1),column(i,1)) = NaN;
end

for i =1:length(row)
epsXYfem2dic(row(i,1),column(i,1)) = NaN;
end

% Figure
 figure('Color',[1,1,1])
 plot(xx,yy,'r*')
 title('Synthetic image - FEA based Mesh of Plate') 
 xlabel('x [mm]')  
 ylabel('y [mm]')
 axis([0. Lx*1.01 0. Ly*1.01])
 set(gca, 'YDir','reverse')
 %axis off tight 
 if Lx == Ly
     axis equal ;
 end
 print([caminho,angle,filesep,projeto,filesep,nomedoc,'doc03'],'-djpeg','-r300')

%Global forces
 
Force_scalar_LB = importdata([caminho2,'ScalarsFE_LeftBoundary',script.dat]); %Sum of force matrix:
                                                                        % Column 1:Node Index;
                                                                        % Column 2:FX; Column 3:FY;
fReacLB_x = Force_scalar_LB(1,1);
fReacLB_y = Force_scalar_LB(1,2);
fReacLB = fReacLB_x;


Force_scalar_RB = importdata([caminho2,'ScalarsFE_RightBoundary',script.dat]); %Sum of force matrix:
                                                                        % Column 1:Node Index;
                                                                        % Column 2:FX; Column 3:FY;
fReacRB_x = Force_scalar_RB(1,1);
fReacRB_y = Force_scalar_RB(1,2);
fReacRB = fReacRB_x;
    
fReacEXP = abs(MatchID.load(d2f.stagio));
      
disp(['Force Exp = ',num2str(fReacEXP)]) 
disp(['Force Num = ',num2str(abs(fReacRB))])  

%plotting deformed and underformed

amp = 1;
xdef = xx_FEA_synt_vec + ux_FEA_synt.*amp;
ydef = yy_FEA_synt_vec + uy_FEA_synt.*amp;

figure('Color',[1,1,1])
plot(xx_FEA_synt_vec,yy_FEA_synt_vec,'*' )
hold on;
plot(xdef,ydef,'s')
set(gca, 'YDir','reverse')
legend('Initial mesh','Mesh with displacements')
title('Displacements visualization FEM') 
xlabel('x [mm]')  
ylabel('y [mm]')

% Comparing meshes from experimental and numerical
figure('color',[1 1 1]);
plot(xx,yy,'r*'); 
hold on;
plot(xdic,ydic,'k--o'); 
legend('Synthetc FEM Mesh','DIC Mesh')
title('Mesh DIC VS Synthetic FEM') 
xlabel('x [mm]')  
ylabel('y [mm]')
set(gca, 'YDir','reverse')

end

%% Plotting results

disp(['Plotting results...']) 
escala     = 'igual'; % 'igual'; 'no'

% ============================================== %
% X: components of the displacement (UX) .................................
% ============================================== %

uxmax = max(uxdic(:));

[~,absmax_ux] = max(abs(uxdic(:)));
ux_absmax = uxdic(absmax_ux);

uxmin = min(uxdic(:));
% [~,absmin_ux] = min(abs(uxdic(:)));
% uxmin = uxdic(absmin_ux);

fig = figure('Color',[1,1,1]);
axes('Position',[0.05 0.5 0.5 0.5],'Parent',fig);
imagesc(xdicline,ydicline,uxdic, [uxmin uxmax]); 
axis equal tight off; colorbar; 
colormap(script.colormap); title('UX - dic')
axes('Position',[0.05 0.05 0.5 0.5],'Parent',fig);
if isequal(escala,'igual') 
    imagesc(xdicline,ydicline,UXfem2dic, [uxmin uxmax]); 
else imagesc(xdicline,ydicline,UXfem2dic); 
end
axis equal tight off; colorbar; 
colormap(script.colormap); title('UX - fem')
% -
residUX = ((uxdic-UXfem2dic)./ux_absmax).*100;
axes('Position',[0.6 0.05 0.4 0.4],'Parent',fig);
imagesc(residUX); axis equal tight off; colorbar; 
colormap(script.colormap); title('dif. (%)')
% -
finemone = [caminho,angle,filesep,projeto,filesep,projeto,'_uxDICFEM'];
print(script.imgformat,script.resol,finemone)
crop([finemone,script.filetype2])

% ============================================== %
% Y: components of the displacement (UY) .................................
% ============================================== %
uymax = max(uydic(:));

[~,absmax_uy] = max(abs(uydic(:)));
uy_absmax = uydic(absmax_uy);
 
uymin = min(uydic(:));
% [~,absmin_uy] = min(abs(uydic(:)));
% uymin = uydic(absmin_uy);

fig = figure('Color',[1,1,1]);
axes('Position',[0.05 0.5 0.5 0.5],'Parent',fig);
imagesc(xdicline,ydicline,uydic, [uymin uymax]); axis equal tight off;
colorbar; title('UY - dic'); colormap(script.colormap)
axes('Position',[0.05 0.05 0.5 0.5],'Parent',fig);
if isequal(escala,'igual')
    imagesc(xdicline,ydicline,UYfem2dic, [uymin uymax]); 
else imagesc(xdicline,ydicline,UYfem2dic); 
end
axis equal tight off; colorbar; 
colormap(script.colormap); title('UY - fem')
% -
residUY = ((uydic-UYfem2dic)./uy_absmax).*100;
axes('Position',[0.6 0.05 0.4 0.4],'Parent',fig);
imagesc(residUY); axis equal tight off; 
colorbar; colormap(script.colormap); title('dif. (%)')
% -
finemone = [caminho,angle,filesep,projeto,filesep,projeto,'_uyDICFEM'];
print(script.imgformat,script.resol,finemone)

% ============================================== %
% epsX: strain components 
% ============================================== %

epsxmax = max(epsXdic(:));

[~,absmax_epsx] = max(abs(epsXdic(:)));
epsx_absmax = epsXdic(absmax_epsx);
 
epsxmin = min(epsXdic(:));

fig = figure('Color',[1,1,1]);
axes('Position',[0.05 0.5 0.5 0.5],'Parent',fig);
imagesc(xdicline,ydicline,epsXdic, [epsxmin epsxmax]); 
axis equal tight off; colorbar; 
colormap(script.colormap); title('epsX - dic')
axes('Position',[0.05 0.05 0.5 0.5],'Parent',fig);
if isequal(escala,'igual') 
    imagesc(xdicline,ydicline,epsXXfem2dic, [epsxmin epsxmax]); 
else imagesc(xdicline,ydicline,epsXXfem2dic); 
end
axis equal tight off; colorbar; 
colormap(script.colormap); title('epsX - fem')
% -
residepsX = ((epsXdic-epsXXfem2dic)./epsx_absmax)*100;
axes('Position',[0.6 0.05 0.4 0.4],'Parent',fig);
imagesc(residepsX); axis equal tight off; colorbar; 
colormap(script.colormap); title('dif. (%)')
% -
finemone = [caminho,angle,filesep,projeto,filesep,projeto,'_epsXDICFEM'];
print(script.imgformat,script.resol,finemone)
crop([finemone,script.filetype2])

% ============================================== %
% epsY: strain components 
% ============================================== %

epsymax = max(epsYdic(:));
[~,absmax_epsy] = max(abs(epsYdic(:)));
epsy_absmax = epsYdic(absmax_epsy);

epsymin = min(epsYdic(:));

fig = figure('Color',[1,1,1]);
axes('Position',[0.05 0.5 0.5 0.5],'Parent',fig);
imagesc(xdicline,ydicline,epsYdic, [epsymin epsymax]); 
axis equal tight off; colorbar; 
colormap(script.colormap); title('epsY - dic')
axes('Position',[0.05 0.05 0.5 0.5],'Parent',fig);
if isequal(escala,'igual') 
    imagesc(xdicline,ydicline,epsYYfem2dic, [epsymin epsymax]); 
else imagesc(xdicline,ydicline,epsYYfem2dic); 
end
axis equal tight off; colorbar; 
colormap(script.colormap); title('epsY - fem')
% -
residepsY = ((epsYdic-epsYYfem2dic)./epsy_absmax)*100;
axes('Position',[0.6 0.05 0.4 0.4],'Parent',fig);
imagesc(residepsY); axis equal tight off; colorbar; 
colormap(script.colormap); title('dif. (%)')
% -
finemone = [caminho,angle,filesep,projeto,filesep,projeto,'_epsYDICFEM'];
print(script.imgformat,script.resol,finemone)
crop([finemone,script.filetype2])

% ============================================== %
% epsS: strain components 
% ============================================== %

epsSmax = max(epsSdic(:));

[~,absmax_epsxy] = max(abs(epsSdic(:)));
epsS_absmax = epsSdic(absmax_epsxy);

epsSmin = min(epsSdic(:));

fig = figure('Color',[1,1,1]);
axes('Position',[0.05 0.5 0.5 0.5],'Parent',fig);
imagesc(xdicline,ydicline,epsSdic, [epsSmin epsSmax]); 
axis equal tight off; colorbar; 
colormap(script.colormap); title('epsS - dic')
axes('Position',[0.05 0.05 0.5 0.5],'Parent',fig);
if isequal(escala,'igual') 
    imagesc(xdicline,ydicline,epsXYfem2dic, [epsSmin epsSmax]); 
else imagesc(xdicline,ydicline,epsXYfem2dic); 
end
axis equal tight off; colorbar; 
colormap(script.colormap); title('epsS - fem')
% -
residepsS = ((epsSdic-epsXYfem2dic)./epsS_absmax)*100;
axes('Position',[0.6 0.05 0.4 0.4],'Parent',fig);
imagesc(residepsS); axis equal tight off; colorbar; 
colormap(script.colormap); title('dif. (%)')
% -
finemone = [caminho,angle,filesep,projeto,filesep,projeto,'_epsSDICFEM'];
print(script.imgformat,script.resol,finemone)
crop([finemone,script.filetype2])

switch SyntImag_approach
    case 'no'

% ============================================== %
% Plot to check the prescribed displacements at the left and right edges
% ============================================== %
figure('color',[1 1 1]); hold on; 
plot(y000,uxdic(:,1),'*--'); 
plot(y001_L,yFEM_UX_leftBC)
plot(y001_L,displacements(index_xL),'ob');
plot(y000,UXfem2dic(:,1),'rs');
%plot(linspace(0,1,size(UX(index_xL,1),1)),UX(index_xL,1),'v');
legend('uxdic','uxpresc','displa-sol','uxfem2dic','location','best')
xlabel('y/y_{max}, [mm]');  
ylabel('ux, [mm] (CF esquerda)');
print([caminho,angle,filesep,projeto,filesep,nomedoc,'doc08'],'-djpeg','-r300')

figure('color',[1 1 1]); hold on;
plot(y000,uxdic(:,end),'*--'); 
plot(y001_R,yFEM_UX_rightBC)
plot(y001_R,displacements(index_xR),'ob');
plot(y000,UXfem2dic(:,end),'rs');
legend('uydic','uypresc','displa-sol','uyfem2dic','location','best')
xlabel('y/y_{max}, [mm]');  
ylabel('ux, [mm] (CF direita)');
print([caminho,angle,filesep,projeto,filesep,nomedoc,'doc09'],'-djpeg','-r300')

figure('color',[1 1 1]); hold on; 
plot(y000,uydic(:,1),'*--'); 
plot(y001_L,yFEM_UY_leftBC)
plot(y001_L,displacements(index_yL),'ob');
plot(y000,UYfem2dic(:,1),'rs');
legend('uydic','uypresc','displa-sol','uyfem2dic','location','best')
xlabel('y/y_{max}, [mm]');  
ylabel('uy, [mm] (CF esquerda)');
print([caminho,angle,filesep,projeto,filesep,nomedoc,'doc10'],'-djpeg','-r300')

figure('color',[1 1 1]); hold on;
plot(y000,uydic(:,end),'*--'); 
plot(y001_R,yFEM_UY_rightBC)
plot(y001_R,displacements(index_yR),'ob');
plot(y000,UYfem2dic(:,end),'rs');
legend('uydic','uypresc','displa-sol','uyfem2dic','location','best')
xlabel('y/y_{max}, [mm]');  
ylabel('uy, [mm] (CF direita)');
print([caminho,angle,filesep,projeto,filesep,nomedoc,'doc11'],'-djpeg','-r300')

    case 'no'
        
end

%% Output

switch FEM_as_DIC
    case 'no' 
        disp('Exporting DIC Data...')
filenome = [caminho,angle,filesep,projeto,filesep,projeto,'_infoFEMU',script.mat];   

        switch SyntImag_approach
    case 'no'
save(filenome,'d2f','u2fit','xdic','ydic','uxdic','uydic','epsXdic','epsYdic','epsSdic',...
    'nodeCoordinates','elementNodes','nnel','materialTipo','DIC_Software','SyntImag_approach',...
    'Lx','Ly','thickness','xdicline','ydicline','index_xL','index_yL','directy','Virtual_Reference',...
    'index_xR','index_yR','yFEM_UX_leftBC','yFEM_UY_leftBC','FEM_as_DIC','ansysV','DIC_Sett_Point',...
    'yFEM_UX_rightBC','yFEM_UY_rightBC','fReacEXP','tipoBC','index_Right','index_Left')

    case 'yes'
save(filenome,'d2f','u2fit','xdic','ydic','uxdic','uydic','epsXdic','epsYdic','epsSdic',...
    'nnel','materialTipo','DIC_Software','SyntImag_approach','DIC_Sett_Point','ROI_X','ROI_Y',......
    'Lx','Ly','thickness','xdicline','ydicline','directy','Virtual_Reference','converfactor',...
    'yFEM_UX_leftBC','yFEM_UY_leftBC','FEM_as_DIC','ansysV','caminhoMatchID','caminhoFE_DEF','caminhoFE_VAL',...
    'yFEM_UX_rightBC','yFEM_UY_rightBC','fReacEXP','tipoBC','index_Right','index_Left')        
        end
        
    case 'yes' 
        disp('Warning: Using FEM data as DIC data...')
        
uxdic = UXfem2dic;
uydic = UYfem2dic;

epsXdic = epsXXfem2dic;
epsYdic = epsYYfem2dic;
epsSdic = epsXYfem2dic;

fReacEXP = abs(fReacLB);

filenome = [caminho,angle,filesep,projeto,filesep,projeto,'_infoFEMU',script.mat];

        switch SyntImag_approach
    case 'no'
save(filenome,'d2f','u2fit','xdic','ydic','uxdic','uydic','epsXdic','epsYdic','epsSdic',...
'nodeCoordinates','elementNodes','nnel','materialTipo','DIC_Software','SyntImag_approach',...
'Lx','Ly','thickness','xdicline','ydicline','index_xL','index_yL','directy','Virtual_Reference',...
'index_xR','index_yR','yFEM_UX_leftBC','yFEM_UY_leftBC','FEM_as_DIC','ansysV','DIC_Sett_Point',...
'yFEM_UX_rightBC','yFEM_UY_rightBC','fReacEXP','tipoBC','index_Right','index_Left')

    case 'yes'
save(filenome,'d2f','u2fit','xdic','ydic','uxdic','uydic','epsXdic','epsYdic','epsSdic',...
    'nnel','materialTipo','DIC_Software','SyntImag_approach','DIC_Sett_Point','ROI_X','ROI_Y',...
    'Lx','Ly','thickness','xdicline','ydicline','directy','Virtual_Reference','converfactor',...
    'yFEM_UX_leftBC','yFEM_UY_leftBC','FEM_as_DIC','ansysV','caminhoMatchID','caminhoFE_DEF','caminhoFE_VAL',...
    'yFEM_UX_rightBC','yFEM_UY_rightBC','fReacEXP','tipoBC','index_Right','index_Left')        
        end
end

toc
