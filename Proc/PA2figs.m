%% Input

% D. Henriques, J. Xavier, G. Andrade-Campos
% J. Xavier UNIDEMI, jmc.xavier@fct.unl.pt

% clear workSpace
clear all; clc; close all;
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
script.ext        = '.dat';
script.csv        = '.csv';
script.resol      = '-r300';

% Change default axes fonts.
set(0,'DefaultAxesFontName', script.nomeF)
set(0,'DefaultAxesFontSize', script.size_font2)

% Change default text fonts.
set(0,'DefaultTextFontname', script.nomeF)
set(0,'DefaultTextFontSize', script.size_font2)

% USER %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
angle = 'A60';      % A00; A60;
projeto = 'A60_10'; % A00_10; A60_10;

caminho = ['D:\JDHenriques\Compression\',angle,filesep,projeto];

%%%%

switch projeto
    case 'A00_10'
    
%CSV files for earlywood
filename_EW_small = ['PA',filesep,'P_145_799_EW_s27_Exx-VSG'];
filename_EW_large = ['PA',filesep,'P_940_593_EW_s27_Exx-VSG'];
%CSV files for latewood
filename_LW_small = ['PA',filesep,'P_314_598_LW_s27_Exx-VSG'];
filename_LW_large = ['PA',filesep,'P_730_699_LW_s27_Exx-VSG'];

Point1_EW = [145,799];
Point2_EW = [940,593];
Point1_LW = [314,598];
Point2_LW = [730,699];

ytrans = 40;
rect = [33,208+ytrans,1582,1003+ytrans];

    case 'A60_10'
    
%CSV files for earlywood
filename_EW_small = ['PA',filesep,'P_145_825_EW_s24_Exx-VSG'];
filename_EW_large = ['PA',filesep,'P_766_700_EW_s24_Exx-VSG'];
%CSV files for latewood
filename_LW_small = ['PA',filesep,'P_1302_814_LW_s24_Exx-VSG'];
filename_LW_large = ['PA',filesep,'P_297_743_LW_s24_Exx-VSG'];

Point1_EW = [145,825];
Point2_EW = [766,700];
Point1_LW = [1302,814];
Point2_LW = [297,743];

ytrans = -211;
rect = [16,388+ytrans,1589,1049+ytrans];

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
irings = flipud(imread([caminho,filesep,projeto,'_Rings.tif'])); 
load([caminho,filesep,projeto,'_ConvFact.mat'])
mm2pixel = converfactor; % pixel to mm conversion factor
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear converfactor

%% Read EW PA

disp('Read EW PA...')

EW = struct;

% Point 1 EW smaller tissue

fstr = 'Sig_VSG';
EW.small.Sig_VSG.path = [caminho,filesep,filename_EW_small,script.csv];
eval(['res = PAreadCSV(EW.small.',fstr,'.path);'])
eval(['EW.small.',fstr,'.AffQ4.X = res.AffQ4.X;']) % Affine/Q4
eval(['EW.small.',fstr,'.AffQ4.Y = res.AffQ4.Y;']) 
eval(['EW.small.',fstr,'.AffQ8.X = res.AffQ8.X;']) % Affine/Q8
eval(['EW.small.',fstr,'.AffQ8.Y = res.AffQ8.Y;'])
eval(['EW.small.',fstr,'.QuadQ4.X = res.QuadQ4.X;']) % Quadratic/Q4
eval(['EW.small.',fstr,'.QuadQ4.Y = res.QuadQ4.Y;'])
eval(['EW.small.',fstr,'.QuadQ8.X = res.QuadQ8.X;']) % Quadratic/Q8
eval(['EW.small.',fstr,'.QuadQ8.Y = res.QuadQ8.Y;'])

% Point 2 EW smaller tissue 

fstr = 'Sig_VSG';
EW.large.Sig_VSG.path = [caminho,filesep,filename_EW_large,script.csv];
eval(['res = PAreadCSV(EW.large.',fstr,'.path);'])
eval(['EW.large.',fstr,'.AffQ4.X = res.AffQ4.X;']) % Affine/Q4
eval(['EW.large.',fstr,'.AffQ4.Y = res.AffQ4.Y;']) 
eval(['EW.large.',fstr,'.AffQ8.X = res.AffQ8.X;']) % Affine/Q8
eval(['EW.large.',fstr,'.AffQ8.Y = res.AffQ8.Y;'])
eval(['EW.large.',fstr,'.QuadQ4.X = res.QuadQ4.X;']) % Quadratic/Q4
eval(['EW.large.',fstr,'.QuadQ4.Y = res.QuadQ4.Y;'])
eval(['EW.large.',fstr,'.QuadQ8.X = res.QuadQ8.X;']) % Quadratic/Q8
eval(['EW.large.',fstr,'.QuadQ8.Y = res.QuadQ8.Y;'])


%% Read LW PA

disp('Read LW PA...')

LW = struct;

% Point 1 LW smaller tissue

fstr = 'Sig_VSG';
LW.small.Sig_VSG.path = [caminho,filesep,filename_LW_small,script.csv];
eval(['res = PAreadCSV(LW.small.',fstr,'.path);'])
eval(['LW.small.',fstr,'.AffQ4.X = res.AffQ4.X;']) % Affine/Q4
eval(['LW.small.',fstr,'.AffQ4.Y = res.AffQ4.Y;']) 
eval(['LW.small.',fstr,'.AffQ8.X = res.AffQ8.X;']) % Affine/Q8
eval(['LW.small.',fstr,'.AffQ8.Y = res.AffQ8.Y;'])
eval(['LW.small.',fstr,'.QuadQ4.X = res.QuadQ4.X;']) % Quadratic/Q4
eval(['LW.small.',fstr,'.QuadQ4.Y = res.QuadQ4.Y;'])
eval(['LW.small.',fstr,'.QuadQ8.X = res.QuadQ8.X;']) % Quadratic/Q8
eval(['LW.small.',fstr,'.QuadQ8.Y = res.QuadQ8.Y;'])

% Point 2 LW smaller tissue 

fstr = 'Sig_VSG';
LW.large.Sig_VSG.path = [caminho,filesep,filename_LW_large,script.csv];
eval(['res = PAreadCSV(LW.large.',fstr,'.path);'])
eval(['LW.large.',fstr,'.AffQ4.X = res.AffQ4.X;']) % Affine/Q4
eval(['LW.large.',fstr,'.AffQ4.Y = res.AffQ4.Y;']) 
eval(['LW.large.',fstr,'.AffQ8.X = res.AffQ8.X;']) % Affine/Q8
eval(['LW.large.',fstr,'.AffQ8.Y = res.AffQ8.Y;'])
eval(['LW.large.',fstr,'.QuadQ4.X = res.QuadQ4.X;']) % Quadratic/Q4
eval(['LW.large.',fstr,'.QuadQ4.Y = res.QuadQ4.Y;'])
eval(['LW.large.',fstr,'.QuadQ8.X = res.QuadQ8.X;']) % Quadratic/Q8
eval(['LW.large.',fstr,'.QuadQ8.Y = res.QuadQ8.Y;'])

switch projeto 
    case 'A00_10'
% Plot 01 EW:Sig_VSG point 1 small

disp('Plot EW:Sig_VSG for point 1 (small)...')

fstr = 'Sig_VSG';
eval(['X0 = EW.small.',fstr,'.AffQ4.X.*mm2pixel;'])
eval(['Y0 = EW.small.',fstr,'.AffQ4.Y;'])
eval(['X1 = EW.small.',fstr,'.AffQ8.X.*mm2pixel;'])
eval(['Y1 = EW.small.',fstr,'.AffQ8.Y;'])
eval(['X2 = EW.small.',fstr,'.QuadQ4.X.*mm2pixel;'])
eval(['Y2 = EW.small.',fstr,'.QuadQ4.Y;'])
eval(['X3 = EW.small.',fstr,'.QuadQ8.X.*mm2pixel;'])
eval(['Y3 = EW.small.',fstr,'.QuadQ8.Y;'])
fname = [caminho,filesep,'PA\PA_EW_Sig_VSG_Point 1(small)'];

fig1  = figure('color',[1 1 1],'position',script.fig_pos);
axes('Position',[0.14 0.14 0.775 0.775],'FontSize',script.size_font1,...
    'FontName',script.nomeF,'YColor',[0 0 0],'parent',fig1);
hold on; grid on; box on;
plot(X0,Y0,'o','MarkerSize',8,...
    'MarkerEdgeColor',[0,0,0])
plot(X1,Y1,'s','MarkerSize',10,...
    'MarkerFaceColor',[0.941176474094391 0.941176474094391 0.941176474094391],...
    'MarkerEdgeColor',[0.5,0.5,0.5])
plot(X2,Y2,'.','MarkerSize',12,...
    'MarkerFaceColor',[0.678431391716003 0.921568632125854 1],...
    'MarkerEdgeColor',[0 0 0])
plot(X3,Y3,'MarkerSize',10,...
    'MarkerFaceColor',[0.42 0.86 0.92],'LineStyle','none',...
    'Marker','_','MarkerEdgeColor',[0,0,0])

%Marking Selected point
plot(X2(21),Y2(21),'.','MarkerSize',30,...
    'MarkerFaceColor',[0.9290 0.6940 0.1250],...
    'MarkerEdgeColor',[0.9290 0.6940 0.1250])
plot(X2(52),Y2(52),'.','MarkerSize',30,...
    'MarkerFaceColor',[1 0 0],...
    'MarkerEdgeColor',[1 0 0])
plot(X2(178),Y2(178),'.','MarkerSize',30,...
    'MarkerFaceColor',[0 0 1],...
    'MarkerEdgeColor',[0 0 1])
lege = legend('Affine/Q4','Affine/Q8','Quadratic/Q4','Quadratic/Q8',...
    'Selected settings P1','Selected settings P2','Selected settings P3');

% lege = legend('Affine/Q4','Affine/Q8','Quadratic/Q4','Quadratic/Q8');
set(lege,'Position',[0.3509 0.595 0.303 0.310])
% ylim([0 .5e-3])
% xlim([0 70]) % unit: mm
xlabel('VSG [mm]','FontName',script.nomeF,'FontSize',script.size_font2)
ylabel('Strain component : $\varepsilon_{\mathrm{R}}^{\mathrm{EW}}$',...
    'FontName',script.nomeF,'FontSize',script.size_font2,...
    'interpreter','latex')
ai = axes('Position',[0.6675 0.72 0.225 0.175],'FontSize',script.size_font1,...
    'FontName',script.nomeF,'YColor',[0 0 0],'parent',fig1);
% rect = [1,190,1580,1000];
imagesc(irings(rect(2):rect(4),rect(1):rect(3))); colormap('gray'); hold on
plot(Point1_EW(1)-rect(1),Point1_EW(2)-rect(2)+ytrans,'ro','MarkerFaceColor',[1 0 0],'Marker','o','LineStyle','none', 'Color',[1 0 0]); hold off
axis off

% -
ablabel = [0.03 0.88 0.032 0.12];
annotation(fig1,'textbox',ablabel,...
    'String',{'a'},'FontSize',28,'FontName',script.nomeF,...
    'FitBoxToText','off','EdgeColor',[1 1 1]);
% -
print(script.imgformat,script.resol,fname)

%% Plot 02 EW:Sig_VSG point 2 large


disp('Plot EW:Sig_VSG for point 2 (large)...')

fstr = 'Sig_VSG';
eval(['X0 = EW.large.',fstr,'.AffQ4.X.*mm2pixel;'])
eval(['Y0 = EW.large.',fstr,'.AffQ4.Y;'])
eval(['X1 = EW.large.',fstr,'.AffQ8.X.*mm2pixel;'])
eval(['Y1 = EW.large.',fstr,'.AffQ8.Y;'])
eval(['X2 = EW.large.',fstr,'.QuadQ4.X.*mm2pixel;'])
eval(['Y2 = EW.large.',fstr,'.QuadQ4.Y;'])
eval(['X3 = EW.large.',fstr,'.QuadQ8.X.*mm2pixel;'])
eval(['Y3 = EW.large.',fstr,'.QuadQ8.Y;'])
fname = [caminho,filesep,'PA\PA_EW_Sig_VSG_Point 2(large)'];

fig1  = figure('color',[1 1 1],'position',script.fig_pos);
axes('Position',[0.14 0.14 0.775 0.775],'FontSize',script.size_font1,...
    'FontName',script.nomeF,'YColor',[0 0 0],'parent',fig1);
hold on; grid on; box on;
plot(X0,Y0,'o','MarkerSize',8,...
    'MarkerEdgeColor',[0,0,0])
plot(X1,Y1,'s','MarkerSize',10,...
    'MarkerFaceColor',[0.941176474094391 0.941176474094391 0.941176474094391],...
    'MarkerEdgeColor',[0.5,0.5,0.5])
plot(X2,Y2,'.','MarkerSize',12,...
    'MarkerFaceColor',[0.678431391716003 0.921568632125854 1],...
    'MarkerEdgeColor',[0 0 0])
plot(X3,Y3,'MarkerSize',10,...
    'MarkerFaceColor',[0.42 0.86 0.92],'LineStyle','none',...
    'Marker','_','MarkerEdgeColor',[0,0,0])

%Marking Selected point
plot(X2(21),Y2(21),'.','MarkerSize',30,...
    'MarkerFaceColor',[0.9290 0.6940 0.1250],...
    'MarkerEdgeColor',[0.9290 0.6940 0.1250])
plot(X2(52),Y2(52),'.','MarkerSize',30,...
    'MarkerFaceColor',[1 0 0],...
    'MarkerEdgeColor',[1 0 0])
plot(X2(178),Y2(178),'.','MarkerSize',30,...
    'MarkerFaceColor',[0 0 1],...
    'MarkerEdgeColor',[0 0 1])
lege = legend('Affine/Q4','Affine/Q8','Quadratic/Q4','Quadratic/Q8',...
    'Selected settings P1','Selected settings P2','Selected settings P3');

% lege = legend('Affine/Q4','Affine/Q8','Quadratic/Q4','Quadratic/Q8');
set(lege,'Position',[0.5967 0.1572 0.3039 0.3109])
% ylim([0 .5e-3])
% xlim([0 70]) % unit: mm
xlabel('VSG [mm]','FontName',script.nomeF,'FontSize',script.size_font2)
ylabel('Strain component : $\varepsilon_{\mathrm{R}}^{\mathrm{EW}}$',...
    'FontName',script.nomeF,'FontSize',script.size_font2,...
    'interpreter','latex')
ai = axes('Position',[0.3675 0.16 0.225 0.175],'FontSize',script.size_font1,...
    'FontName',script.nomeF,'YColor',[0 0 0],'parent',fig1);

imagesc(irings(rect(2):rect(4),rect(1):rect(3))); colormap('gray'); hold on
plot(Point2_EW(1)-rect(1),Point2_EW(2)-rect(2)+ytrans,'ro','MarkerFaceColor',[1 0 0],'Marker','o','LineStyle','none', 'Color',[1 0 0]); hold off
axis off

% -
ablabel = [0.03 0.88 0.032 0.12];
annotation(fig1,'textbox',ablabel,...
    'String',{'b'},'FontSize',28,'FontName',script.nomeF,...
    'FitBoxToText','off','EdgeColor',[1 1 1]);
% -
print(script.imgformat,script.resol,fname)

%% Plot 03 LW:Sig_VSG point 1 small

disp('Plot LW:Sig_VSG for point 1 (small)...')

fstr = 'Sig_VSG';
eval(['X0 = LW.small.',fstr,'.AffQ4.X.*mm2pixel;'])
eval(['Y0 = LW.small.',fstr,'.AffQ4.Y;'])
eval(['X1 = LW.small.',fstr,'.AffQ8.X.*mm2pixel;'])
eval(['Y1 = LW.small.',fstr,'.AffQ8.Y;'])
eval(['X2 = LW.small.',fstr,'.QuadQ4.X.*mm2pixel;'])
eval(['Y2 = LW.small.',fstr,'.QuadQ4.Y;'])
eval(['X3 = LW.small.',fstr,'.QuadQ8.X.*mm2pixel;'])
eval(['Y3 = LW.small.',fstr,'.QuadQ8.Y;'])
fname = [caminho,filesep,'PA\PA_LW_Sig_VSG_Point 1(small)'];

fig1  = figure('color',[1 1 1],'position',script.fig_pos);
axes('Position',[0.14 0.14 0.775 0.775],'FontSize',script.size_font1,...
    'FontName',script.nomeF,'YColor',[0 0 0],'parent',fig1);
hold on; grid on; box on;
plot(X0,Y0,'o','MarkerSize',8,...
    'MarkerEdgeColor',[0,0,0])
plot(X1,Y1,'s','MarkerSize',10,...
    'MarkerFaceColor',[0.941176474094391 0.941176474094391 0.941176474094391],...
    'MarkerEdgeColor',[0.5,0.5,0.5])
plot(X2,Y2,'.','MarkerSize',12,...
    'MarkerFaceColor',[0.678431391716003 0.921568632125854 1],...
    'MarkerEdgeColor',[0 0 0])
plot(X3,Y3,'MarkerSize',10,...
    'MarkerFaceColor',[0.42 0.86 0.92],'LineStyle','none',...
    'Marker','_','MarkerEdgeColor',[0,0,0])

%Marking Selected point
plot(X2(21),Y2(21),'.','MarkerSize',30,...
    'MarkerFaceColor',[0.9290 0.6940 0.1250],...
    'MarkerEdgeColor',[0.9290 0.6940 0.1250])
plot(X2(52),Y2(52),'.','MarkerSize',30,...
    'MarkerFaceColor',[1 0 0],...
    'MarkerEdgeColor',[1 0 0])
plot(X2(178),Y2(178),'.','MarkerSize',30,...
    'MarkerFaceColor',[0 0 1],...
    'MarkerEdgeColor',[0 0 1])
lege = legend('Affine/Q4','Affine/Q8','Quadratic/Q4','Quadratic/Q8',...
    'Selected settings P1','Selected settings P2','Selected settings P3');

% lege = legend('Affine/Q4','Affine/Q8','Quadratic/Q4','Quadratic/Q8');
set(lege,'Position',[0.3006 0.1474 0.3039 0.3109])
% ylim([0 .5e-3])
% xlim([0 70]) % unit: mm
xlabel('VSG [mm]','FontName',script.nomeF,'FontSize',script.size_font2)
ylabel('Strain component : $\varepsilon_{\mathrm{R}}^{\mathrm{EW}}$',...
    'FontName',script.nomeF,'FontSize',script.size_font2,...
    'interpreter','latex')
ai = axes('Position',[0.6675 0.72 0.225 0.175],'FontSize',script.size_font1,...
    'FontName',script.nomeF,'YColor',[0 0 0],'parent',fig1);

imagesc(irings(rect(2):rect(4),rect(1):rect(3))); colormap('gray'); hold on
plot(Point1_LW(1)-rect(1),Point1_LW(2)-rect(2)+ytrans,'ro','MarkerFaceColor',[1 0 0],'Marker','o','LineStyle','none', 'Color',[1 0 0]); hold off
axis off
% -
ablabel = [0.03 0.88 0.032 0.12];
annotation(fig1,'textbox',ablabel,...
    'String',{'c'},'FontSize',28,'FontName',script.nomeF,...
    'FitBoxToText','off','EdgeColor',[1 1 1]);
% -
print(script.imgformat,script.resol,fname)

%% Plot 04 LW:Sig_VSG point 2 large
disp('Plot LW:Sig_VSG for point 2 (large)...')

fstr = 'Sig_VSG';
eval(['X0 = LW.large.',fstr,'.AffQ4.X.*mm2pixel;'])
eval(['Y0 = LW.large.',fstr,'.AffQ4.Y;'])
eval(['X1 = LW.large.',fstr,'.AffQ8.X.*mm2pixel;'])
eval(['Y1 = LW.large.',fstr,'.AffQ8.Y;'])
eval(['X2 = LW.large.',fstr,'.QuadQ4.X.*mm2pixel;'])
eval(['Y2 = LW.large.',fstr,'.QuadQ4.Y;'])
eval(['X3 = LW.large.',fstr,'.QuadQ8.X.*mm2pixel;'])
eval(['Y3 = LW.large.',fstr,'.QuadQ8.Y;'])
fname = [caminho,filesep,'PA\PA_LW_Sig_VSG_Point 2(large)'];

fig1  = figure('color',[1 1 1],'position',script.fig_pos);
axes('Position',[0.14 0.14 0.775 0.775],'FontSize',script.size_font1,...
    'FontName',script.nomeF,'YColor',[0 0 0],'parent',fig1);
hold on; grid on; box on;
plot(X0,Y0,'o','MarkerSize',8,...
    'MarkerEdgeColor',[0,0,0])
plot(X1,Y1,'s','MarkerSize',10,...
    'MarkerFaceColor',[0.941176474094391 0.941176474094391 0.941176474094391],...
    'MarkerEdgeColor',[0.5,0.5,0.5])
plot(X2,Y2,'.','MarkerSize',12,...
    'MarkerFaceColor',[0.678431391716003 0.921568632125854 1],...
    'MarkerEdgeColor',[0 0 0])
plot(X3,Y3,'MarkerSize',10,...
    'MarkerFaceColor',[0.42 0.86 0.92],'LineStyle','none',...
    'Marker','_','MarkerEdgeColor',[0,0,0])

%Marking Selected point
plot(X2(21),Y2(21),'.','MarkerSize',30,...
    'MarkerFaceColor',[0.9290 0.6940 0.1250],...
    'MarkerEdgeColor',[0.9290 0.6940 0.1250])
plot(X2(52),Y2(52),'.','MarkerSize',30,...
    'MarkerFaceColor',[1 0 0],...
    'MarkerEdgeColor',[1 0 0])
plot(X2(178),Y2(178),'.','MarkerSize',30,...
    'MarkerFaceColor',[0 0 1],...
    'MarkerEdgeColor',[0 0 1])
lege = legend('Affine/Q4','Affine/Q8','Quadratic/Q4','Quadratic/Q8',...
    'Selected settings P1','Selected settings P2','Selected settings P3');

% lege = legend('Affine/Q4','Affine/Q8','Quadratic/Q4','Quadratic/Q8');
set(lege,'Position',[0.3571 0.5908 0.3039 0.3109])
% ylim([0 .5e-3])
% xlim([0 70]) % unit: mm
xlabel('VSG [mm]','FontName',script.nomeF,'FontSize',script.size_font2)
ylabel('Strain component : $\varepsilon_{\mathrm{R}}^{\mathrm{EW}}$',...
    'FontName',script.nomeF,'FontSize',script.size_font2,...
    'interpreter','latex')
ai = axes('Position',[0.6675 0.72 0.225 0.175],'FontSize',script.size_font1,...
    'FontName',script.nomeF,'YColor',[0 0 0],'parent',fig1);

imagesc(irings(rect(2):rect(4),rect(1):rect(3))); colormap('gray'); hold on
plot(Point2_LW(1)-rect(1),Point2_LW(2)-rect(2)+ytrans,'ro','MarkerFaceColor',[1 0 0],'Marker','o','LineStyle','none', 'Color',[1 0 0]); hold off
axis off
% -
ablabel = [0.03 0.88 0.032 0.12];
annotation(fig1,'textbox',ablabel,...
    'String',{'d'},'FontSize',28,'FontName',script.nomeF,...
    'FitBoxToText','off','EdgeColor',[1 1 1]);
% -
print(script.imgformat,script.resol,fname)


%% Plot 05 ALL:Sig_VSG point 
disp('Plot LW:Sig_VSG for all points...')

fstr = 'Sig_VSG';

eval(['X0_1 = EW.small.',fstr,'.AffQ4.X.*mm2pixel;'])
eval(['Y0_1 = EW.small.',fstr,'.AffQ4.Y;'])
eval(['X1_1 = EW.small.',fstr,'.AffQ8.X.*mm2pixel;'])
eval(['Y1_1 = EW.small.',fstr,'.AffQ8.Y;'])
eval(['X2_1 = EW.small.',fstr,'.QuadQ4.X.*mm2pixel;'])
eval(['Y2_1 = EW.small.',fstr,'.QuadQ4.Y;'])
eval(['X3_1 = EW.small.',fstr,'.QuadQ8.X.*mm2pixel;'])
eval(['Y3_1 = EW.small.',fstr,'.QuadQ8.Y;'])

eval(['X0_2 = EW.large.',fstr,'.AffQ4.X.*mm2pixel;'])
eval(['Y0_2 = EW.large.',fstr,'.AffQ4.Y;'])
eval(['X1_2 = EW.large.',fstr,'.AffQ8.X.*mm2pixel;'])
eval(['Y1_2 = EW.large.',fstr,'.AffQ8.Y;'])
eval(['X2_2 = EW.large.',fstr,'.QuadQ4.X.*mm2pixel;'])
eval(['Y2_2 = EW.large.',fstr,'.QuadQ4.Y;'])
eval(['X3_2 = EW.large.',fstr,'.QuadQ8.X.*mm2pixel;'])
eval(['Y3_2 = EW.large.',fstr,'.QuadQ8.Y;'])

eval(['X0_3 = LW.small.',fstr,'.AffQ4.X.*mm2pixel;'])
eval(['Y0_3 = LW.small.',fstr,'.AffQ4.Y;'])
eval(['X1_3 = LW.small.',fstr,'.AffQ8.X.*mm2pixel;'])
eval(['Y1_3 = LW.small.',fstr,'.AffQ8.Y;'])
eval(['X2_3 = LW.small.',fstr,'.QuadQ4.X.*mm2pixel;'])
eval(['Y2_3 = LW.small.',fstr,'.QuadQ4.Y;'])
eval(['X3_3 = LW.small.',fstr,'.QuadQ8.X.*mm2pixel;'])
eval(['Y3_3 = LW.small.',fstr,'.QuadQ8.Y;'])

eval(['X0_4 = LW.large.',fstr,'.AffQ4.X.*mm2pixel;'])
eval(['Y0_4 = LW.large.',fstr,'.AffQ4.Y;'])
eval(['X1_4 = LW.large.',fstr,'.AffQ8.X.*mm2pixel;'])
eval(['Y1_4 = LW.large.',fstr,'.AffQ8.Y;'])
eval(['X2_4 = LW.large.',fstr,'.QuadQ4.X.*mm2pixel;'])
eval(['Y2_4 = LW.large.',fstr,'.QuadQ4.Y;'])
eval(['X3_4 = LW.large.',fstr,'.QuadQ8.X.*mm2pixel;'])
eval(['Y3_4 = LW.large.',fstr,'.QuadQ8.Y;'])

fname = [caminho,filesep,'PA\PA_Sig_VSG_all'];

fig1  = figure('color',[1 1 1],'position',script.fig_pos);
axes('Position',[0.14 0.14 0.775 0.775],'FontSize',script.size_font1,...
    'FontName',script.nomeF,'YColor',[0 0 0],'parent',fig1);
hold on; grid on; box on;
plot(X0_1,Y0_1,'o','MarkerSize',8,...
    'MarkerEdgeColor',[0,0,0])
plot(X1_1,Y1_1,'s','MarkerSize',10,...
    'MarkerFaceColor',[0.941176474094391 0.941176474094391 0.941176474094391],...
    'MarkerEdgeColor',[0.5,0.5,0.5])
plot(X2_1,Y2_1,'.','MarkerSize',12,...
    'MarkerFaceColor',[0.678431391716003 0.921568632125854 1],...
    'MarkerEdgeColor',[0 0 0])
plot(X3_1,Y3_1,'MarkerSize',10,...
    'MarkerFaceColor',[0.42 0.86 0.92],'LineStyle','none',...
    'Marker','_','MarkerEdgeColor',[0,0,0])


plot(X0_2,Y0_2,'o','MarkerSize',8,...
    'MarkerEdgeColor',[1,0,0])
plot(X1_2,Y1_2,'s','MarkerSize',8,...
    'MarkerFaceColor',[0.941176474094391 0.941176474094391 0.941176474094391],...
    'MarkerEdgeColor',[1 0 0])
plot(X2_2,Y2_2,'.','MarkerSize',8,...
    'MarkerFaceColor',[1 0 0],...
    'MarkerEdgeColor',[1 0 0])
plot(X3_2,Y3_2,'MarkerSize',8,...
    'MarkerFaceColor',[1 0 0],'LineStyle','none',...
    'Marker','_','MarkerEdgeColor',[1,0,0])

plot(X0_3,Y0_3,'o','MarkerSize',8,...
    'MarkerEdgeColor',[0 0 1])
plot(X1_3,Y1_3,'s','MarkerSize',8,...
    'MarkerFaceColor',[0.941176474094391 0.941176474094391 0.941176474094391],...
    'MarkerEdgeColor',[0 0 1])
plot(X2_3,Y2_3,'.','MarkerSize',8,...
    'MarkerFaceColor',[0 0 1],...
    'MarkerEdgeColor',[0 0 1])
plot(X3_3,Y3_3,'MarkerSize',8,...
    'MarkerFaceColor',[0 0 1],'LineStyle','none',...
    'Marker','_','MarkerEdgeColor',[0 0 1])


plot(X0_4,Y0_4,'o','MarkerSize',8,...
    'MarkerEdgeColor',[0 1 0])
plot(X1_4,Y1_4,'s','MarkerSize',8,...
    'MarkerFaceColor',[0.941176474094391 0.941176474094391 0.941176474094391],...
    'MarkerEdgeColor',[0 1 0])
plot(X2_4,Y2_4,'.','MarkerSize',8,...
    'MarkerFaceColor',[0 1 0],...
    'MarkerEdgeColor',[0 1 0])
plot(X3_4,Y3_4,'MarkerSize',8,...
    'MarkerFaceColor',[0 1 0],'LineStyle','none',...
    'Marker','_','MarkerEdgeColor',[0 1 1])

%Marking Selected point
plot(X2_1(21),Y2_1(21),'.','MarkerSize',30,...
    'MarkerFaceColor',[0.9290 0.6940 0.1250],...
    'MarkerEdgeColor',[0.9290 0.6940 0.1250])
plot(X2_1(52),Y2_1(52),'.','MarkerSize',30,...
    'MarkerFaceColor',[1 0 0],...
    'MarkerEdgeColor',[1 0 0])
plot(X2_1(178),Y2_1(178),'.','MarkerSize',30,...
    'MarkerFaceColor',[0 0 1],...
    'MarkerEdgeColor',[0 0 1])

plot(X2_2(21),Y2_2(21),'.','MarkerSize',30,...
    'MarkerFaceColor',[0.9290 0.6940 0.1250],...
    'MarkerEdgeColor',[0.9290 0.6940 0.1250])
plot(X2_2(52),Y2_2(52),'.','MarkerSize',30,...
    'MarkerFaceColor',[1 0 0],...
    'MarkerEdgeColor',[1 0 0])
plot(X2_2(178),Y2_2(178),'.','MarkerSize',30,...
    'MarkerFaceColor',[0 0 1],...
    'MarkerEdgeColor',[0 0 1])

plot(X2_3(21),Y2_3(21),'.','MarkerSize',30,...
    'MarkerFaceColor',[0.9290 0.6940 0.1250],...
    'MarkerEdgeColor',[0.9290 0.6940 0.1250])
plot(X2_3(52),Y2_3(52),'.','MarkerSize',30,...
    'MarkerFaceColor',[1 0 0],...
    'MarkerEdgeColor',[1 0 0])
plot(X2_3(178),Y2_3(178),'.','MarkerSize',30,...
    'MarkerFaceColor',[0 0 1],...
    'MarkerEdgeColor',[0 0 1])

plot(X2_4(21),Y2_4(21),'.','MarkerSize',30,...
    'MarkerFaceColor',[0.9290 0.6940 0.1250],...
    'MarkerEdgeColor',[0.9290 0.6940 0.1250])
plot(X2_4(52),Y2_4(52),'.','MarkerSize',30,...
    'MarkerFaceColor',[1 0 0],...
    'MarkerEdgeColor',[1 0 0])
plot(X2_4(178),Y2_4(178),'.','MarkerSize',30,...
    'MarkerFaceColor',[0 0 1],...
    'MarkerEdgeColor',[0 0 1])


%Marking Selected point
% plot(X2(7),Y2(7),'.','MarkerSize',30,...
%     'MarkerFaceColor',[0.9290 0.6940 0.1250],...
%     'MarkerEdgeColor',[0.9290 0.6940 0.1250])
% lege = legend('Affine/Q4','Affine/Q8','Quadratic/Q4','Quadratic/Q8','Selected settings');

lege = legend('Affine/Q4','Affine/Q8','Quadratic/Q4','Quadratic/Q8');hold on
set(lege,'Position',[0.427 0.732 0.228 0.22]); 
% ylim([0 .5e-3])
% xlim([0 70]) % unit: mm
xlabel('VSG [mm]','FontName',script.nomeF,'FontSize',script.size_font2)
ylabel('Strain component : $\varepsilon_{\mathrm{R}}^{\mathrm{EW}}$',...
    'FontName',script.nomeF,'FontSize',script.size_font2,...
    'interpreter','latex')

l1 = plot(nan, nan, 'k');
l2 = plot(nan, nan, 'r');
l3 = plot(nan, nan, 'b');
l4 = plot(nan, nan, 'g');
legend([l1, l2, l3, l4], {'EW Small', 'EW Large', 'LW Small', 'LW Large'},...
    'Position',[0.68325 0.690 0.228 0.22]);

% -
ablabel = [0.03 0.88 0.032 0.12];
annotation(fig1,'textbox',ablabel,...
    'String',{'e'},'FontSize',28,'FontName',script.nomeF,...
    'FitBoxToText','off','EdgeColor',[1 1 1]);
% -
print(script.imgformat,script.resol,fname)


    case 'A60_10'        
% Plot 01 EW:Sig_VSG point 1 small

disp('Plot EW:Sig_VSG for point 1 (small)...')

fstr = 'Sig_VSG';
eval(['X0 = EW.small.',fstr,'.AffQ4.X.*mm2pixel;'])
eval(['Y0 = EW.small.',fstr,'.AffQ4.Y;'])
eval(['X1 = EW.small.',fstr,'.AffQ8.X.*mm2pixel;'])
eval(['Y1 = EW.small.',fstr,'.AffQ8.Y;'])
eval(['X2 = EW.small.',fstr,'.QuadQ4.X.*mm2pixel;'])
eval(['Y2 = EW.small.',fstr,'.QuadQ4.Y;'])
eval(['X3 = EW.small.',fstr,'.QuadQ8.X.*mm2pixel;'])
eval(['Y3 = EW.small.',fstr,'.QuadQ8.Y;'])
fname = [caminho,filesep,'PA\PA_EW_Sig_VSG_Point 1(small)'];

fig1  = figure('color',[1 1 1],'position',script.fig_pos);
axes('Position',[0.14 0.14 0.775 0.775],'FontSize',script.size_font1,...
    'FontName',script.nomeF,'YColor',[0 0 0],'parent',fig1);
hold on; grid on; box on;
plot(X0,Y0,'o','MarkerSize',8,...
    'MarkerEdgeColor',[0,0,0])
plot(X1,Y1,'s','MarkerSize',10,...
    'MarkerFaceColor',[0.941176474094391 0.941176474094391 0.941176474094391],...
    'MarkerEdgeColor',[0.5,0.5,0.5])
plot(X2,Y2,'.','MarkerSize',12,...
    'MarkerFaceColor',[0.678431391716003 0.921568632125854 1],...
    'MarkerEdgeColor',[0 0 0])
plot(X3,Y3,'MarkerSize',10,...
    'MarkerFaceColor',[0.42 0.86 0.92],'LineStyle','none',...
    'Marker','_','MarkerEdgeColor',[0,0,0])


%Marking Selected point
plot(X2(37),Y2(37),'.','MarkerSize',30,...
    'MarkerFaceColor',[0.9290 0.6940 0.1250],...
    'MarkerEdgeColor',[0.9290 0.6940 0.1250])
plot(X2(77),Y2(77),'.','MarkerSize',30,...
    'MarkerFaceColor',[1 0 0],...
    'MarkerEdgeColor',[1 0 0])
plot(X2(178),Y2(178),'.','MarkerSize',30,...
    'MarkerFaceColor',[0 0 1],...
    'MarkerEdgeColor',[0 0 1])
lege = legend('Affine/Q4','Affine/Q8','Quadratic/Q4','Quadratic/Q8',...
    'Selected settings P1','Selected settings P2','Selected settings P3');

% lege = legend('Affine/Q4','Affine/Q8','Quadratic/Q4','Quadratic/Q8');
set(lege,'Position',[0.72 0.16 0.12 0.22])
% ylim([0 .5e-3])
% xlim([0 70]) % unit: mm
xlabel('VSG [mm]','FontName',script.nomeF,'FontSize',script.size_font2)
ylabel('Strain component : $\varepsilon_{\mathrm{R}}^{\mathrm{EW}}$',...
    'FontName',script.nomeF,'FontSize',script.size_font2,...
    'interpreter','latex')
ai = axes('Position',[0.6675 0.395 0.225 0.175],'FontSize',script.size_font1,...
    'FontName',script.nomeF,'YColor',[0 0 0],'parent',fig1);
% rect = [1,190,1580,1000];
imagesc(irings(rect(2):rect(4),rect(1):rect(3))); colormap('gray'); hold on
plot(Point1_EW(1)-rect(1),Point1_EW(2)-rect(2)+ytrans,'ro','MarkerFaceColor',[1 0 0],'Marker','o','LineStyle','none', 'Color',[1 0 0]); hold off
axis off

% -
ablabel = [0.03 0.88 0.032 0.12];
annotation(fig1,'textbox',ablabel,...
    'String',{'a'},'FontSize',28,'FontName',script.nomeF,...
    'FitBoxToText','off','EdgeColor',[1 1 1]);
% -
print(script.imgformat,script.resol,fname)

%% Plot 02 EW:Sig_VSG point 2 large


disp('Plot EW:Sig_VSG for point 2 (large)...')

fstr = 'Sig_VSG';
eval(['X0 = EW.large.',fstr,'.AffQ4.X.*mm2pixel;'])
eval(['Y0 = EW.large.',fstr,'.AffQ4.Y;'])
eval(['X1 = EW.large.',fstr,'.AffQ8.X.*mm2pixel;'])
eval(['Y1 = EW.large.',fstr,'.AffQ8.Y;'])
eval(['X2 = EW.large.',fstr,'.QuadQ4.X.*mm2pixel;'])
eval(['Y2 = EW.large.',fstr,'.QuadQ4.Y;'])
eval(['X3 = EW.large.',fstr,'.QuadQ8.X.*mm2pixel;'])
eval(['Y3 = EW.large.',fstr,'.QuadQ8.Y;'])
fname = [caminho,filesep,'PA\PA_EW_Sig_VSG_Point 2(large)'];

fig1  = figure('color',[1 1 1],'position',script.fig_pos);
axes('Position',[0.14 0.14 0.775 0.775],'FontSize',script.size_font1,...
    'FontName',script.nomeF,'YColor',[0 0 0],'parent',fig1);
hold on; grid on; box on;
plot(X0,Y0,'o','MarkerSize',8,...
    'MarkerEdgeColor',[0,0,0])
plot(X1,Y1,'s','MarkerSize',10,...
    'MarkerFaceColor',[0.941176474094391 0.941176474094391 0.941176474094391],...
    'MarkerEdgeColor',[0.5,0.5,0.5])
plot(X2,Y2,'.','MarkerSize',12,...
    'MarkerFaceColor',[0.678431391716003 0.921568632125854 1],...
    'MarkerEdgeColor',[0 0 0])
plot(X3,Y3,'MarkerSize',10,...
    'MarkerFaceColor',[0.42 0.86 0.92],'LineStyle','none',...
    'Marker','_','MarkerEdgeColor',[0,0,0])


%Marking Selected point
plot(X2(37),Y2(37),'.','MarkerSize',30,...
    'MarkerFaceColor',[0.9290 0.6940 0.1250],...
    'MarkerEdgeColor',[0.9290 0.6940 0.1250])
plot(X2(77),Y2(77),'.','MarkerSize',30,...
    'MarkerFaceColor',[1 0 0],...
    'MarkerEdgeColor',[1 0 0])
plot(X2(178),Y2(178),'.','MarkerSize',30,...
    'MarkerFaceColor',[0 0 1],...
    'MarkerEdgeColor',[0 0 1])
lege = legend('Affine/Q4','Affine/Q8','Quadratic/Q4','Quadratic/Q8',...
    'Selected settings P1','Selected settings P2','Selected settings P3');

% lege = legend('Affine/Q4','Affine/Q8','Quadratic/Q4','Quadratic/Q8');
set(lege,'Position',[0.666 0.493 0.228 0.22])
% ylim([0 .5e-3])
% xlim([0 70]) % unit: mm
xlabel('VSG [mm]','FontName',script.nomeF,'FontSize',script.size_font2)
ylabel('Strain component : $\varepsilon_{\mathrm{R}}^{\mathrm{EW}}$',...
    'FontName',script.nomeF,'FontSize',script.size_font2,...
    'interpreter','latex')
ai = axes('Position',[0.6675 0.72 0.225 0.175],'FontSize',script.size_font1,...
    'FontName',script.nomeF,'YColor',[0 0 0],'parent',fig1);

imagesc(irings(rect(2):rect(4),rect(1):rect(3))); colormap('gray'); hold on
plot(Point2_EW(1)-rect(1),Point2_EW(2)-rect(2)+ytrans,'ro','MarkerFaceColor',[1 0 0],'Marker','o','LineStyle','none', 'Color',[1 0 0]); hold off
axis off

% -
ablabel = [0.03 0.88 0.032 0.12];
annotation(fig1,'textbox',ablabel,...
    'String',{'b'},'FontSize',28,'FontName',script.nomeF,...
    'FitBoxToText','off','EdgeColor',[1 1 1]);
% -
print(script.imgformat,script.resol,fname)

%% Plot 03 LW:Sig_VSG point 1 small

disp('Plot LW:Sig_VSG for point 1 (small)...')

fstr = 'Sig_VSG';
eval(['X0 = LW.small.',fstr,'.AffQ4.X.*mm2pixel;'])
eval(['Y0 = LW.small.',fstr,'.AffQ4.Y;'])
eval(['X1 = LW.small.',fstr,'.AffQ8.X.*mm2pixel;'])
eval(['Y1 = LW.small.',fstr,'.AffQ8.Y;'])
eval(['X2 = LW.small.',fstr,'.QuadQ4.X.*mm2pixel;'])
eval(['Y2 = LW.small.',fstr,'.QuadQ4.Y;'])
eval(['X3 = LW.small.',fstr,'.QuadQ8.X.*mm2pixel;'])
eval(['Y3 = LW.small.',fstr,'.QuadQ8.Y;'])
fname = [caminho,filesep,'PA\PA_LW_Sig_VSG_Point 1(small)'];

fig1  = figure('color',[1 1 1],'position',script.fig_pos);
axes('Position',[0.14 0.14 0.775 0.775],'FontSize',script.size_font1,...
    'FontName',script.nomeF,'YColor',[0 0 0],'parent',fig1);
hold on; grid on; box on;
plot(X0,Y0,'o','MarkerSize',8,...
    'MarkerEdgeColor',[0,0,0])
plot(X1,Y1,'s','MarkerSize',10,...
    'MarkerFaceColor',[0.941176474094391 0.941176474094391 0.941176474094391],...
    'MarkerEdgeColor',[0.5,0.5,0.5])
plot(X2,Y2,'.','MarkerSize',12,...
    'MarkerFaceColor',[0.678431391716003 0.921568632125854 1],...
    'MarkerEdgeColor',[0 0 0])
plot(X3,Y3,'MarkerSize',10,...
    'MarkerFaceColor',[0.42 0.86 0.92],'LineStyle','none',...
    'Marker','_','MarkerEdgeColor',[0,0,0])


%Marking Selected point
plot(X2(37),Y2(37),'.','MarkerSize',30,...
    'MarkerFaceColor',[0.9290 0.6940 0.1250],...
    'MarkerEdgeColor',[0.9290 0.6940 0.1250])
plot(X2(77),Y2(77),'.','MarkerSize',30,...
    'MarkerFaceColor',[1 0 0],...
    'MarkerEdgeColor',[1 0 0])
plot(X2(178),Y2(178),'.','MarkerSize',30,...
    'MarkerFaceColor',[0 0 1],...
    'MarkerEdgeColor',[0 0 1])
lege = legend('Affine/Q4','Affine/Q8','Quadratic/Q4','Quadratic/Q8',...
    'Selected settings P1','Selected settings P2','Selected settings P3');


% lege = legend('Affine/Q4','Affine/Q8','Quadratic/Q4','Quadratic/Q8');
set(lege,'Position',[0.311 0.164 0.12 0.22])
% ylim([0 .5e-3])
% xlim([0 70]) % unit: mm
xlabel('VSG [mm]','FontName',script.nomeF,'FontSize',script.size_font2)
ylabel('Strain component : $\varepsilon_{\mathrm{R}}^{\mathrm{EW}}$',...
    'FontName',script.nomeF,'FontSize',script.size_font2,...
    'interpreter','latex')
ai = axes('Position',[0.6675 0.72 0.225 0.175],'FontSize',script.size_font1,...
    'FontName',script.nomeF,'YColor',[0 0 0],'parent',fig1);

imagesc(irings(rect(2):rect(4),rect(1):rect(3))); colormap('gray'); hold on
plot(Point1_LW(1)-rect(1),Point1_LW(2)-rect(2)+ytrans,'ro','MarkerFaceColor',[1 0 0],'Marker','o','LineStyle','none', 'Color',[1 0 0]); hold off
axis off
% -
ablabel = [0.03 0.88 0.032 0.12];
annotation(fig1,'textbox',ablabel,...
    'String',{'c'},'FontSize',28,'FontName',script.nomeF,...
    'FitBoxToText','off','EdgeColor',[1 1 1]);
% -
print(script.imgformat,script.resol,fname)

%% Plot 04 LW:Sig_VSG point 2 large
disp('Plot LW:Sig_VSG for point 2 (large)...')

fstr = 'Sig_VSG';
eval(['X0 = LW.large.',fstr,'.AffQ4.X.*mm2pixel;'])
eval(['Y0 = LW.large.',fstr,'.AffQ4.Y;'])
eval(['X1 = LW.large.',fstr,'.AffQ8.X.*mm2pixel;'])
eval(['Y1 = LW.large.',fstr,'.AffQ8.Y;'])
eval(['X2 = LW.large.',fstr,'.QuadQ4.X.*mm2pixel;'])
eval(['Y2 = LW.large.',fstr,'.QuadQ4.Y;'])
eval(['X3 = LW.large.',fstr,'.QuadQ8.X.*mm2pixel;'])
eval(['Y3 = LW.large.',fstr,'.QuadQ8.Y;'])
fname = [caminho,filesep,'PA\PA_LW_Sig_VSG_Point 2(large)'];

fig1  = figure('color',[1 1 1],'position',script.fig_pos);
axes('Position',[0.14 0.14 0.775 0.775],'FontSize',script.size_font1,...
    'FontName',script.nomeF,'YColor',[0 0 0],'parent',fig1);
hold on; grid on; box on;
plot(X0,Y0,'o','MarkerSize',8,...
    'MarkerEdgeColor',[0,0,0])
plot(X1,Y1,'s','MarkerSize',10,...
    'MarkerFaceColor',[0.941176474094391 0.941176474094391 0.941176474094391],...
    'MarkerEdgeColor',[0.5,0.5,0.5])
plot(X2,Y2,'.','MarkerSize',12,...
    'MarkerFaceColor',[0.678431391716003 0.921568632125854 1],...
    'MarkerEdgeColor',[0 0 0])
plot(X3,Y3,'MarkerSize',10,...
    'MarkerFaceColor',[0.42 0.86 0.92],'LineStyle','none',...
    'Marker','_','MarkerEdgeColor',[0,0,0])


%Marking Selected point
plot(X2(37),Y2(37),'.','MarkerSize',30,...
    'MarkerFaceColor',[0.9290 0.6940 0.1250],...
    'MarkerEdgeColor',[0.9290 0.6940 0.1250])
plot(X2(77),Y2(77),'.','MarkerSize',30,...
    'MarkerFaceColor',[1 0 0],...
    'MarkerEdgeColor',[1 0 0])
plot(X2(178),Y2(178),'.','MarkerSize',30,...
    'MarkerFaceColor',[0 0 1],...
    'MarkerEdgeColor',[0 0 1])
lege = legend('Affine/Q4','Affine/Q8','Quadratic/Q4','Quadratic/Q8',...
    'Selected settings P1','Selected settings P2','Selected settings P3');

% lege = legend('Affine/Q4','Affine/Q8','Quadratic/Q4','Quadratic/Q8');
set(lege,'Position',[0.667 0.495 0.228 0.22])
% ylim([0 .5e-3])
% xlim([0 70]) % unit: mm
xlabel('VSG [mm]','FontName',script.nomeF,'FontSize',script.size_font2)
ylabel('Strain component : $\varepsilon_{\mathrm{R}}^{\mathrm{EW}}$',...
    'FontName',script.nomeF,'FontSize',script.size_font2,...
    'interpreter','latex')
ai = axes('Position',[0.6675 0.72 0.225 0.175],'FontSize',script.size_font1,...
    'FontName',script.nomeF,'YColor',[0 0 0],'parent',fig1);

imagesc(irings(rect(2):rect(4),rect(1):rect(3))); colormap('gray'); hold on
plot(Point2_LW(1)-rect(1),Point2_LW(2)-rect(2)+ytrans,'ro','MarkerFaceColor',[1 0 0],'Marker','o','LineStyle','none', 'Color',[1 0 0]); hold off
axis off
% -
ablabel = [0.03 0.88 0.032 0.12];
annotation(fig1,'textbox',ablabel,...
    'String',{'d'},'FontSize',28,'FontName',script.nomeF,...
    'FitBoxToText','off','EdgeColor',[1 1 1]);
% -
print(script.imgformat,script.resol,fname)

%% Plot 05 ALL:Sig_VSG point 
disp('Plot LW:Sig_VSG for all points...')

fstr = 'Sig_VSG';

eval(['X0_1 = EW.small.',fstr,'.AffQ4.X.*mm2pixel;'])
eval(['Y0_1 = EW.small.',fstr,'.AffQ4.Y;'])
eval(['X1_1 = EW.small.',fstr,'.AffQ8.X.*mm2pixel;'])
eval(['Y1_1 = EW.small.',fstr,'.AffQ8.Y;'])
eval(['X2_1 = EW.small.',fstr,'.QuadQ4.X.*mm2pixel;'])
eval(['Y2_1 = EW.small.',fstr,'.QuadQ4.Y;'])
eval(['X3_1 = EW.small.',fstr,'.QuadQ8.X.*mm2pixel;'])
eval(['Y3_1 = EW.small.',fstr,'.QuadQ8.Y;'])

eval(['X0_2 = EW.large.',fstr,'.AffQ4.X.*mm2pixel;'])
eval(['Y0_2 = EW.large.',fstr,'.AffQ4.Y;'])
eval(['X1_2 = EW.large.',fstr,'.AffQ8.X.*mm2pixel;'])
eval(['Y1_2 = EW.large.',fstr,'.AffQ8.Y;'])
eval(['X2_2 = EW.large.',fstr,'.QuadQ4.X.*mm2pixel;'])
eval(['Y2_2 = EW.large.',fstr,'.QuadQ4.Y;'])
eval(['X3_2 = EW.large.',fstr,'.QuadQ8.X.*mm2pixel;'])
eval(['Y3_2 = EW.large.',fstr,'.QuadQ8.Y;'])

eval(['X0_3 = LW.small.',fstr,'.AffQ4.X.*mm2pixel;'])
eval(['Y0_3 = LW.small.',fstr,'.AffQ4.Y;'])
eval(['X1_3 = LW.small.',fstr,'.AffQ8.X.*mm2pixel;'])
eval(['Y1_3 = LW.small.',fstr,'.AffQ8.Y;'])
eval(['X2_3 = LW.small.',fstr,'.QuadQ4.X.*mm2pixel;'])
eval(['Y2_3 = LW.small.',fstr,'.QuadQ4.Y;'])
eval(['X3_3 = LW.small.',fstr,'.QuadQ8.X.*mm2pixel;'])
eval(['Y3_3 = LW.small.',fstr,'.QuadQ8.Y;'])

eval(['X0_4 = LW.large.',fstr,'.AffQ4.X.*mm2pixel;'])
eval(['Y0_4 = LW.large.',fstr,'.AffQ4.Y;'])
eval(['X1_4 = LW.large.',fstr,'.AffQ8.X.*mm2pixel;'])
eval(['Y1_4 = LW.large.',fstr,'.AffQ8.Y;'])
eval(['X2_4 = LW.large.',fstr,'.QuadQ4.X.*mm2pixel;'])
eval(['Y2_4 = LW.large.',fstr,'.QuadQ4.Y;'])
eval(['X3_4 = LW.large.',fstr,'.QuadQ8.X.*mm2pixel;'])
eval(['Y3_4 = LW.large.',fstr,'.QuadQ8.Y;'])

fname = [caminho,filesep,'PA\PA_Sig_VSG_all'];

fig1  = figure('color',[1 1 1],'position',script.fig_pos);
axes('Position',[0.14 0.14 0.775 0.775],'FontSize',script.size_font1,...
    'FontName',script.nomeF,'YColor',[0 0 0],'parent',fig1);
hold on; grid on; box on;
plot(X0_1,Y0_1,'o','MarkerSize',8,...
    'MarkerEdgeColor',[0,0,0])
plot(X1_1,Y1_1,'s','MarkerSize',10,...
    'MarkerFaceColor',[0.941176474094391 0.941176474094391 0.941176474094391],...
    'MarkerEdgeColor',[0.5,0.5,0.5])
plot(X2_1,Y2_1,'.','MarkerSize',12,...
    'MarkerFaceColor',[0.678431391716003 0.921568632125854 1],...
    'MarkerEdgeColor',[0 0 0])
plot(X3_1,Y3_1,'MarkerSize',10,...
    'MarkerFaceColor',[0.42 0.86 0.92],'LineStyle','none',...
    'Marker','_','MarkerEdgeColor',[0,0,0])


plot(X0_2,Y0_2,'o','MarkerSize',8,...
    'MarkerEdgeColor',[1,0,0])
plot(X1_2,Y1_2,'s','MarkerSize',8,...
    'MarkerFaceColor',[0.941176474094391 0.941176474094391 0.941176474094391],...
    'MarkerEdgeColor',[1 0 0])
plot(X2_2,Y2_2,'.','MarkerSize',8,...
    'MarkerFaceColor',[1 0 0],...
    'MarkerEdgeColor',[1 0 0])
plot(X3_2,Y3_2,'MarkerSize',8,...
    'MarkerFaceColor',[1 0 0],'LineStyle','none',...
    'Marker','_','MarkerEdgeColor',[1,0,0])

plot(X0_3,Y0_3,'o','MarkerSize',8,...
    'MarkerEdgeColor',[0 0 1])
plot(X1_3,Y1_3,'s','MarkerSize',8,...
    'MarkerFaceColor',[0.941176474094391 0.941176474094391 0.941176474094391],...
    'MarkerEdgeColor',[0 0 1])
plot(X2_3,Y2_3,'.','MarkerSize',8,...
    'MarkerFaceColor',[0 0 1],...
    'MarkerEdgeColor',[0 0 1])
plot(X3_3,Y3_3,'MarkerSize',8,...
    'MarkerFaceColor',[0 0 1],'LineStyle','none',...
    'Marker','_','MarkerEdgeColor',[0 0 1])


plot(X0_4,Y0_4,'o','MarkerSize',8,...
    'MarkerEdgeColor',[0 1 0])
plot(X1_4,Y1_4,'s','MarkerSize',8,...
    'MarkerFaceColor',[0.941176474094391 0.941176474094391 0.941176474094391],...
    'MarkerEdgeColor',[0 1 0])
plot(X2_4,Y2_4,'.','MarkerSize',8,...
    'MarkerFaceColor',[0 1 0],...
    'MarkerEdgeColor',[0 1 0])
plot(X3_4,Y3_4,'MarkerSize',8,...
    'MarkerFaceColor',[0 1 0],'LineStyle','none',...
    'Marker','_','MarkerEdgeColor',[0 1 1])

%Marking Selected point
plot(X2_1(37),Y2_1(37),'.','MarkerSize',30,...
    'MarkerFaceColor',[0.9290 0.6940 0.1250],...
    'MarkerEdgeColor',[0.9290 0.6940 0.1250])
plot(X2_1(77),Y2_1(77),'.','MarkerSize',30,...
    'MarkerFaceColor',[1 0 0],...
    'MarkerEdgeColor',[1 0 0])
plot(X2_1(178),Y2_1(178),'.','MarkerSize',30,...
    'MarkerFaceColor',[0 0 1],...
    'MarkerEdgeColor',[0 0 1])

plot(X2_2(37),Y2_2(37),'.','MarkerSize',30,...
    'MarkerFaceColor',[0.9290 0.6940 0.1250],...
    'MarkerEdgeColor',[0.9290 0.6940 0.1250])
plot(X2_2(77),Y2_2(77),'.','MarkerSize',30,...
    'MarkerFaceColor',[1 0 0],...
    'MarkerEdgeColor',[1 0 0])
plot(X2_2(178),Y2_2(178),'.','MarkerSize',30,...
    'MarkerFaceColor',[0 0 1],...
    'MarkerEdgeColor',[0 0 1])

plot(X2_3(37),Y2_3(37),'.','MarkerSize',30,...
    'MarkerFaceColor',[0.9290 0.6940 0.1250],...
    'MarkerEdgeColor',[0.9290 0.6940 0.1250])
plot(X2_3(77),Y2_3(77),'.','MarkerSize',30,...
    'MarkerFaceColor',[1 0 0],...
    'MarkerEdgeColor',[1 0 0])
plot(X2_3(178),Y2_3(178),'.','MarkerSize',30,...
    'MarkerFaceColor',[0 0 1],...
    'MarkerEdgeColor',[0 0 1])

plot(X2_4(37),Y2_4(37),'.','MarkerSize',30,...
    'MarkerFaceColor',[0.9290 0.6940 0.1250],...
    'MarkerEdgeColor',[0.9290 0.6940 0.1250])
plot(X2_4(77),Y2_4(77),'.','MarkerSize',30,...
    'MarkerFaceColor',[1 0 0],...
    'MarkerEdgeColor',[1 0 0])
plot(X2_4(178),Y2_4(178),'.','MarkerSize',30,...
    'MarkerFaceColor',[0 0 1],...
    'MarkerEdgeColor',[0 0 1])


%Marking Selected point
% plot(X2(7),Y2(7),'.','MarkerSize',30,...
%     'MarkerFaceColor',[0.9290 0.6940 0.1250],...
%     'MarkerEdgeColor',[0.9290 0.6940 0.1250])
% lege = legend('Affine/Q4','Affine/Q8','Quadratic/Q4','Quadratic/Q8','Selected settings');

lege = legend('Affine/Q4','Affine/Q8','Quadratic/Q4','Quadratic/Q8');hold on
set(lege,'Position',[0.427 0.732 0.228 0.22]); 
% ylim([0 .5e-3])
% xlim([0 70]) % unit: mm
xlabel('VSG [mm]','FontName',script.nomeF,'FontSize',script.size_font2)
ylabel('Strain component : $\varepsilon_{\mathrm{R}}^{\mathrm{EW}}$',...
    'FontName',script.nomeF,'FontSize',script.size_font2,...
    'interpreter','latex')

l1 = plot(nan, nan, 'k');
l2 = plot(nan, nan, 'r');
l3 = plot(nan, nan, 'b');
l4 = plot(nan, nan, 'g');
legend([l1, l2, l3, l4], {'EW Small', 'EW Large', 'LW Small', 'LW Large'},...
    'Position',[0.68325 0.690 0.228 0.22]);

% -
ablabel = [0.03 0.88 0.032 0.12];
annotation(fig1,'textbox',ablabel,...
    'String',{'e'},'FontSize',28,'FontName',script.nomeF,...
    'FitBoxToText','off','EdgeColor',[1 1 1]);
% -
print(script.imgformat,script.resol,fname)
       
end