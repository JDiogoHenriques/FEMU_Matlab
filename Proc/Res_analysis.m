%% input 

clc, clear all, close all,

caminho = 'C:\Users\joaod\OneDrive\Ambiente de Trabalho\Doutoramento\Artigo Cientifico\Codigo Matlab\ANSYS\Compression\Results Analysis\';
materialTipo = 'homog';

script.size_font1 = 13;
script.size_font2 = 13;
script.nomeF      = 'Times New Roman';
script.imgformat  = '-dpng';
script.filetype   = '.png';
script.resol      = '-r600';
script.ext        = '.dat';
script.xls        = '.xls';
script.mat        = '.mat';
% -
% Change default axes fonts.
set(0,'DefaultAxesFontName', script.nomeF)
set(0,'DefaultAxesFontSize', script.size_font2)

% Change default text fonts.
set(0,'DefaultTextFontname', script.nomeF)
set(0,'DefaultTextFontSize', script.size_font2)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% load results

%%%%% A00_01 %%%%%

% BC Raw

nomeFic1 = [caminho,'A00_01\s104\BC Raw\WF=10^-3\','A00_01_MatFEMU_OF1.dat'];

res_A00_01_s104_R=importdata(nomeFic1);    % A00_01 s104 BC raw  

%%%%% A00_02 %%%%%

% BC Raw

nomeFic1 = [caminho,'A00_02\s43\BC Raw\WF=10^-3\','A00_02_MatFEMU_OF1.dat'];

res_A00_02_s43_R=importdata(nomeFic1);      % A00_02 s43 BC raw

%%%%% A00_03 %%%%%

% BC Raw

nomeFic1 = [caminho,'A00_03\s16\BC Raw\WF=10^-3\','A00_03_MatFEMU_OF1.dat'];
       
res_A00_03_s16_R_Cell = struct2cell(importdata(nomeFic1));   % A00_03 s16 BC raw
res_A00_03_s16_R=cell2mat(res_A00_03_s16_R_Cell(1));

%%%%% A00_04 %%%%%

% BC Raw

nomeFic1 = [caminho,'A00_04\s44\BC Raw\WF=10^-3\','A00_04_MatFEMU_OF1.dat'];
 
res_A00_04_s44_R=importdata(nomeFic1);      % A00_04 s44 BC raw

%%%%% A00_05 %%%%%

%---------------%

%%%%% A00_06 %%%%%

% BC Raw

nomeFic1 = [caminho,'A00_06\s33\BC Raw\WF=10^-3\','A00_06_MatFEMU_OF1.dat'];

res_A00_06_s33_R=importdata(nomeFic1);      % A00_06 s33 BC raw

%%%%% A00_07 %%%%%

% BC Raw

nomeFic1 = [caminho,'A00_07\s15\BC Raw\WF=10^-3\','A00_07_MatFEMU_OF1.dat'];

res_A00_07_s15_R_Cell = struct2cell(importdata(nomeFic1));   % A00_07 s15 BC raw
res_A00_07_s15_R=cell2mat(res_A00_07_s15_R_Cell(1));       

%%%%% A00_08 %%%%%

%---------------%

%%%%% A00_09 %%%%%

%---------------%   

%%%%% A00_10 %%%%%

% BC Raw

nomeFic1 = [caminho,'A00_10\s27\BC Raw\WF=10^-3\','A00_10_MatFEMU_OF1.dat'];
      
res_A00_10_s27_R_Cell = struct2cell(importdata(nomeFic1));   % A00_10 s27 BC raw
res_A00_10_s27_R=cell2mat(res_A00_10_s27_R_Cell(1));

%% Material parameters - initialise reference values

initialPropertiesEWLW

% Earlywood
Q11_EWref = mater.E2_EW/(1-mater.CP23_EW*mater.CP32_EW);
Q12_EWref = mater.E2_EW*mater.CP32_EW/(1-mater.CP23_EW*mater.CP32_EW);
Q22_EWref = mater.E3_EW/(1-mater.CP23_EW*mater.CP32_EW);
Q66_EWref = mater.G23_EW;

% LateWood
Q11_LWref = mater.E2_LW/(1-mater.CP23_LW*mater.CP32_LW);
Q12_LWref = mater.E2_LW*mater.CP32_LW/(1-mater.CP23_LW*mater.CP32_LW);
Q22_LWref = mater.E3_LW/(1-mater.CP23_LW*mater.CP32_LW);
Q66_LWref = mater.G23_LW;


%% ---------------------------A00_01---------------------------------------------

% Fig1a E_R A00_01
close all
fig_roi = figure('Color',[1 1 1]);
axes('Position',[.13 .12 .80 .80],'FontName',script.nomeF,'FontSize',script.size_font1-2,'Parent',fig_roi);
% Reference Parameters
plot(mater.E2_EW*ones(length(res_A00_01_s104_R),1),'k','Marker','none','LineStyle','--','LineWidth',3);
hold on; box on;

% A00_01 s104 BC R
plot(res_A00_01_s104_R(1:end,1),'k','Marker','none','LineStyle','-','LineWidth',1); 

title('E_R Identification for homogeneous model: specimen 01') 
legend({'Reference Value','Identified Value'},...
    'FontName',script.nomeF,'FontSize',10,'EdgeColor',[1 1 1],...
    'Position',[0.67381 0.42943 0.25107 0.2833]);    
xlabel('Iterations','FontName',script.nomeF,'FontSize',script.size_font1)
ylabel('E_R, MPa','FontName',script.nomeF,'FontSize',script.size_font1)
xlim([0 length(res_A00_01_s104_R)])
% set(gca,'xtick',[0.52 0.54 0.56 0.58])
ylim([0.001 4000])
% annotation(fig_roi,'textbox',...
%     [0.001 0.92 0.057 0.078],...
%     'String',{'a)'},...
%     'FontWeight','bold',...
%     'FontSize',script.size_font2,...
%     'EdgeColor',[1 1 1]);
% save
fnome = [caminho,'Figures',filesep,'Fig1a'];
print(script.imgformat,script.resol,fnome)

%% Fig1b E_T A00_01

fig_roi = figure('Color',[1 1 1]);
axes('Position',[.13 .12 .80 .80],'FontName',script.nomeF,'FontSize',script.size_font1-2,'Parent',fig_roi);
% Reference Parameters
plot(mater.E3_EW*ones(length(res_A00_01_s104_R),1),'k','Marker','none','LineStyle','--','LineWidth',3);
hold on; box on;

% A00_01 s104 BC R
plot(res_A00_01_s104_R(1:end,2),'k','Marker','none','LineStyle','-','LineWidth',1); 

title('E_T Identification for homogeneous model: specimen 01') 
legend({'Reference Value','Identified Value'},...
    'FontName',script.nomeF,'FontSize',10,'EdgeColor',[1 1 1],...
    'Position',[0.67381 0.42943 0.25107 0.2833]);    
xlabel('Iterations','FontName',script.nomeF,'FontSize',script.size_font1)
ylabel('E_T, MPa','FontName',script.nomeF,'FontSize',script.size_font1)
xlim([0 length(res_A00_01_s104_R)])
% set(gca,'xtick',[0.52 0.54 0.56 0.58])
ylim([0.001 2000])
% annotation(fig_roi,'textbox',...
%     [0.001 0.92 0.057 0.078],...
%     'String',{'a)'},...
%     'FontWeight','bold',...
%     'FontSize',script.size_font2,...
%     'EdgeColor',[1 1 1]);
% save
fnome = [caminho,'Figures',filesep,'Fig1b'];
print(script.imgformat,script.resol,fnome)


%% Fig1c CP_RT A00_01

fig_roi = figure('Color',[1 1 1]);
axes('Position',[.13 .12 .80 .80],'FontName',script.nomeF,'FontSize',script.size_font1-2,'Parent',fig_roi);
% Reference Parameters
plot(mater.CP23_EW*ones(length(res_A00_01_s104_R),1),'k','Marker','none','LineStyle','--','LineWidth',3);
hold on; box on;

% A00_01 s104 BC R
plot(res_A00_01_s104_R(1:end,3),'k','Marker','none','LineStyle','-','LineWidth',1); 

title('\nu_{RT} Identification for homogeneous model: specimen 01') 
legend({'Reference Value','Identified Value'},...
    'FontName',script.nomeF,'FontSize',10,'EdgeColor',[1 1 1],...
    'Position',[0.67381 0.42943 0.25107 0.2833]);    
xlabel('Iterations','FontName',script.nomeF,'FontSize',script.size_font1)
ylabel('\nu_{RT}, MPa','FontName',script.nomeF,'FontSize',script.size_font1)
xlim([0 length(res_A00_01_s104_R)])
% set(gca,'xtick',[0.52 0.54 0.56 0.58])
ylim([0.001 1.1])
% annotation(fig_roi,'textbox',...
%     [0.001 0.92 0.057 0.078],...
%     'String',{'a)'},...
%     'FontWeight','bold',...
%     'FontSize',script.size_font2,...
%     'EdgeColor',[1 1 1]);
% save
fnome = [caminho,'Figures',filesep,'Fig1c'];
print(script.imgformat,script.resol,fnome)


%% Fig1d G_RT A00_01

fig_roi = figure('Color',[1 1 1]);
axes('Position',[.13 .12 .80 .80],'FontName',script.nomeF,'FontSize',script.size_font1-2,'Parent',fig_roi);
% Reference Parameters
plot(mater.G23_EW*ones(length(res_A00_01_s104_R),1),'k','Marker','none','LineStyle','--','LineWidth',3);
hold on; box on;

% A00_01 s104 BC R
plot(res_A00_01_s104_R(1:end,4),'k','Marker','none','LineStyle','-','LineWidth',1); 

title('G_{RT} Identification for homogeneous model: specimen 01') 
legend({'Reference Value','Identified Value'},...
    'FontName',script.nomeF,'FontSize',10,'EdgeColor',[1 1 1],...
    'Position',[0.67381 0.42943 0.25107 0.2833]);    
xlabel('Iterations','FontName',script.nomeF,'FontSize',script.size_font1)
ylabel('G_{RT}, MPa','FontName',script.nomeF,'FontSize',script.size_font1)
xlim([0 length(res_A00_01_s104_R)])
% set(gca,'xtick',[0.52 0.54 0.56 0.58])
ylim([0.001 700])
% annotation(fig_roi,'textbox',...
%     [0.001 0.92 0.057 0.078],...
%     'String',{'a)'},...
%     'FontWeight','bold',...
%     'FontSize',script.size_font2,...
%     'EdgeColor',[1 1 1]);
% save
fnome = [caminho,'Figures',filesep,'Fig1d'];
print(script.imgformat,script.resol,fnome)


%% ---------------------------A00_02---------------------------------------------

% Fig2a E_R A00_02
fig_roi = figure('Color',[1 1 1]);
axes('Position',[.13 .12 .80 .80],'FontName',script.nomeF,'FontSize',script.size_font1-2,'Parent',fig_roi);
% Reference Parameters
plot(mater.E2_EW*ones(length(res_A00_02_s43_R),1),'k','Marker','none','LineStyle','--','LineWidth',3);
hold on; box on;

% A00_02 s43 BC R
plot(res_A00_02_s43_R(1:end,1),'k','Marker','none','LineStyle','-','LineWidth',1); 

title('E_R Identification for homogeneous model: specimen 02') 
legend({'Reference Value','Identified Value'},...
    'FontName',script.nomeF,'FontSize',10,'EdgeColor',[1 1 1],...
    'Position',[0.67381 0.42943 0.25107 0.2833]);    
xlabel('Iterations','FontName',script.nomeF,'FontSize',script.size_font1)
ylabel('E_R, MPa','FontName',script.nomeF,'FontSize',script.size_font1)
xlim([0 length(res_A00_02_s43_R)])
% set(gca,'xtick',[0.52 0.54 0.56 0.58])
ylim([0.001 4000])
% annotation(fig_roi,'textbox',...
%     [0.001 0.92 0.057 0.078],...
%     'String',{'a)'},...
%     'FontWeight','bold',...
%     'FontSize',script.size_font2,...
%     'EdgeColor',[1 1 1]);
% save
fnome = [caminho,'Figures',filesep,'Fig2a'];
print(script.imgformat,script.resol,fnome)

%% Fig2b E_T A00_02

fig_roi = figure('Color',[1 1 1]);
axes('Position',[.13 .12 .80 .80],'FontName',script.nomeF,'FontSize',script.size_font1-2,'Parent',fig_roi);
% Reference Parameters
plot(mater.E3_EW*ones(length(res_A00_02_s43_R),1),'k','Marker','none','LineStyle','--','LineWidth',3);
hold on; box on;

% A00_01 s104 BC R
plot(res_A00_02_s43_R(1:end,2),'k','Marker','none','LineStyle','-','LineWidth',1); 

title('E_T Identification for homogeneous model: specimen 02') 
legend({'Reference Value','Identified Value'},...
    'FontName',script.nomeF,'FontSize',10,'EdgeColor',[1 1 1],...
    'Position',[0.67381 0.42943 0.25107 0.2833]);    
xlabel('Iterations','FontName',script.nomeF,'FontSize',script.size_font1)
ylabel('E_T, MPa','FontName',script.nomeF,'FontSize',script.size_font1)
xlim([0 length(res_A00_02_s43_R)])
% set(gca,'xtick',[0.52 0.54 0.56 0.58])
ylim([0.001 2000])
% annotation(fig_roi,'textbox',...
%     [0.001 0.92 0.057 0.078],...
%     'String',{'a)'},...
%     'FontWeight','bold',...
%     'FontSize',script.size_font2,...
%     'EdgeColor',[1 1 1]);
% save
fnome = [caminho,'Figures',filesep,'Fig2b'];
print(script.imgformat,script.resol,fnome)

%% Fig2c CP_RT A00_02

fig_roi = figure('Color',[1 1 1]);
axes('Position',[.13 .12 .80 .80],'FontName',script.nomeF,'FontSize',script.size_font1-2,'Parent',fig_roi);
% Reference Parameters
plot(mater.CP23_EW*ones(length(res_A00_02_s43_R),1),'k','Marker','none','LineStyle','--','LineWidth',3);
hold on; box on;

% A00_02 s43 BC R
plot(res_A00_02_s43_R(1:end,3),'k','Marker','none','LineStyle','-','LineWidth',1); 

title('\nu_{RT} Identification for homogeneous model: specimen 02') 
legend({'Reference Value','Identified Value'},...
    'FontName',script.nomeF,'FontSize',10,'EdgeColor',[1 1 1],...
    'Position',[0.67381 0.42943 0.25107 0.2833]);    
xlabel('Iterations','FontName',script.nomeF,'FontSize',script.size_font1)
ylabel('\nu_{RT}, MPa','FontName',script.nomeF,'FontSize',script.size_font1)
xlim([0 length(res_A00_02_s43_R)])
% set(gca,'xtick',[0.52 0.54 0.56 0.58])
ylim([0.001 1.1])
% annotation(fig_roi,'textbox',...
%     [0.001 0.92 0.057 0.078],...
%     'String',{'a)'},...
%     'FontWeight','bold',...
%     'FontSize',script.size_font2,...
%     'EdgeColor',[1 1 1]);
% save
fnome = [caminho,'Figures',filesep,'Fig2c'];
print(script.imgformat,script.resol,fnome)


%% Fig2d G_RT A00_02

fig_roi = figure('Color',[1 1 1]);
axes('Position',[.13 .12 .80 .80],'FontName',script.nomeF,'FontSize',script.size_font1-2,'Parent',fig_roi);
% Reference Parameters
plot(mater.G23_EW*ones(length(res_A00_02_s43_R),1),'k','Marker','none','LineStyle','--','LineWidth',3);
hold on; box on;

% A00_02 s43 BC R
plot(res_A00_02_s43_R(1:end,4),'k','Marker','none','LineStyle','-','LineWidth',1); 

title('G_{RT} Identification for homogeneous model: specimen 02') 
legend({'Reference Value','Identified Value'},...
    'FontName',script.nomeF,'FontSize',10,'EdgeColor',[1 1 1],...
    'Position',[0.67381 0.42943 0.25107 0.2833]);    
xlabel('Iterations','FontName',script.nomeF,'FontSize',script.size_font1)
ylabel('G_{RT}, MPa','FontName',script.nomeF,'FontSize',script.size_font1)
xlim([0 length(res_A00_02_s43_R)])
% set(gca,'xtick',[0.52 0.54 0.56 0.58])
ylim([0.001 700])
% annotation(fig_roi,'textbox',...
%     [0.001 0.92 0.057 0.078],...
%     'String',{'a)'},...
%     'FontWeight','bold',...
%     'FontSize',script.size_font2,...
%     'EdgeColor',[1 1 1]);
% save
fnome = [caminho,'Figures',filesep,'Fig2d'];
print(script.imgformat,script.resol,fnome)

%% ---------------------------A00_03---------------------------------------------

% Fig3a E_R A00_03
fig_roi = figure('Color',[1 1 1]);
axes('Position',[.13 .12 .80 .80],'FontName',script.nomeF,'FontSize',script.size_font1-2,'Parent',fig_roi);
% Reference Parameters
plot(mater.E2_EW*ones(length(res_A00_03_s16_R),1),'k','Marker','none','LineStyle','--','LineWidth',3);
hold on; box on;

% A00_03 s16 BC R
plot(res_A00_03_s16_R(1:end,1),'k','Marker','none','LineStyle','-','LineWidth',1); 

title('E_R Identification for homogeneous model: specimen 03') 
legend({'Reference Value','Identified Value'},...
    'FontName',script.nomeF,'FontSize',10,'EdgeColor',[1 1 1],...
    'Position',[0.67381 0.42943 0.25107 0.2833]);    
xlabel('Iterations','FontName',script.nomeF,'FontSize',script.size_font1)
ylabel('E_R, MPa','FontName',script.nomeF,'FontSize',script.size_font1)
xlim([0 length(res_A00_03_s16_R)])
% set(gca,'xtick',[0.52 0.54 0.56 0.58])
ylim([0.001 4000])
% annotation(fig_roi,'textbox',...
%     [0.001 0.92 0.057 0.078],...
%     'String',{'a)'},...
%     'FontWeight','bold',...
%     'FontSize',script.size_font2,...
%     'EdgeColor',[1 1 1]);
% save
fnome = [caminho,'Figures',filesep,'Fig3a'];
print(script.imgformat,script.resol,fnome)

%% Fig3b E_T A00_03

fig_roi = figure('Color',[1 1 1]);
axes('Position',[.13 .12 .80 .80],'FontName',script.nomeF,'FontSize',script.size_font1-2,'Parent',fig_roi);
% Reference Parameters
plot(mater.E3_EW*ones(length(res_A00_03_s16_R),1),'k','Marker','none','LineStyle','--','LineWidth',3);
hold on; box on;

% A00_03 s16 BC R
plot(res_A00_03_s16_R(1:end,2),'k','Marker','none','LineStyle','-','LineWidth',1); 

title('E_T Identification for homogeneous model: specimen 03') 
legend({'Reference Value','Identified Value'},...
    'FontName',script.nomeF,'FontSize',10,'EdgeColor',[1 1 1],...
    'Position',[0.67381 0.42943 0.25107 0.2833]);    
xlabel('Iterations','FontName',script.nomeF,'FontSize',script.size_font1)
ylabel('E_T, MPa','FontName',script.nomeF,'FontSize',script.size_font1)
xlim([0 length(res_A00_03_s16_R)])
% set(gca,'xtick',[0.52 0.54 0.56 0.58])
ylim([0.001 2000])
% annotation(fig_roi,'textbox',...
%     [0.001 0.92 0.057 0.078],...
%     'String',{'a)'},...
%     'FontWeight','bold',...
%     'FontSize',script.size_font2,...
%     'EdgeColor',[1 1 1]);
% save
fnome = [caminho,'Figures',filesep,'Fig3b'];
print(script.imgformat,script.resol,fnome)

%% Fig3c CP_RT A00_03

fig_roi = figure('Color',[1 1 1]);
axes('Position',[.13 .12 .80 .80],'FontName',script.nomeF,'FontSize',script.size_font1-2,'Parent',fig_roi);
% Reference Parameters
plot(mater.CP23_EW*ones(length(res_A00_03_s16_R),1),'k','Marker','none','LineStyle','--','LineWidth',3);
hold on; box on;

% A00_03 s16 BC R
plot(res_A00_03_s16_R(1:end,3),'k','Marker','none','LineStyle','-','LineWidth',1); 

title('\nu_{RT} Identification for homogeneous model: specimen 03') 
legend({'Reference Value','Identified Value'},...
    'FontName',script.nomeF,'FontSize',10,'EdgeColor',[1 1 1],...
    'Position',[0.67381 0.42943 0.25107 0.2833]);    
xlabel('Iterations','FontName',script.nomeF,'FontSize',script.size_font1)
ylabel('\nu_{RT}, MPa','FontName',script.nomeF,'FontSize',script.size_font1)
xlim([0 length(res_A00_03_s16_R)])
% set(gca,'xtick',[0.52 0.54 0.56 0.58])
ylim([0.001 1.1])
% annotation(fig_roi,'textbox',...
%     [0.001 0.92 0.057 0.078],...
%     'String',{'a)'},...
%     'FontWeight','bold',...
%     'FontSize',script.size_font2,...
%     'EdgeColor',[1 1 1]);
% save
fnome = [caminho,'Figures',filesep,'Fig3c'];
print(script.imgformat,script.resol,fnome)


%% Fig3d G_RT A00_03

fig_roi = figure('Color',[1 1 1]);
axes('Position',[.13 .12 .80 .80],'FontName',script.nomeF,'FontSize',script.size_font1-2,'Parent',fig_roi);
% Reference Parameters
plot(mater.G23_EW*ones(length(res_A00_03_s16_R),1),'k','Marker','none','LineStyle','--','LineWidth',3);
hold on; box on;

% A00_03 s16 BC R
plot(res_A00_03_s16_R(1:end,4),'k','Marker','none','LineStyle','-','LineWidth',1); 

title('G_{RT} Identification for homogeneous model: specimen 03') 
legend({'Reference Value','Identified Value'},...
    'FontName',script.nomeF,'FontSize',10,'EdgeColor',[1 1 1],...
    'Position',[0.67381 0.42943 0.25107 0.2833]);    
xlabel('Iterations','FontName',script.nomeF,'FontSize',script.size_font1)
ylabel('G_{RT}, MPa','FontName',script.nomeF,'FontSize',script.size_font1)
xlim([0 length(res_A00_03_s16_R)])
% set(gca,'xtick',[0.52 0.54 0.56 0.58])
ylim([0.001 700])
% annotation(fig_roi,'textbox',...
%     [0.001 0.92 0.057 0.078],...
%     'String',{'a)'},...
%     'FontWeight','bold',...
%     'FontSize',script.size_font2,...
%     'EdgeColor',[1 1 1]);
% save
fnome = [caminho,'Figures',filesep,'Fig3d'];
print(script.imgformat,script.resol,fnome)

%% ---------------------------A00_04---------------------------------------------

% Fig4a E_R A00_04
fig_roi = figure('Color',[1 1 1]);
axes('Position',[.13 .12 .80 .80],'FontName',script.nomeF,'FontSize',script.size_font1-2,'Parent',fig_roi);
% Reference Parameters
plot(mater.E2_EW*ones(length(res_A00_04_s44_R),1),'k','Marker','none','LineStyle','--','LineWidth',3);
hold on; box on;

% A00_04 s44 BC R
plot(res_A00_04_s44_R(1:end,1),'k','Marker','none','LineStyle','-','LineWidth',1); 

title('E_R Identification for homogeneous model: specimen 04') 
legend({'Reference Value','Identified Value'},...
    'FontName',script.nomeF,'FontSize',10,'EdgeColor',[1 1 1],...
    'Position',[0.67381 0.42943 0.25107 0.2833]);    
xlabel('Iterations','FontName',script.nomeF,'FontSize',script.size_font1)
ylabel('E_R, MPa','FontName',script.nomeF,'FontSize',script.size_font1)
xlim([0 length(res_A00_04_s44_R)])
% set(gca,'xtick',[0.52 0.54 0.56 0.58])
ylim([0.001 4000])
% annotation(fig_roi,'textbox',...
%     [0.001 0.92 0.057 0.078],...
%     'String',{'a)'},...
%     'FontWeight','bold',...
%     'FontSize',script.size_font2,...
%     'EdgeColor',[1 1 1]);
% save
fnome = [caminho,'Figures',filesep,'Fig4a'];
print(script.imgformat,script.resol,fnome)

%% Fig4b E_T A00_04

fig_roi = figure('Color',[1 1 1]);
axes('Position',[.13 .12 .80 .80],'FontName',script.nomeF,'FontSize',script.size_font1-2,'Parent',fig_roi);
% Reference Parameters
plot(mater.E3_EW*ones(length(res_A00_04_s44_R),1),'k','Marker','none','LineStyle','--','LineWidth',3);
hold on; box on;

% A00_04 s44 BC R
plot(res_A00_04_s44_R(1:end,2),'k','Marker','none','LineStyle','-','LineWidth',1); 

title('E_T Identification for homogeneous model: specimen 04') 
legend({'Reference Value','Identified Value'},...
    'FontName',script.nomeF,'FontSize',10,'EdgeColor',[1 1 1],...
    'Position',[0.67381 0.42943 0.25107 0.2833]);    
xlabel('Iterations','FontName',script.nomeF,'FontSize',script.size_font1)
ylabel('E_T, MPa','FontName',script.nomeF,'FontSize',script.size_font1)
xlim([0 length(res_A00_04_s44_R)])
% set(gca,'xtick',[0.52 0.54 0.56 0.58])
ylim([0.001 2000])
% annotation(fig_roi,'textbox',...
%     [0.001 0.92 0.057 0.078],...
%     'String',{'a)'},...
%     'FontWeight','bold',...
%     'FontSize',script.size_font2,...
%     'EdgeColor',[1 1 1]);
% save
fnome = [caminho,'Figures',filesep,'Fig4b'];
print(script.imgformat,script.resol,fnome)

%% Fig4c CP_RT A00_04

fig_roi = figure('Color',[1 1 1]);
axes('Position',[.13 .12 .80 .80],'FontName',script.nomeF,'FontSize',script.size_font1-2,'Parent',fig_roi);
% Reference Parameters
plot(mater.CP23_EW*ones(length(res_A00_04_s44_R),1),'k','Marker','none','LineStyle','--','LineWidth',3);
hold on; box on;

% A00_04 s44 BC R
plot(res_A00_04_s44_R(1:end,3),'k','Marker','none','LineStyle','-','LineWidth',1); 

title('\nu_{RT} Identification for homogeneous model: specimen 04') 
legend({'Reference Value','Identified Value'},...
    'FontName',script.nomeF,'FontSize',10,'EdgeColor',[1 1 1],...
    'Position',[0.67381 0.42943 0.25107 0.2833]);    
xlabel('Iterations','FontName',script.nomeF,'FontSize',script.size_font1)
ylabel('\nu_{RT}, MPa','FontName',script.nomeF,'FontSize',script.size_font1)
xlim([0 length(res_A00_04_s44_R)])
% set(gca,'xtick',[0.52 0.54 0.56 0.58])
ylim([0.001 1.1])
% annotation(fig_roi,'textbox',...
%     [0.001 0.92 0.057 0.078],...
%     'String',{'a)'},...
%     'FontWeight','bold',...
%     'FontSize',script.size_font2,...
%     'EdgeColor',[1 1 1]);
% save
fnome = [caminho,'Figures',filesep,'Fig4c'];
print(script.imgformat,script.resol,fnome)


%% Fig4d G_RT A00_04

fig_roi = figure('Color',[1 1 1]);
axes('Position',[.13 .12 .80 .80],'FontName',script.nomeF,'FontSize',script.size_font1-2,'Parent',fig_roi);
% Reference Parameters
plot(mater.G23_EW*ones(length(res_A00_04_s44_R),1),'k','Marker','none','LineStyle','--','LineWidth',3);
hold on; box on;

% A00_03 s16 BC R
plot(res_A00_04_s44_R(1:end,4),'k','Marker','none','LineStyle','-','LineWidth',1); 

title('G_{RT} Identification for homogeneous model: specimen 04') 
legend({'Reference Value','Identified Value'},...
    'FontName',script.nomeF,'FontSize',10,'EdgeColor',[1 1 1],...
    'Position',[0.67381 0.42943 0.25107 0.2833]);    
xlabel('Iterations','FontName',script.nomeF,'FontSize',script.size_font1)
ylabel('G_{RT}, MPa','FontName',script.nomeF,'FontSize',script.size_font1)
xlim([0 length(res_A00_04_s44_R)])
% set(gca,'xtick',[0.52 0.54 0.56 0.58])
ylim([0.001 700])
% annotation(fig_roi,'textbox',...
%     [0.001 0.92 0.057 0.078],...
%     'String',{'a)'},...
%     'FontWeight','bold',...
%     'FontSize',script.size_font2,...
%     'EdgeColor',[1 1 1]);
% save
fnome = [caminho,'Figures',filesep,'Fig4d'];
print(script.imgformat,script.resol,fnome)


%% ---------------------------A00_05---------------------------------------------


%% ---------------------------A00_06---------------------------------------------

% Fig6a E_R A00_06
fig_roi = figure('Color',[1 1 1]);
axes('Position',[.13 .12 .80 .80],'FontName',script.nomeF,'FontSize',script.size_font1-2,'Parent',fig_roi);
% Reference Parameters
plot(mater.E2_EW*ones(length(res_A00_06_s33_R),1),'k','Marker','none','LineStyle','--','LineWidth',3);
hold on; box on;

% A00_06 s33 BC R
plot(res_A00_06_s33_R(1:end,1),'k','Marker','none','LineStyle','-','LineWidth',1); 

title('E_R Identification for homogeneous model: specimen 06') 
legend({'Reference Value','Identified Value'},...
    'FontName',script.nomeF,'FontSize',10,'EdgeColor',[1 1 1],...
    'Position',[0.67381 0.42943 0.25107 0.2833]);    
xlabel('Iterations','FontName',script.nomeF,'FontSize',script.size_font1)
ylabel('E_R, MPa','FontName',script.nomeF,'FontSize',script.size_font1)
xlim([0 length(res_A00_06_s33_R)])
% set(gca,'xtick',[0.52 0.54 0.56 0.58])
ylim([0.001 4000])
% annotation(fig_roi,'textbox',...
%     [0.001 0.92 0.057 0.078],...
%     'String',{'a)'},...
%     'FontWeight','bold',...
%     'FontSize',script.size_font2,...
%     'EdgeColor',[1 1 1]);
% save
fnome = [caminho,'Figures',filesep,'Fig6a'];
print(script.imgformat,script.resol,fnome)

%% Fig6b E_T A00_06

fig_roi = figure('Color',[1 1 1]);
axes('Position',[.13 .12 .80 .80],'FontName',script.nomeF,'FontSize',script.size_font1-2,'Parent',fig_roi);
% Reference Parameters
plot(mater.E3_EW*ones(length(res_A00_06_s33_R),1),'k','Marker','none','LineStyle','--','LineWidth',3);
hold on; box on;

% A00_06 s33 BC R
plot(res_A00_06_s33_R(1:end,2),'k','Marker','none','LineStyle','-','LineWidth',1); 

title('E_T Identification for homogeneous model: specimen 06') 
legend({'Reference Value','Identified Value'},...
    'FontName',script.nomeF,'FontSize',10,'EdgeColor',[1 1 1],...
    'Position',[0.67381 0.42943 0.25107 0.2833]);    
xlabel('Iterations','FontName',script.nomeF,'FontSize',script.size_font1)
ylabel('E_T, MPa','FontName',script.nomeF,'FontSize',script.size_font1)
xlim([0 length(res_A00_06_s33_R)])
% set(gca,'xtick',[0.52 0.54 0.56 0.58])
ylim([0.001 2000])
% annotation(fig_roi,'textbox',...
%     [0.001 0.92 0.057 0.078],...
%     'String',{'a)'},...
%     'FontWeight','bold',...
%     'FontSize',script.size_font2,...
%     'EdgeColor',[1 1 1]);
% save
fnome = [caminho,'Figures',filesep,'Fig6b'];
print(script.imgformat,script.resol,fnome)

%% Fig6c CP_RT A00_06

fig_roi = figure('Color',[1 1 1]);
axes('Position',[.13 .12 .80 .80],'FontName',script.nomeF,'FontSize',script.size_font1-2,'Parent',fig_roi);
% Reference Parameters
plot(mater.CP23_EW*ones(length(res_A00_06_s33_R),1),'k','Marker','none','LineStyle','--','LineWidth',3);
hold on; box on;

% A00_06 s33 BC R
plot(res_A00_06_s33_R(1:end,3),'k','Marker','none','LineStyle','-','LineWidth',1); 

title('\nu_{RT} Identification for homogeneous model: specimen 06') 
legend({'Reference Value','Identified Value'},...
    'FontName',script.nomeF,'FontSize',10,'EdgeColor',[1 1 1],...
    'Position',[0.67381 0.42943 0.25107 0.2833]);    
xlabel('Iterations','FontName',script.nomeF,'FontSize',script.size_font1)
ylabel('\nu_{RT}, MPa','FontName',script.nomeF,'FontSize',script.size_font1)
xlim([0 length(res_A00_06_s33_R)])
% set(gca,'xtick',[0.52 0.54 0.56 0.58])
ylim([0.001 1.1])
% annotation(fig_roi,'textbox',...
%     [0.001 0.92 0.057 0.078],...
%     'String',{'a)'},...
%     'FontWeight','bold',...
%     'FontSize',script.size_font2,...
%     'EdgeColor',[1 1 1]);
% save
fnome = [caminho,'Figures',filesep,'Fig6c'];
print(script.imgformat,script.resol,fnome)


%% Fig6d G_RT A00_06

fig_roi = figure('Color',[1 1 1]);
axes('Position',[.13 .12 .80 .80],'FontName',script.nomeF,'FontSize',script.size_font1-2,'Parent',fig_roi);
% Reference Parameters
plot(mater.G23_EW*ones(length(res_A00_06_s33_R),1),'k','Marker','none','LineStyle','--','LineWidth',3);
hold on; box on;

% A00_06 s33 BC R
plot(res_A00_06_s33_R(1:end,4),'k','Marker','none','LineStyle','-','LineWidth',1); 

title('G_{RT} Identification for homogeneous model: specimen 06') 
legend({'Reference Value','Identified Value'},...
    'FontName',script.nomeF,'FontSize',10,'EdgeColor',[1 1 1],...
    'Position',[0.67381 0.42943 0.25107 0.2833]);    
xlabel('Iterations','FontName',script.nomeF,'FontSize',script.size_font1)
ylabel('G_{RT}, MPa','FontName',script.nomeF,'FontSize',script.size_font1)
xlim([0 length(res_A00_06_s33_R)])
% set(gca,'xtick',[0.52 0.54 0.56 0.58])
ylim([0.001 700])
% annotation(fig_roi,'textbox',...
%     [0.001 0.92 0.057 0.078],...
%     'String',{'a)'},...
%     'FontWeight','bold',...
%     'FontSize',script.size_font2,...
%     'EdgeColor',[1 1 1]);
% save
fnome = [caminho,'Figures',filesep,'Fig6d'];
print(script.imgformat,script.resol,fnome)

%% ---------------------------A00_07---------------------------------------------

% Fig7a E_R A00_07
fig_roi = figure('Color',[1 1 1]);
axes('Position',[.13 .12 .80 .80],'FontName',script.nomeF,'FontSize',script.size_font1-2,'Parent',fig_roi);
% Reference Parameters
plot(mater.E2_EW*ones(length(res_A00_07_s15_R),1),'k','Marker','none','LineStyle','--','LineWidth',3);
hold on; box on;

% A00_07 s15 BC R
plot(res_A00_07_s15_R(1:end,1),'k','Marker','none','LineStyle','-','LineWidth',1); 

title('E_R Identification for homogeneous model: specimen 07') 
legend({'Reference Value','Identified Value'},...
    'FontName',script.nomeF,'FontSize',10,'EdgeColor',[1 1 1],...
    'Position',[0.67381 0.42943 0.25107 0.2833]);    
xlabel('Iterations','FontName',script.nomeF,'FontSize',script.size_font1)
ylabel('E_R, MPa','FontName',script.nomeF,'FontSize',script.size_font1)
xlim([0 length(res_A00_07_s15_R)])
% set(gca,'xtick',[0.52 0.54 0.56 0.58])
ylim([0.001 4000])
% annotation(fig_roi,'textbox',...
%     [0.001 0.92 0.057 0.078],...
%     'String',{'a)'},...
%     'FontWeight','bold',...
%     'FontSize',script.size_font2,...
%     'EdgeColor',[1 1 1]);
% save
fnome = [caminho,'Figures',filesep,'Fig7a'];
print(script.imgformat,script.resol,fnome)

%% Fig7b E_T A00_07

fig_roi = figure('Color',[1 1 1]);
axes('Position',[.13 .12 .80 .80],'FontName',script.nomeF,'FontSize',script.size_font1-2,'Parent',fig_roi);
% Reference Parameters
plot(mater.E3_EW*ones(length(res_A00_07_s15_R),1),'k','Marker','none','LineStyle','--','LineWidth',3);
hold on; box on;

% A00_07 s15 BC R
plot(res_A00_07_s15_R(1:end,2),'k','Marker','none','LineStyle','-','LineWidth',1); 

title('E_T Identification for homogeneous model: specimen 07') 
legend({'Reference Value','Identified Value'},...
    'FontName',script.nomeF,'FontSize',10,'EdgeColor',[1 1 1],...
    'Position',[0.67381 0.42943 0.25107 0.2833]);    
xlabel('Iterations','FontName',script.nomeF,'FontSize',script.size_font1)
ylabel('E_T, MPa','FontName',script.nomeF,'FontSize',script.size_font1)
xlim([0 length(res_A00_07_s15_R)])
% set(gca,'xtick',[0.52 0.54 0.56 0.58])
ylim([0.001 2000])
% annotation(fig_roi,'textbox',...
%     [0.001 0.92 0.057 0.078],...
%     'String',{'a)'},...
%     'FontWeight','bold',...
%     'FontSize',script.size_font2,...
%     'EdgeColor',[1 1 1]);
% save
fnome = [caminho,'Figures',filesep,'Fig7b'];
print(script.imgformat,script.resol,fnome)

%% Fig7c CP_RT A00_07

fig_roi = figure('Color',[1 1 1]);
axes('Position',[.13 .12 .80 .80],'FontName',script.nomeF,'FontSize',script.size_font1-2,'Parent',fig_roi);
% Reference Parameters
plot(mater.CP23_EW*ones(length(res_A00_07_s15_R),1),'k','Marker','none','LineStyle','--','LineWidth',3);
hold on; box on;

% A00_07 s15 BC R
plot(res_A00_07_s15_R(1:end,3),'k','Marker','none','LineStyle','-','LineWidth',1); 

title('\nu_{RT} Identification for homogeneous model: specimen 07') 
legend({'Reference Value','Identified Value'},...
    'FontName',script.nomeF,'FontSize',10,'EdgeColor',[1 1 1],...
    'Position',[0.67381 0.42943 0.25107 0.2833]);    
xlabel('Iterations','FontName',script.nomeF,'FontSize',script.size_font1)
ylabel('\nu_{RT}, MPa','FontName',script.nomeF,'FontSize',script.size_font1)
xlim([0 length(res_A00_07_s15_R)])
% set(gca,'xtick',[0.52 0.54 0.56 0.58])
ylim([0.001 1.1])
% annotation(fig_roi,'textbox',...
%     [0.001 0.92 0.057 0.078],...
%     'String',{'a)'},...
%     'FontWeight','bold',...
%     'FontSize',script.size_font2,...
%     'EdgeColor',[1 1 1]);
% save
fnome = [caminho,'Figures',filesep,'Fig7c'];
print(script.imgformat,script.resol,fnome)


%% Fig7d G_RT A00_07

fig_roi = figure('Color',[1 1 1]);
axes('Position',[.13 .12 .80 .80],'FontName',script.nomeF,'FontSize',script.size_font1-2,'Parent',fig_roi);
% Reference Parameters
plot(mater.G23_EW*ones(length(res_A00_07_s15_R),1),'k','Marker','none','LineStyle','--','LineWidth',3);
hold on; box on;

% A00_07 s15 BC R
plot(res_A00_07_s15_R(1:end,4),'k','Marker','none','LineStyle','-','LineWidth',1); 

title('G_{RT} Identification for homogeneous model: specimen 07') 
legend({'Reference Value','Identified Value'},...
    'FontName',script.nomeF,'FontSize',10,'EdgeColor',[1 1 1],...
    'Position',[0.67381 0.42943 0.25107 0.2833]);    
xlabel('Iterations','FontName',script.nomeF,'FontSize',script.size_font1)
ylabel('G_{RT}, MPa','FontName',script.nomeF,'FontSize',script.size_font1)
xlim([0 length(res_A00_07_s15_R)])
% set(gca,'xtick',[0.52 0.54 0.56 0.58])
ylim([0.001 700])
% annotation(fig_roi,'textbox',...
%     [0.001 0.92 0.057 0.078],...
%     'String',{'a)'},...
%     'FontWeight','bold',...
%     'FontSize',script.size_font2,...
%     'EdgeColor',[1 1 1]);
% save
fnome = [caminho,'Figures',filesep,'Fig7d'];
print(script.imgformat,script.resol,fnome)


%% ---------------------------A00_08---------------------------------------------


%% ---------------------------A00_09---------------------------------------------


%% ---------------------------A00_10---------------------------------------------

% Fig10a E_R A00_10
fig_roi = figure('Color',[1 1 1]);
axes('Position',[.13 .12 .80 .80],'FontName',script.nomeF,'FontSize',script.size_font1-2,'Parent',fig_roi);
% Reference Parameters
plot(mater.E2_EW*ones(length(res_A00_10_s27_R),1),'k','Marker','none','LineStyle','--','LineWidth',3);
hold on; box on;

% A00_10 s27 BC R
plot(res_A00_10_s27_R(1:end,1),'k','Marker','none','LineStyle','-','LineWidth',1); 

title('E_R Identification for homogeneous model: specimen 10') 
legend({'Reference Value','Identified Value'},...
    'FontName',script.nomeF,'FontSize',10,'EdgeColor',[1 1 1],...
    'Position',[0.67381 0.42943 0.25107 0.2833]);    
xlabel('Iterations','FontName',script.nomeF,'FontSize',script.size_font1)
ylabel('E_R, MPa','FontName',script.nomeF,'FontSize',script.size_font1)
xlim([0 length(res_A00_10_s27_R)])
% set(gca,'xtick',[0.52 0.54 0.56 0.58])
ylim([0.001 4000])
% annotation(fig_roi,'textbox',...
%     [0.001 0.92 0.057 0.078],...
%     'String',{'a)'},...
%     'FontWeight','bold',...
%     'FontSize',script.size_font2,...
%     'EdgeColor',[1 1 1]);
% save
fnome = [caminho,'Figures',filesep,'Fig10a'];
print(script.imgformat,script.resol,fnome)

%% Fig10b E_T A00_10

fig_roi = figure('Color',[1 1 1]);
axes('Position',[.13 .12 .80 .80],'FontName',script.nomeF,'FontSize',script.size_font1-2,'Parent',fig_roi);
% Reference Parameters
plot(mater.E3_EW*ones(length(res_A00_10_s27_R),1),'k','Marker','none','LineStyle','--','LineWidth',3);
hold on; box on;

% A00_10 s27 BC R
plot(res_A00_10_s27_R(1:end,2),'k','Marker','none','LineStyle','-','LineWidth',1); 

title('E_T Identification for homogeneous model: specimen 10') 
legend({'Reference Value','Identified Value'},...
    'FontName',script.nomeF,'FontSize',10,'EdgeColor',[1 1 1],...
    'Position',[0.67381 0.42943 0.25107 0.2833]);    
xlabel('Iterations','FontName',script.nomeF,'FontSize',script.size_font1)
ylabel('E_T, MPa','FontName',script.nomeF,'FontSize',script.size_font1)
xlim([0 length(res_A00_10_s27_R)])
% set(gca,'xtick',[0.52 0.54 0.56 0.58])
ylim([0.001 2000])
% annotation(fig_roi,'textbox',...
%     [0.001 0.92 0.057 0.078],...
%     'String',{'a)'},...
%     'FontWeight','bold',...
%     'FontSize',script.size_font2,...
%     'EdgeColor',[1 1 1]);
% save
fnome = [caminho,'Figures',filesep,'Fig10b'];
print(script.imgformat,script.resol,fnome)

%% Fig10c CP_RT A00_10

fig_roi = figure('Color',[1 1 1]);
axes('Position',[.13 .12 .80 .80],'FontName',script.nomeF,'FontSize',script.size_font1-2,'Parent',fig_roi);
% Reference Parameters
plot(mater.CP23_EW*ones(length(res_A00_10_s27_R),1),'k','Marker','none','LineStyle','--','LineWidth',3);
hold on; box on;

% A00_10 s27 BC R
plot(res_A00_10_s27_R(1:end,3),'k','Marker','none','LineStyle','-','LineWidth',1); 

title('\nu_{RT} Identification for homogeneous model: specimen 10') 
legend({'Reference Value','Identified Value'},...
    'FontName',script.nomeF,'FontSize',10,'EdgeColor',[1 1 1],...
    'Position',[0.67381 0.42943 0.25107 0.2833]);    
xlabel('Iterations','FontName',script.nomeF,'FontSize',script.size_font1)
ylabel('\nu_{RT}, MPa','FontName',script.nomeF,'FontSize',script.size_font1)
xlim([0 length(res_A00_10_s27_R)])
% set(gca,'xtick',[0.52 0.54 0.56 0.58])
ylim([0.001 1.1])
% annotation(fig_roi,'textbox',...
%     [0.001 0.92 0.057 0.078],...
%     'String',{'a)'},...
%     'FontWeight','bold',...
%     'FontSize',script.size_font2,...
%     'EdgeColor',[1 1 1]);
% save
fnome = [caminho,'Figures',filesep,'Fig10c'];
print(script.imgformat,script.resol,fnome)


%% Fig10d G_RT A00_10

fig_roi = figure('Color',[1 1 1]);
axes('Position',[.13 .12 .80 .80],'FontName',script.nomeF,'FontSize',script.size_font1-2,'Parent',fig_roi);
% Reference Parameters
plot(mater.G23_EW*ones(length(res_A00_10_s27_R),1),'k','Marker','none','LineStyle','--','LineWidth',3);
hold on; box on;

% A00_10 s27 BC R
plot(res_A00_10_s27_R(1:end,4),'k','Marker','none','LineStyle','-','LineWidth',1); 

title('G_{RT} Identification for homogeneous model: specimen 10') 
legend({'Reference Value','Identified Value'},...
    'FontName',script.nomeF,'FontSize',10,'EdgeColor',[1 1 1],...
    'Position',[0.67381 0.42943 0.25107 0.2833]);    
xlabel('Iterations','FontName',script.nomeF,'FontSize',script.size_font1)
ylabel('G_{RT}, MPa','FontName',script.nomeF,'FontSize',script.size_font1)
xlim([0 length(res_A00_10_s27_R)])
% set(gca,'xtick',[0.52 0.54 0.56 0.58])
ylim([0.001 700])
% annotation(fig_roi,'textbox',...
%     [0.001 0.92 0.057 0.078],...
%     'String',{'a)'},...
%     'FontWeight','bold',...
%     'FontSize',script.size_font2,...
%     'EdgeColor',[1 1 1]);
% save
fnome = [caminho,'Figures',filesep,'Fig10d'];
print(script.imgformat,script.resol,fnome)

%% --------------------- ALL ---------------------%%
%E_R

fig_roi = figure('Color',[1 1 1]);
axes('Position',[.14 .12 .80 .80],'FontName',script.nomeF,'FontSize',script.size_font1-2,'Parent',fig_roi);
% Reference Parameters
plot(mater.E2_EW*ones(250,1),'k','Marker','none','LineStyle','--','LineWidth',3);
hold on; box on;

% A00_01 s104 BC R
plot(res_A00_01_s104_R(1:250,1),'k','Marker','none','LineStyle','-','LineWidth',1); 
  
% A00_02 s43 BC R
plot(res_A00_02_s43_R(1:250,1),'k','Marker','none','LineStyle','--','LineWidth',1); 

% A00_03 s16 BC R
plot(res_A00_03_s16_R(1:250,1),'k','Marker','o','MarkerIndices',1:5:250,'LineStyle','-','LineWidth',1); 
  
% A00_04 s44 BC R
plot(res_A00_04_s44_R(1:250,1),'k','Marker','none','LineStyle',':','LineWidth',2); 

% A00_06 s33 BC R
plot(res_A00_06_s33_R(1:250,1),'Color',[0.7, 0.7, 0.7],'Marker','none','LineStyle','-','LineWidth',1); 

% A00_07 s15 BC R
plot(res_A00_07_s15_R(1:250,1),'Color',[0.7, 0.7, 0.7],'Marker','none','LineStyle','--','LineWidth',1); 

% A00_10 s27 BC R
plot(res_A00_10_s27_R(1:250,1),'Color',[0.7, 0.7, 0.7],'Marker','o','MarkerIndices',1:5:250,'LineStyle','-','LineWidth',1); 


% title('E_R Identification') 
legend({'Reference Value','01','02','03','04','05','06','07',},...
    'FontName',script.nomeF,'FontSize',10,'EdgeColor',[1 1 1],...
    'Position',[0.648095714285714 0.567865710652669 0.25107 0.322619054885138]);    
xlabel('Iterations','FontName',script.nomeF,'FontSize',script.size_font1)
ylabel('{\it E}_R, MPa','FontName',script.nomeF,'FontSize',script.size_font1)
xlim([0 250])
% set(gca,'xtick',[0.52 0.54 0.56 0.58])
ylim([0.001 4500])
annotation(fig_roi,'textbox',...
    [0.001 0.92 0.057 0.078],...
    'String',{'a'},...
    'FontSize',script.size_font2+7,...
    'EdgeColor',[1 1 1]);
% save
fnome = [caminho,'Figures',filesep,'Fig_all_ER'];
print(script.imgformat,script.resol,fnome)


%% E_T

fig_roi = figure('Color',[1 1 1]);
axes('Position',[.14 .12 .80 .80],'FontName',script.nomeF,'FontSize',script.size_font1-2,'Parent',fig_roi);
% Reference Parameters
plot(mater.E3_EW*ones(250,1),'k','Marker','none','LineStyle','--','LineWidth',3);
hold on; box on;

% A00_01 s104 BC R
plot(res_A00_01_s104_R(1:250,2),'k','Marker','none','LineStyle','-','LineWidth',1); 
  
% A00_02 s43 BC R
plot(res_A00_02_s43_R(1:250,2),'k','Marker','none','LineStyle','--','LineWidth',1); 

% A00_03 s16 BC R
plot(res_A00_03_s16_R(1:250,2),'k','Marker','o','MarkerIndices',1:5:250,'LineStyle','-','LineWidth',1); 
  
% A00_04 s44 BC R
plot(res_A00_04_s44_R(1:250,2),'k','Marker','none','LineStyle',':','LineWidth',2); 

% A00_06 s33 BC R
plot(res_A00_06_s33_R(1:250,2),'Color',[0.7, 0.7, 0.7],'Marker','none','LineStyle','-','LineWidth',1); 

% A00_07 s15 BC R
plot(res_A00_07_s15_R(1:250,2),'Color',[0.7, 0.7, 0.7],'Marker','none','LineStyle','--','LineWidth',1); 

% A00_10 s27 BC R
plot(res_A00_10_s27_R(1:250,2),'Color',[0.7, 0.7, 0.7],'Marker','o','MarkerIndices',1:5:250,'LineStyle','-','LineWidth',1); 


% title('E_T Identification') 
legend({'Reference Value','01','02','03','04','05','06','07',},...
    'FontName',script.nomeF,'FontSize',10,'EdgeColor',[1 1 1],...
    'Position',[0.660952857142857 0.564056186843145 0.25107 0.322619054885138]);    
xlabel('Iterations','FontName',script.nomeF,'FontSize',script.size_font1)
ylabel('{\it E}_T, MPa','FontName',script.nomeF,'FontSize',script.size_font1)
xlim([0 250])
% set(gca,'xtick',[0.52 0.54 0.56 0.58])
ylim([0.001 2500])
annotation(fig_roi,'textbox',...
    [0.001 0.92 0.057 0.078],...
    'String',{'b'},...
    'FontSize',script.size_font2+7,...
    'EdgeColor',[1 1 1]);
% save
fnome = [caminho,'Figures',filesep,'Fig_all_ET'];
print(script.imgformat,script.resol,fnome)


%% CP_RT

fig_roi = figure('Color',[1 1 1]);
axes('Position',[.14 .12 .80 .80],'FontName',script.nomeF,'FontSize',script.size_font1-2,'Parent',fig_roi);
% Reference Parameters
plot(mater.CP23_EW*ones(250,1),'k','Marker','none','LineStyle','--','LineWidth',3);
hold on; box on;

% A00_01 s104 BC R
plot(res_A00_01_s104_R(1:250,3),'k','Marker','none','LineStyle','-','LineWidth',1); 
  
% A00_02 s43 BC R
plot(res_A00_02_s43_R(1:250,3),'k','Marker','none','LineStyle','--','LineWidth',1); 

% A00_03 s16 BC R
plot(res_A00_03_s16_R(1:250,3),'k','Marker','o','MarkerIndices',1:5:250,'LineStyle','-','LineWidth',1); 
  
% A00_04 s44 BC R
plot(res_A00_04_s44_R(1:250,3),'k','Marker','none','LineStyle',':','LineWidth',2); 

% A00_06 s33 BC R
plot(res_A00_06_s33_R(1:250,3),'Color',[0.7, 0.7, 0.7],'Marker','none','LineStyle','-','LineWidth',1); 

% A00_07 s15 BC R
plot(res_A00_07_s15_R(1:250,3),'Color',[0.7, 0.7, 0.7],'Marker','none','LineStyle','--','LineWidth',1); 

% A00_10 s27 BC R
plot(res_A00_10_s27_R(1:250,3),'Color',[0.7, 0.7, 0.7],'Marker','o','MarkerIndices',1:5:250,'LineStyle','-','LineWidth',1); 


% title('\nu_{RT} Identification') 
legend({'Reference Value','01','02','03','04','05','06','07',},...
    'FontName',script.nomeF,'FontSize',10,'EdgeColor',[1 1 1],...
    'Position',[0.63381 0.164056186843145 0.25107 0.322619054885138]);    
xlabel('Iterations','FontName',script.nomeF,'FontSize',script.size_font1)
ylabel('\nu_{RT}','FontName',script.nomeF,'FontSize',script.size_font1)
xlim([0 250])
% set(gca,'xtick',[0.52 0.54 0.56 0.58])
ylim([0.001 1.1])
annotation(fig_roi,'textbox',...
    [0.001 0.92 0.057 0.078],...
    'String',{'c'},...
    'FontSize',script.size_font2+7,...
    'EdgeColor',[1 1 1]);
% save
fnome = [caminho,'Figures',filesep,'Fig_all_CPRT'];
print(script.imgformat,script.resol,fnome)


%% G_RT

fig_roi = figure('Color',[1 1 1]);
axes('Position',[.14 .12 .80 .80],'FontName',script.nomeF,'FontSize',script.size_font1-2,'Parent',fig_roi);
% Reference Parameters
plot(mater.G23_EW*ones(250,1),'k','Marker','none','LineStyle','--','LineWidth',3);
hold on; box on;

% A00_01 s104 BC R
plot(res_A00_01_s104_R(1:250,4),'k','Marker','none','LineStyle','-','LineWidth',1); 
  
% A00_02 s43 BC R
plot(res_A00_02_s43_R(1:250,4),'k','Marker','none','LineStyle','--','LineWidth',1); 

% A00_03 s16 BC R
plot(res_A00_03_s16_R(1:250,4),'k','Marker','o','MarkerIndices',1:5:250,'LineStyle','-','LineWidth',1); 
  
% A00_04 s44 BC R
plot(res_A00_04_s44_R(1:250,4),'k','Marker','none','LineStyle',':','LineWidth',2); 

% A00_06 s33 BC R
plot(res_A00_06_s33_R(1:250,4),'Color',[0.7, 0.7, 0.7],'Marker','none','LineStyle','-','LineWidth',1); 

% A00_07 s15 BC R
plot(res_A00_07_s15_R(1:250,4),'Color',[0.7, 0.7, 0.7],'Marker','none','LineStyle','--','LineWidth',1); 

% A00_10 s27 BC R
plot(res_A00_10_s27_R(1:250,4),'Color',[0.7, 0.7, 0.7],'Marker','o','MarkerIndices',1:5:250,'LineStyle','-','LineWidth',1); 


% title('G_{RT} Identification stage by stage') 
legend({'Reference Value','01','02','03','04','05','06','07',},...
    'FontName',script.nomeF,'FontSize',10,'EdgeColor',[1 1 1],...
    'Position',[0.650952857142857 0.579294282081241 0.25107 0.322619054885138]);    
xlabel('Iterations','FontName',script.nomeF,'FontSize',script.size_font1)
ylabel('{\it G}_{RT}, MPa','FontName',script.nomeF,'FontSize',script.size_font1)
xlim([0 250])
% set(gca,'xtick',[0.52 0.54 0.56 0.58])
ylim([0.001 900])
annotation(fig_roi,'textbox',...
    [0.001 0.92 0.057 0.078],...
    'String',{'d'},...
    'FontSize',script.size_font2+7,...
    'EdgeColor',[1 1 1]);
% save
fnome = [caminho,'Figures',filesep,'Fig_all_GRT'];
print(script.imgformat,script.resol,fnome)


%% OBjective function and terms%%
%OF1

fig_roi = figure('Color',[1 1 1]);
axes('Position',[.14 .12 .80 .80],'FontName',script.nomeF,'FontSize',script.size_font1-2,'Parent',fig_roi);

% A00_01 s104 BC R
plot(res_A00_01_s104_R(1:250,5),'k','Marker','none','LineStyle','-','LineWidth',1); 
hold on; box on;
% A00_02 s43 BC R
plot(res_A00_02_s43_R(1:250,5),'k','Marker','none','LineStyle','--','LineWidth',1); 

% A00_03 s16 BC R
plot(res_A00_03_s16_R(1:250,5),'k','Marker','o','MarkerIndices',1:5:250,'LineStyle','-','LineWidth',1); 
  
% A00_04 s44 BC R
plot(res_A00_04_s44_R(1:250,5),'k','Marker','none','LineStyle',':','LineWidth',2); 

% A00_06 s33 BC R
plot(res_A00_06_s33_R(1:250,5),'Color',[0.7, 0.7, 0.7],'Marker','none','LineStyle','-','LineWidth',1); 

% A00_07 s15 BC R
plot(res_A00_07_s15_R(1:250,5),'Color',[0.7, 0.7, 0.7],'Marker','none','LineStyle','--','LineWidth',1); 

% A00_10 s27 BC R
plot(res_A00_10_s27_R(1:250,5),'Color',[0.7, 0.7, 0.7],'Marker','o','MarkerIndices',1:5:250,'LineStyle','-','LineWidth',1); 


 
legend({'01','02','03','04','05','06','07',},...
    'FontName',script.nomeF,'FontSize',10,'EdgeColor',[1 1 1],...
    'Position',[0.648095714285714 0.567865710652669 0.25107 0.322619054885138]);    
xlabel('Iterations','FontName',script.nomeF,'FontSize',script.size_font1)
ylabel('Objective function value','FontName',script.nomeF,'FontSize',script.size_font1)
xlim([0 250])
% set(gca,'xtick',[0.52 0.54 0.56 0.58])
ylim([0.00000001 0.0025])
annotation(fig_roi,'textbox',...
    [0.001 0.92 0.057 0.078],...
    'String',{'a'},...
    'FontSize',script.size_font2+7,...
    'EdgeColor',[1 1 1]);
% save
fnome = [caminho,'Figures',filesep,'Fig_all_OF1'];
print(script.imgformat,script.resol,fnome)



%% IT1

fig_roi = figure('Color',[1 1 1]);
axes('Position',[.14 .12 .80 .80],'FontName',script.nomeF,'FontSize',script.size_font1-2,'Parent',fig_roi);

% A00_01 s104 BC R
plot(res_A00_01_s104_R(1:250,6),'k','Marker','none','LineStyle','-','LineWidth',1); 
hold on; box on;
% A00_02 s43 BC R
plot(res_A00_02_s43_R(1:250,6),'k','Marker','none','LineStyle','--','LineWidth',1); 

% A00_03 s16 BC R
plot(res_A00_03_s16_R(1:250,6),'k','Marker','o','MarkerIndices',1:5:250,'LineStyle','-','LineWidth',1); 
  
% A00_04 s44 BC R
plot(res_A00_04_s44_R(1:250,6),'k','Marker','none','LineStyle',':','LineWidth',2); 

% A00_06 s33 BC R
plot(res_A00_06_s33_R(1:250,6),'Color',[0.7, 0.7, 0.7],'Marker','none','LineStyle','-','LineWidth',1); 

% A00_07 s15 BC R
plot(res_A00_07_s15_R(1:250,6),'Color',[0.7, 0.7, 0.7],'Marker','none','LineStyle','--','LineWidth',1); 

% A00_10 s27 BC R
plot(res_A00_10_s27_R(1:250,6),'Color',[0.7, 0.7, 0.7],'Marker','o','MarkerIndices',1:5:250,'LineStyle','-','LineWidth',1); 


 
legend({'01','02','03','04','05','06','07',},...
    'FontName',script.nomeF,'FontSize',10,'EdgeColor',[1 1 1],...
    'Position',[0.648095714285714 0.567865710652669 0.25107 0.322619054885138]);    
xlabel('Iterations','FontName',script.nomeF,'FontSize',script.size_font1)
ylabel('Strain term value','FontName',script.nomeF,'FontSize',script.size_font1)
xlim([0 250])
% set(gca,'xtick',[0.52 0.54 0.56 0.58])
ylim([0.00000001 0.06])
annotation(fig_roi,'textbox',...
    [0.001 0.92 0.057 0.078],...
    'String',{'b'},...
    'FontSize',script.size_font2+7,...
    'EdgeColor',[1 1 1]);
% save
fnome = [caminho,'Figures',filesep,'Fig_all_IT1'];
print(script.imgformat,script.resol,fnome)

%% ITF

fig_roi = figure('Color',[1 1 1]);
axes('Position',[.14 .12 .80 .80],'FontName',script.nomeF,'FontSize',script.size_font1-2,'Parent',fig_roi);

% A00_01 s104 BC R
plot(res_A00_01_s104_R(1:250,7),'k','Marker','none','LineStyle','-','LineWidth',1); 
hold on; box on;
% A00_02 s43 BC R
plot(res_A00_02_s43_R(1:250,7),'k','Marker','none','LineStyle','--','LineWidth',1); 

% A00_03 s16 BC R
plot(res_A00_03_s16_R(1:250,7),'k','Marker','o','MarkerIndices',1:5:250,'LineStyle','-','LineWidth',1); 
  
% A00_04 s44 BC R
plot(res_A00_04_s44_R(1:250,7),'k','Marker','none','LineStyle',':','LineWidth',2); 

% A00_06 s33 BC R
plot(res_A00_06_s33_R(1:250,7),'Color',[0.7, 0.7, 0.7],'Marker','none','LineStyle','-','LineWidth',1); 

% A00_07 s15 BC R
plot(res_A00_07_s15_R(1:250,7),'Color',[0.7, 0.7, 0.7],'Marker','none','LineStyle','--','LineWidth',1); 

% A00_10 s27 BC R
plot(res_A00_10_s27_R(1:250,7),'Color',[0.7, 0.7, 0.7],'Marker','o','MarkerIndices',1:5:250,'LineStyle','-','LineWidth',1); 


 
legend({'01','02','03','04','05','06','07',},...
    'FontName',script.nomeF,'FontSize',10,'EdgeColor',[1 1 1],...
    'Position',[0.648095714285714 0.567865710652669 0.25107 0.322619054885138]);    
xlabel('Iterations','FontName',script.nomeF,'FontSize',script.size_font1)
ylabel('Force term value','FontName',script.nomeF,'FontSize',script.size_font1)
xlim([0 250])
% set(gca,'xtick',[0.52 0.54 0.56 0.58])
ylim([0.00000001 0.06])
annotation(fig_roi,'textbox',...
    [0.001 0.92 0.057 0.078],...
    'String',{'c'},...
    'FontSize',script.size_font2+7,...
    'EdgeColor',[1 1 1]);

% save
fnome = [caminho,'Figures',filesep,'Fig_all_ITF'];
print(script.imgformat,script.resol,fnome)

%%
disp('done ...')
