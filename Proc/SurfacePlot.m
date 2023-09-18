%% Input

% D. Henriques, J. Xavier, G. Andrade-Campos, 2020

clear; clc; close all

global contNOS nodeCoordinates elementNodes

d2f = struct;
script = struct;

% USER ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
% Xavier:
caminho = 'C:\Users\joaod\OneDrive\Ambiente de Trabalho\Doutoramento\Artigo Cientifico\Codigo Matlab\ANSYS\Compression\';
angle = 'A00';
projeto = 'A00_10';
nomedoc = projeto;
Parameter_to_Analyze = 'Q11'; %Q11, Q12, Q22, Q66, Q11EW_Q12EW
% -
filenome2 = [caminho,angle,filesep,projeto,filesep,'Sensivity Analysis',filesep,Parameter_to_Analyze,filesep,projeto,'_Parameters','.mat'];
load(filenome2,'materialTipo','FEM_as_DIC','DIC_Software','tipoBC')

switch materialTipo
     case 'homog' 
        disp('Using homogeneous material')
     case 'heter'  
        disp('Using heterogeneous material')   
end

switch tipoBC
     case 'teorico' 
        disp('Warning: Using theorical boundary conditions')
     case 'experimental'  
        disp('Warning: Using experimental boundary conditions')   
end

switch DIC_Software
     case 'MatchID' 
        disp('Using MatchID data')
     case 'Aramis2D'  
        disp('Using Aramis2D data')   
end

switch FEM_as_DIC
     case 'yes' 
        disp('Warning: Using FEM data as DIC data...')
     case 'no'  
        disp('Using DIC data...')   
end     

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
script.colormap   = 'hot'; % 'hot'; 'bone'

%% Material parameters - reference values

initialPropertiesEWLW

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


%% Importing Simulation Data
filenome = [caminho,angle,filesep,projeto,filesep,'Sensivity Analysis',filesep,Parameter_to_Analyze,filesep,projeto,'_SensivityAnalysisMatrixes','.mat'];
caminho2 = [caminho,angle,filesep,projeto,filesep,'Sensivity Analysis',filesep,Parameter_to_Analyze,filesep,'figures'];

switch Parameter_to_Analyze
    case 'Q11'

    load(filenome,'Q11_EW_Points','Q11_LW_Points','Z1','Z2','Z3');

% Plotting Data Points Mesh
figure('color',[1 1 1]);
plot(Q11_EW_Points,Q11_LW_Points,'r*'); hold on
plot(ones(length(Q11_EW_Points),1)*Q11_EW,linspace(min(Q11_LW_Points(:)),max(Q11_LW_Points(:)),length(Q11_EW_Points)),'--','linewidth',2,'color',[0 0 0]);hold on
plot(linspace(min(Q11_EW_Points(:)),max(Q11_EW_Points(:)),length(Q11_LW_Points)),ones(length(Q11_LW_Points),1)*Q11_LW,'--','linewidth',2,'color',[0 0 1]);
title('Q11 LW and Q11 EW Mesh')
LH(1) = plot(nan,nan,'r*');
LH(2) = plot(nan,nan,'--','linewidth',2,'color',[0 0 0]);
LH(3) = plot(nan,nan,'--','linewidth',2,'color',[0 0 1]);
L{1} = 'Mesh points';
L{2} = 'Q11 EW reference value';
L{3} = 'Q11 LW reference value';
legend(LH,L);
xlabel('Q11 EW [MPa]')  
ylabel('Q11 LW [MPa]')
print([caminho2,filesep,Parameter_to_Analyze,'Data Mesh'],'-djpeg','-r300')
hold off

% OF1 Surface Plot
figure(2)
Z1_Surface = surf(Q11_EW_Points,Q11_LW_Points,Z1,'facealpha',0.7,'EdgeColor','flat');
xlabel('Q11 EW Values');
ylabel('Q11 LW Values');
zlabel('OF1 Values');
title('OF1 Surface Plot')
colorbar;
print([caminho2,filesep,'OF1SurfacePlot'],'-djpeg','-r300')


% IT1 Surface Plot
figure(3)
Z2_Surface = surf(Q11_EW_Points,Q11_LW_Points,Z2,'facealpha',0.5,'EdgeColor','flat');
xlabel('Q11 EW Values');
ylabel('Q11 LW Values');
zlabel('IT1 Values');
title('IT1 Surface Plot')
colorbar;
print([caminho2,filesep,'IT1SurfacePlot'],'-djpeg','-r300')

% IT_F Surface Plot
figure(4)
Z3_Surface = surf(Q11_EW_Points,Q11_LW_Points,Z3,'facealpha',0.5,'EdgeColor','flat');
xlabel('Q11 EW Values');
ylabel('Q11 LW Values');
zlabel('ITF Values');
title('ITF Surface Plot')
colorbar;
print([caminho2,filesep,'ITFSurfacePlot'],'-djpeg','-r300')

%------- Log scale (Z)----------------

% OF1 Surface Plot
figure(5)
h=gca;
Z1_Surface_Log = surf(Q11_EW_Points,Q11_LW_Points,Z1+10^-30,'facealpha',0.5,'EdgeColor','flat');
xlabel('Q11 EW Values');
ylabel('Q11 LW Values');
zlabel('OF1 Values - Log scale');
title('OF1 Surface Plot - Log Scale');
set(h,'zscale','log');
colorbar;
print([caminho2,filesep,'OF1SurfacePlot_Log'],'-djpeg','-r300')

% IT1 Surface Plot
figure(6)
h=gca;
Z2_Surface_Log = surf(Q11_EW_Points,Q11_LW_Points,Z2+10^-30,'facealpha',0.5,'EdgeColor','flat');
xlabel('Q11 EW Values');
ylabel('Q11 LW Values');
zlabel('IT1 Values - Log Scale');
title('IT1 Surface Plot - Log Scale')
set(h,'zscale','log');
colorbar;
print([caminho2,filesep,'IT1SurfacePlot_Log'],'-djpeg','-r300')

% IT_F Surface Plot
figure(7)
h=gca;
Z3_Surface_Log = surf(Q11_EW_Points,Q11_LW_Points,Z3+10^-30,'facealpha',0.5,'EdgeColor','flat');
xlabel('Q11 EW Values');
ylabel('Q11 LW Values');
zlabel('ITF Values - Log Scale');
title('ITF Surface Plot - Log Scale')
set(h,'zscale','log');
colorbar;
print([caminho2,filesep,'ITFSurfacePlot_Log'],'-djpeg','-r300')


    case 'Q12'

    load(filenome,'Q12_EW_Points','Q12_LW_Points','Z1','Z2','Z3');
    
    % Plotting Data Points Mesh
figure('color',[1 1 1]);
plot(Q12_EW_Points,Q12_LW_Points,'r*'); hold on
plot(ones(length(Q12_EW_Points),1)*Q12_EW,linspace(500,1500,length(Q12_EW_Points)),'--','linewidth',2,'color',[0 0 0]);hold on
plot(linspace(10,500,length(Q12_LW_Points)),ones(length(Q12_LW_Points),1)*Q12_LW,'--','linewidth',2,'color',[0 0 1]);
title('Q12 LW and Q12 EW Mesh')
LH(1) = plot(nan,nan,'r*');
LH(2) = plot(nan,nan,'--','linewidth',2,'color',[0 0 0]);
LH(3) = plot(nan,nan,'--','linewidth',2,'color',[0 0 1]);
L{1} = 'Mesh points';
L{2} = 'Q12 EW reference value';
L{3} = 'Q12 LW reference value';
legend(LH,L);
xlabel('Q12 EW [MPa]')  
ylabel('Q12 LW [MPa]')
print([caminho2,filesep,Parameter_to_Analyze,'Data Mesh'],'-djpeg','-r300')
hold off


% OF1 Surface Plot
figure(2)
Z1_Surface = surf(Q12_EW_Points,Q12_LW_Points,Z1,'facealpha',0.7,'EdgeColor','flat');
xlabel('Q12 EW Values');
ylabel('Q12 LW Values');
zlabel('OF1 Values');
title('OF1 Surface Plot')
colorbar;
print([caminho2,filesep,'OF1SurfacePlot'],'-djpeg','-r300')

% OF1 Surface Plot Z limited
figure(3)
Z1_SurfaceZlimited = surf(Q12_EW_Points,Q12_LW_Points,Z1,'facealpha',0.7,'EdgeColor','flat');
xlabel('Q12 EW Values');
ylabel('Q12 LW Values');
zlabel('OF1 Values');
zlim([0 1.5])
title('OF1 Surface Plot')
colorbar;
print([caminho2,filesep,'OF1SurfacePlotZlimited'],'-djpeg','-r300')

% IT1 Surface Plot
figure(4)
Z2_Surface = surf(Q12_EW_Points,Q12_LW_Points,Z2,'facealpha',0.5,'EdgeColor','flat');
xlabel('Q12 EW Values');
ylabel('Q12 LW Values');
zlabel('IT1 Values');
title('IT1 Surface Plot')
colorbar;
print([caminho2,filesep,'IT1SurfacePlot'],'-djpeg','-r300')

% IT1 Surface Plot Z limited
figure(5)
Z2_SurfaceZlimited = surf(Q12_EW_Points,Q12_LW_Points,Z2,'facealpha',0.5,'EdgeColor','flat');
xlabel('Q12 EW Values');
ylabel('Q12 LW Values');
zlabel('IT1 Values');
zlim([0 1.5])
title('IT1 Surface Plot')
colorbar;
print([caminho2,filesep,'IT1SurfacePlotZlimited'],'-djpeg','-r300')

% IT_F Surface Plot
figure(6)
Z3_Surface = surf(Q12_EW_Points,Q12_LW_Points,Z3,'facealpha',0.5,'EdgeColor','flat');
xlabel('Q12 EW Values');
ylabel('Q12 LW Values');
zlabel('ITF Values');
title('ITF Surface Plot')
colorbar;
print([caminho2,filesep,'ITFSurfacePlot'],'-djpeg','-r300')

% IT_F Surface Plot Z limited
figure(7)
Z3_SurfaceZlimited = surf(Q12_EW_Points,Q12_LW_Points,Z3,'facealpha',0.5,'EdgeColor','flat');
xlabel('Q12 EW Values');
ylabel('Q12 LW Values');
zlabel('ITF Values');
zlim([0 1.5])
title('ITF Surface Plot')
colorbar;
print([caminho2,filesep,'ITFSurfacePlotZlimited'],'-djpeg','-r300')

%------- Log scale (Z)----------------

% OF1 Surface Plot
figure(8)
h=gca;
Z1_Surface_Log = surf(Q12_EW_Points,Q12_LW_Points,Z1,'facealpha',0.5,'EdgeColor','flat');
xlabel('Q12 EW Values');
ylabel('Q12 LW Values');
zlabel('OF1 Values - Log scale');
title('OF1 Surface Plot - Log Scale');
set(h,'zscale','log');
colorbar;
print([caminho2,filesep,'OF1SurfacePlot_Log'],'-djpeg','-r300')

% IT1 Surface Plot
figure(9)
h=gca;
Z2_Surface_Log = surf(Q12_EW_Points,Q12_LW_Points,Z2,'facealpha',0.5,'EdgeColor','flat');
xlabel('Q12 EW Values');
ylabel('Q12 LW Values');
zlabel('IT1 Values - Log Scale');
title('IT1 Surface Plot - Log Scale')
set(h,'zscale','log');
colorbar;
print([caminho2,filesep,'IT1SurfacePlot_Log'],'-djpeg','-r300')

% IT_F Surface Plot
figure(10)
h=gca;
Z3_Surface_Log = surf(Q12_EW_Points,Q12_LW_Points,Z3,'facealpha',0.5,'EdgeColor','flat');
xlabel('Q12 EW Values');
ylabel('Q12 LW Values');
zlabel('ITF Values - Log Scale');
title('ITF Surface Plot - Log Scale')
set(h,'zscale','log');
colorbar;
print([caminho2,filesep,'ITFSurfacePlot_Log'],'-djpeg','-r300')


    case 'Q22'

    load(filenome,'Q22_EW_Points','Q22_LW_Points','Z1','Z2','Z3');

    
    % Plotting Data Points Mesh
figure('color',[1 1 1]);
plot(Q22_EW_Points,Q22_LW_Points,'r*'); hold on
plot(ones(length(Q22_EW_Points),1)*Q22_EW,linspace(900,2400,length(Q22_EW_Points)),'--','linewidth',2,'color',[0 0 0]);hold on
plot(linspace(5,500,length(Q22_LW_Points)),ones(length(Q22_LW_Points),1)*Q22_LW,'--','linewidth',2,'color',[0 0 1]);
title('Q22 LW and Q22 EW Mesh')
LH(1) = plot(nan,nan,'r*');
LH(2) = plot(nan,nan,'--','linewidth',2,'color',[0 0 0]);
LH(3) = plot(nan,nan,'--','linewidth',2,'color',[0 0 1]);
L{1} = 'Mesh points';
L{2} = 'Q22 EW reference value';
L{3} = 'Q22 LW reference value';
legend(LH,L);
xlabel('Q22 EW [MPa]')  
ylabel('Q22 LW [MPa]')
print([caminho2,filesep,Parameter_to_Analyze,'Data Mesh'],'-djpeg','-r300')
hold off


% OF1 Surface Plot
figure(2)
Z1_Surface = surf(Q22_EW_Points,Q22_LW_Points,Z1,'facealpha',0.7,'EdgeColor','flat');
xlabel('Q22 EW Values');
ylabel('Q22 LW Values');
zlabel('OF1 Values');
title('OF1 Surface Plot')
colorbar;
print([caminho2,filesep,'OF1SurfacePlot'],'-djpeg','-r300')

% OF1 Surface Plot Z limited
figure(3)
Z1_SurfaceZlimited = surf(Q22_EW_Points,Q22_LW_Points,Z1,'facealpha',0.7,'EdgeColor','flat');
xlabel('Q22 EW Values');
ylabel('Q22 LW Values');
zlabel('OF1 Values');
zlim([0 1])
title('OF1 Surface Plot')
colorbar;
print([caminho2,filesep,'OF1SurfacePlotZlimited'],'-djpeg','-r300')

% IT1 Surface Plot
figure(4)
Z2_Surface = surf(Q22_EW_Points,Q22_LW_Points,Z2,'facealpha',0.5,'EdgeColor','flat');
xlabel('Q22 EW Values');
ylabel('Q22 LW Values');
zlabel('IT1 Values');
title('IT1 Surface Plot')
colorbar;
print([caminho2,filesep,'IT1SurfacePlot'],'-djpeg','-r300')

% IT1 Surface Plot Z limited
figure(5)
Z2_SurfaceZlimited = surf(Q22_EW_Points,Q22_LW_Points,Z2,'facealpha',0.5,'EdgeColor','flat');
xlabel('Q22 EW Values');
ylabel('Q22 LW Values');
zlabel('IT1 Values');
zlim([0 1])
title('IT1 Surface Plot')
colorbar;
print([caminho2,filesep,'IT1SurfacePlotZlimited'],'-djpeg','-r300')

% IT_F Surface Plot
figure(6)
Z3_Surface = surf(Q22_EW_Points,Q22_LW_Points,Z3,'facealpha',0.5,'EdgeColor','flat');
xlabel('Q22 EW Values');
ylabel('Q22 LW Values');
zlabel('ITF Values');
title('ITF Surface Plot')
colorbar;
print([caminho2,filesep,'ITFSurfacePlot'],'-djpeg','-r300')  
    
% IT_F Surface Plot Z limited
figure(7)
Z3_SurfaceZlimited = surf(Q22_EW_Points,Q22_LW_Points,Z3,'facealpha',0.5,'EdgeColor','flat');
xlabel('Q22 EW Values');
ylabel('Q22 LW Values');
zlabel('ITF Values');
zlim([0 1])
title('ITF Surface Plot')
colorbar;
print([caminho2,filesep,'ITFSurfacePlotZlimited'],'-djpeg','-r300')  

%------- Log scale (Z)----------------

% OF1 Surface Plot
figure(8)
h=gca;
Z1_Surface_Log = surf(Q22_EW_Points,Q22_LW_Points,Z1,'facealpha',0.5,'EdgeColor','flat');
xlabel('Q22 EW Values');
ylabel('Q22 LW Values');
zlabel('OF1 Values - Log scale');
title('OF1 Surface Plot - Log Scale');
set(h,'zscale','log');
colorbar;
print([caminho2,filesep,'OF1SurfacePlot_Log'],'-djpeg','-r300')  

% IT1 Surface Plot
figure(9)
h=gca;
Z2_Surface_Log = surf(Q22_EW_Points,Q22_LW_Points,Z2,'facealpha',0.5,'EdgeColor','flat');
xlabel('Q22 EW Values');
ylabel('Q22 LW Values');
zlabel('IT1 Values - Log Scale');
title('IT1 Surface Plot - Log Scale')
set(h,'zscale','log');
colorbar;
print([caminho2,filesep,'IT1SurfacePlot_Log'],'-djpeg','-r300')  

% IT_F Surface Plot
figure(10)
h=gca;
Z3_Surface_Log = surf(Q22_EW_Points,Q22_LW_Points,Z3,'facealpha',0.5,'EdgeColor','flat');
xlabel('Q22 EW Values');
ylabel('Q22 LW Values');
zlabel('ITF Values - Log Scale');
title('ITF Surface Plot - Log Scale')
set(h,'zscale','log');
colorbar;
print([caminho2,filesep,'ITFSurfacePlot_Log'],'-djpeg','-r300')  


    case 'Q66'

    load(filenome,'Q66_EW_Points','Q66_LW_Points','Z1','Z2','Z3');
    
    % Plotting Data Points Mesh
figure('color',[1 1 1]);
plot(Q66_EW_Points,Q66_LW_Points,'r*'); hold on
plot(ones(length(Q66_EW_Points),1)*Q66_EW,linspace(5,500,length(Q66_EW_Points)),'--','linewidth',2,'color',[0 0 0]);hold on
plot(linspace(5,150,length(Q66_LW_Points)),ones(length(Q66_LW_Points),1)*Q66_LW,'--','linewidth',2,'color',[0 0 1]);
title('Q66 LW and Q66 EW Mesh')
LH(1) = plot(nan,nan,'r*');
LH(2) = plot(nan,nan,'--','linewidth',2,'color',[0 0 0]);
LH(3) = plot(nan,nan,'--','linewidth',2,'color',[0 0 1]);
L{1} = 'Mesh points';
L{2} = 'Q66 EW reference value';
L{3} = 'Q66 LW reference value';
legend(LH,L);
xlabel('Q66 EW [MPa]')  
ylabel('Q66 LW [MPa]')
print([caminho2,filesep,Parameter_to_Analyze,'Data Mesh'],'-djpeg','-r300')
hold off


% OF1 Surface Plot
figure(2)
Z1_Surface = surf(Q66_EW_Points,Q66_LW_Points,Z1,'facealpha',0.7,'EdgeColor','flat');
xlabel('Q66 EW Values');
ylabel('Q66 LW Values');
zlabel('OF1 Values');
title('OF1 Surface Plot')
colorbar;
print([caminho2,filesep,'OF1SurfacePlot'],'-djpeg','-r300')  

% IT1 Surface Plot
figure(3)
Z2_Surface = surf(Q66_EW_Points,Q66_LW_Points,Z2,'facealpha',0.5,'EdgeColor','flat');
xlabel('Q66 EW Values');
ylabel('Q66 LW Values');
zlabel('IT1 Values');
title('IT1 Surface Plot')
colorbar;
print([caminho2,filesep,'IT1SurfacePlot'],'-djpeg','-r300')  

% IT_F Surface Plot
figure(4)
Z3_Surface = surf(Q66_EW_Points,Q66_LW_Points,Z3,'facealpha',0.5,'EdgeColor','flat');
xlabel('Q66 EW Values');
ylabel('Q66 LW Values');
zlabel('ITF Values');
title('ITF Surface Plot')
colorbar;
print([caminho2,filesep,'ITFSurfacePlot'],'-djpeg','-r300')  
    
%------- Log scale (Z)----------------

% OF1 Surface Plot
figure(5)
h=gca;
Z1_Surface_Log = surf(Q66_EW_Points,Q66_LW_Points,Z1,'facealpha',0.7,'EdgeColor','flat');
xlabel('Q66 EW Values');
ylabel('Q66 LW Values');
zlabel('OF1 Values - Log scale');
title('OF1 Surface Plot - Log Scale');
set(h,'zscale','log');
colorbar;
print([caminho2,filesep,'OF1SurfacePlot_Log'],'-djpeg','-r300')  

% IT1 Surface Plot
figure(6)
h=gca;
Z2_Surface_Log = surf(Q66_EW_Points,Q66_LW_Points,Z2,'facealpha',0.5,'EdgeColor','flat');
xlabel('Q66 EW Values');
ylabel('Q66 LW Values');
zlabel('IT1 Values - Log Scale');
title('IT1 Surface Plot - Log Scale')
set(h,'zscale','log');
colorbar;
print([caminho2,filesep,'IT1SurfacePlot_Log'],'-djpeg','-r300')  

% IT_F Surface Plot
figure(7)
h=gca;
Z3_Surface_Log = surf(Q66_EW_Points,Q66_LW_Points,Z3,'facealpha',0.5,'EdgeColor','flat');
xlabel('Q66 EW Values');
ylabel('Q66 LW Values');
zlabel('ITF Values - Log Scale');
title('ITF Surface Plot - Log Scale')
set(h,'zscale','log');
colorbar;
print([caminho2,filesep,'ITFSurfacePlot_Log'],'-djpeg','-r300')  

    case 'Q11EW_Q12EW'

    load(filenome,'Q11_EW_Points','Q12_EW_Points','Z1','Z2','Z3');
    
    % Plotting Data Points Mesh

figure('color',[1 1 1]);
plot(Q11_EW_Points,Q12_EW_Points,'r*'); hold on
plot(ones(length(Q11_EW_Points),1)*Q11_EW,linspace(min(Q12_EW_Points(:)),max(Q12_EW_Points(:)),length(Q11_EW_Points)),'--','linewidth',2,'color',[0 0 0]);hold on
plot(linspace(min(Q11_EW_Points(:)),max(Q11_EW_Points(:)),length(Q12_EW_Points)),ones(length(Q12_EW_Points),1)*Q12_EW,'--','linewidth',2,'color',[0 0 1]);
title('Q11 EW and Q12 EW Mesh')
LH(1) = plot(nan,nan,'r*');
LH(2) = plot(nan,nan,'--','linewidth',2,'color',[0 0 0]);
LH(3) = plot(nan,nan,'--','linewidth',2,'color',[0 0 1]);
L{1} = 'Mesh points';
L{2} = 'Q11 EW reference value';
L{3} = 'Q12 EW reference value';
legend(LH,L);
xlabel('Q11 EW [MPa]')  
ylabel('Q12 LW [MPa]')
hold off


% OF1 Surface Plot
figure(2)
Z1_Surface = surf(Q11_EW_Points,Q12_EW_Points,Z1,'facealpha',0.7,'EdgeColor','flat');
xlabel('Q11 EW Values');
ylabel('Q12 EW Values');
zlabel('OF1 Values');
title('OF1 Surface Plot')
colorbar;
print([caminho2,filesep,'OF1SurfacePlot'],'-djpeg','-r300')  

% IT1 Surface Plot
figure(3)
Z2_Surface = surf(Q11_EW_Points,Q12_EW_Points,Z2,'facealpha',0.5,'EdgeColor','flat');
xlabel('Q11 EW Values');
ylabel('Q12 EW Values');
zlabel('IT1 Values');
title('IT1 Surface Plot')
colorbar;
print([caminho2,filesep,'IT1SurfacePlot'],'-djpeg','-r300')  

% IT_F Surface Plot
figure(4)
Z3_Surface = surf(Q11_EW_Points,Q12_EW_Points,Z3,'facealpha',0.5,'EdgeColor','flat');
xlabel('Q11 EW Values');
ylabel('Q12 EW Values');
zlabel('ITF Values');
title('ITF Surface Plot')
colorbar;
print([caminho2,filesep,'ITFSurfacePlot'],'-djpeg','-r300')  
    
%------- Log scale (Z)----------------

% OF1 Surface Plot
figure(5)
h=gca;
Z1_Surface_Log = surf(Q11_EW_Points,Q12_EW_Points,Z1,'facealpha',0.7,'EdgeColor','flat');
xlabel('Q11 EW Values');
ylabel('Q12 EW Values');
zlabel('OF1 Values - Log scale');
title('OF1 Surface Plot - Log Scale');
set(h,'zscale','log');
colorbar;
print([caminho2,filesep,'OF1SurfacePlot_Log'],'-djpeg','-r300')  

% IT1 Surface Plot
figure(6)
h=gca;
Z2_Surface_Log = surf(Q11_EW_Points,Q12_EW_Points,Z2,'facealpha',0.5,'EdgeColor','flat');
xlabel('Q11 EW Values');
ylabel('Q12 EW Values');
zlabel('IT1 Values - Log Scale');
title('IT1 Surface Plot - Log Scale')
set(h,'zscale','log');
colorbar;
print([caminho2,filesep,'IT1SurfacePlot_Log'],'-djpeg','-r300')  

% IT_F Surface Plot
figure(7)
h=gca;
Z3_Surface_Log = surf(Q11_EW_Points,Q12_EW_Points,Z3,'facealpha',0.5,'EdgeColor','flat');
xlabel('Q11 EW Values');
ylabel('Q12 EW Values');
zlabel('ITF Values - Log Scale');
title('ITF Surface Plot - Log Scale')
set(h,'zscale','log');
colorbar;
print([caminho2,filesep,'ITFSurfacePlot_Log'],'-djpeg','-r300')  

end



