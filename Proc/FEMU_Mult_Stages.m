%% Input

% D. Henriques, J. Xavier, G. Andrade-Campos, 2021

clear; clc; close all

% USER ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
% Diogo:
caminho = 'C:\Users\joaod\OneDrive\Ambiente de Trabalho\Doutoramento\Artigo Cientifico\Codigo Matlab\ANSYS\Compression\';
angle = 'A00';
projeto = 'A00_02';
Interp_M = 'BC_Raw'; % BC_Raw; %BC_Smoothed

materialTipo = 'homog';     % 'homog', 'heter' (initialPropertiesEWLW.m)
n_stages = 2; %Number of stages to be analyzed

% Assign number of stage to be analyzed 
stage1 = 's25'; 
stage2 = 's50';
% stage3 = 's50';

%  Type of analisis, inputing Q's or E's
Analysis = 'Stiffness'; %Stiffness , Modulis

stage = stage1;

for i =2:n_stages
 eval(['s_index = stage',num2str(i),';']);
 stage = cat(1,stage,s_index);
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

%% Material parameters - initialise reference values

initialPropertiesEWLW

% Earlywood
Q11_EW = mater.E2_EW/(1-mater.CP23_EW*mater.CP32_EW);
Q12_EW = mater.E2_EW*mater.CP32_EW/(1-mater.CP23_EW*mater.CP32_EW);
Q22_EW = mater.E3_EW/(1-mater.CP23_EW*mater.CP32_EW);
Q66_EW = mater.G23_EW;

% LateWood
Q11_LW = mater.E2_LW/(1-mater.CP23_LW*mater.CP32_LW);
Q12_LW = mater.E2_LW*mater.CP32_LW/(1-mater.CP23_LW*mater.CP32_LW);
Q22_LW = mater.E3_LW/(1-mater.CP23_LW*mater.CP32_LW);
Q66_LW = mater.G23_LW;

nomeFic = [caminho,angle,filesep,projeto,filesep,'FEMU_Mult_Stages',filesep,...
             materialTipo,filesep,projeto,'_input_FEMi'];
fid  = fopen([nomeFic,script.dat],'w');
fprintf(fid,' [ER_EW, ET_EW, vTR_EW, GRT_EW, ER_LW, ET_LW, vTR_LW, GRT_LW]  O.F.1 \n');
fprintf(fid,'%12.2f %12.2f %12.2f %12.2f %12.2f %12.2f %12.2f %12.2f \n', ...
    mater.E2_EW, mater.E3_EW, mater.CP32_EW, mater.G23_EW,...
    mater.E2_LW, mater.E3_LW, mater.CP32_LW, mater.G23_LW);
fprintf(fid,' [Q11_EW, Q12_EW, Q22_EW, Q66_EW, Q11_LW, Q12_LW, Q22_LW, Q66_LW]  O.F.1 \n');
fprintf(fid,'%12.2f %12.2f %12.2f %12.2f %12.2f %12.2f %12.2f %12.2f \n',...
    Q11_EW, Q12_EW, Q22_EW, Q66_EW, Q11_LW, Q12_LW, Q22_LW, Q66_LW);
fclose(fid);
    
save([nomeFic,script.mat],'mater','Q11_EW', 'Q12_EW', 'Q22_EW', 'Q66_EW',...
    'Q11_LW', 'Q12_LW', 'Q22_LW', 'Q66_LW')


%% Material identification by FEMU

tic

switch Analysis
  case 'Modulis' 
                
        switch materialTipo

            case 'heter' 
            
LB = [0, 0, 0, 0, 0, 0, 0, 0];
UB  = [10^5, 10^5, 2.5, 10^4, 10^5, 10^5, 2, 10^4];

Starting  = 2*rand*[mater.E2_EW, mater.E3_EW, mater.CP23_EW, mater.G23_EW,...
                    mater.E2_LW, mater.E3_LW, mater.CP23_LW, mater.G23_LW];

% Starting  = [mater.E2_EW, mater.E3_EW, mater.CP23_EW, mater.G23_EW,...
%              mater.E2_LW, mater.E3_LW, mater.CP23_LW, mater.G23_LW];

    
            case 'homog' % valores de referencia
        
LB = [0, 0, 0, 0];
UB  = [10^5, 10^5, 2.5 10^4];  

Starting  = 3*rand*[mater.E2_EW, mater.E3_EW, mater.CP23_EW, mater.G23_EW];

        end

case 'Stiffness' % valores de referencia
      
    switch materialTipo

        case 'heter' % valores de referencia
            
LB = [1, 1, 1, 1, 1, 1, 1, 1];
UB  = [10^5, 10^4, 10^4, 10^4, 10^5, 10^4, 10^4, 10^4];

% Starting  = 3*rand*[Q11_EW, Q12_EW, Q22_EW, Q66_EW, Q11_LW, Q12_LW, Q22_LW, Q66_LW];
Starting  = [Q11_EW, Q12_EW, Q22_EW, Q66_EW, Q11_LW, Q12_LW, Q22_LW, Q66_LW]; 

        case 'homog' % valores de referencia
        
           
LB = [1, 1, 1, 1];
UB  = [1, 1, 1, 1]*10^5;  

% Starting  = 3*rand*[Q11_EW, Q12_EW, Q22_EW, Q66_EW];
Starting  = 2.*[Q11_EW, Q12_EW, Q22_EW, Q66_EW];
% Starting  = [1, 2, 0.8, 1.2].*[Q11_EW, Q12_EW, Q22_EW, Q66_EW];
    end
end

% Estimates will be a vector containing parameter estimates for the original data set
%Starting = fminsearch(@hypTan,Starting,options,Xf,Yf);
% MaxFunEvals: Maximum number of function evaluations allowed, a positive integer.
% MaxIter: Maximum number of iterations allowed, a positive integer. 
% TolFun: Termination tolerance on the function value, a positive scalar. The default is 1e-4. 
% TolX: Termination tolerance on x, a positive scalar. The default value is 1e-4.
% PlotFcns: Plots various measures of progress while the algorithm executes
% @optimplotx plots the current point.
% @optimplotfunccount plots the function count.
% @optimplotfval plots the function value.
% FunValCheck: Check whether objective function values are valid.
options = optimset('Display','iter', ... 
                   'MaxFunEvals',1e4, ... 
                   'MaxIter',1e4, ... 
                   'TolFun', 1e-15, ... 
                   'TolX', 1e-15, ... 
                   'FunValCheck', 'on', ... 
                   'PlotFcns',@optimplotfval); 

analiseOF = '1';
switch analiseOF
    case '1' % Fminsearch
        %%%% OF1:
        rotulo     = 'OF1_Mult_Stages';
        nomeFic    = [caminho,angle,filesep,projeto,filesep,'FEMU_Mult_Stages',filesep,...
            materialTipo,filesep,projeto,'_res_OF1',script.dat];
        nomeFic2 = [caminho,angle,filesep,projeto,filesep,'FEMU_Mult_Stages',filesep,...
            materialTipo,filesep,projeto,'_MatFEMU_OF1.dat'];
        fid        = fopen(nomeFic,'w');
        fid2       = fopen(nomeFic2,'w');
    switch materialTipo
        case 'heter' % valores de referencia
        fprintf(fid,' [Q11_EW, Q12_EW, Q22_EW, Q66_EW, Q11_LW, Q12_LW, Q22_LW, Q66_LW]  O.F.1  IT_1 IT_Force Force_Exp Force_FEMU \n');
        fprintf(fid2,' [ER_EW, ET_EW, CPRT_EW, GRT_EW, ER_LW, ET_LW, CPRT_LW, GRT_LW]  O.F.1  IT_1 IT_Force Force_Exp Force_FEMU \n');
        case 'homog' % valores de referencia
        fprintf(fid,' [Q11, Q12, Q22, Q66]  O.F.1  IT_1 IT_Force Force_Exp Force_FEMU \n');
        fprintf(fid2,'[ER, ET, CPRT, GRT]  O.F.1  IT_1 IT_Force Force_Exp Force_FEMU \n');
    end
        % evaluating O.F.1
        [Starting,error1] = fminsearchbnd(@OF1_Mult_Stages,Starting,LB,UB,options,...
            nomeFic,projeto,Analysis,angle,caminho,n_stages,stage,materialTipo,nomeFic2,Interp_M);
end

for i=1:n_stages
indexing = stage(i,:);    
nomeFEM = [caminho,angle,filesep,projeto,filesep,'FEMU_Mult_Stages',filesep,...
             materialTipo,filesep,indexing,filesep,Interp_M,filesep,projeto,'_infoFEMU','.mat'];
load(nomeFEM,'xdicline','ydicline','uxdic','uydic','epsXdic','epsYdic','epsSdic');

nomeFEM2 = [caminho,angle,filesep,projeto,filesep,'FEMU_Mult_Stages',filesep,...
    materialTipo,filesep,indexing,filesep,Interp_M,filesep,projeto,'_FemuRes',script.mat];
load(nomeFEM2,'uxdic_max','uydic_max','epsXdic_max','epsYdic_max','epsSdic_max',...
    'UXfem2dic','UYfem2dic','epsXXfem2dic','epsYYfem2dic','epsXYfem2dic');



min_UX=min(uxdic(:));
max_UX=max(uxdic(:));
fig = figure();
 axes('Position',[0.05 0.5 0.5 0.5],'Parent',fig);
 imagesc(xdicline,ydicline,uxdic, [min_UX max_UX]); 
 axis equal tight off; colorbar; 
 colormap(hot); title('UX - DIC')
 axes('Position',[0.05 0.05 0.5 0.5],'Parent',fig);
 imagesc(xdicline,ydicline,UXfem2dic, [min_UX max_UX]); 
axis equal tight off; colorbar; 
colormap(hot); title('UX - FEMU')
% -
 residUX = ((uxdic-UXfem2dic)./uxdic_max)*100;
 axes('Position',[0.6 0.05 0.4 0.4],'Parent',fig);
 imagesc(residUX); axis equal tight off; colorbar; 
 colormap(hot); title('dif. (%)')
finemone = [caminho,angle,filesep,projeto,filesep,projeto,'_FEMU_UX'];
print(script.imgformat,script.resol,finemone)
crop([finemone,script.filetype2])
 

 %----------
min_UY=min(uydic(:));
max_UY=max(uydic(:));
fig = figure();
 axes('Position',[0.05 0.5 0.5 0.5],'Parent',fig);
 imagesc(xdicline,ydicline,uydic, [min_UY max_UY]); 
 axis equal tight off; colorbar; 
 colormap(hot); title('UY - DIC')
 axes('Position',[0.05 0.05 0.5 0.5],'Parent',fig);
 imagesc(xdicline,ydicline,UYfem2dic, [min_UY max_UY]); 
axis equal tight off; colorbar; 
colormap(hot); title('UY - FEMU')
% -
 residUY = ((uydic-UYfem2dic)./uydic_max)*100;
 axes('Position',[0.6 0.05 0.4 0.4],'Parent',fig);
 imagesc(residUY); axis equal tight off; colorbar; 
 colormap(hot); title('dif. (%)')
finemone = [caminho,angle,filesep,projeto,filesep,projeto,'_FEMU_UY'];
print(script.imgformat,script.resol,finemone)
crop([finemone,script.filetype2])  

%--------------  
min_epsX=min(epsXdic(:));
max_epsX=max(epsXdic(:));
fig = figure();
 axes('Position',[0.05 0.5 0.5 0.5],'Parent',fig);
 imagesc(xdicline,ydicline,epsXdic, [min_epsX max_epsX]); 
 axis equal tight off; colorbar; 
 colormap(hot); title('epsX - Reference')
 axes('Position',[0.05 0.05 0.5 0.5],'Parent',fig);
 imagesc(xdicline,ydicline,epsXXfem2dic, [min_epsX max_epsX]); 
axis equal tight off; colorbar; 
colormap(hot); title('epsX - FEMU')
% -
residepsX = ((epsXdic-epsXXfem2dic)./epsXdic_max)*100;
 axes('Position',[0.6 0.05 0.4 0.4],'Parent',fig);
 imagesc(residepsX); axis equal tight off; colorbar; 
 colormap(hot); title('dif. (%)')
finemone = [caminho,angle,filesep,projeto,filesep,projeto,'_FEMU_epsX'];
print(script.imgformat,script.resol,finemone)
crop([finemone,script.filetype2])  

%--------------  
 
min_epsY=min(epsYdic(:));
max_epsY=max(epsYdic(:));
fig = figure();
 axes('Position',[0.05 0.5 0.5 0.5],'Parent',fig);
 imagesc(xdicline,ydicline,epsYdic, [min_epsY max_epsY]); 
 axis equal tight off; colorbar; 
 colormap(hot); title('epsY - DIC')
 axes('Position',[0.05 0.05 0.5 0.5],'Parent',fig);
 imagesc(xdicline,ydicline,epsYYfem2dic, [min_epsY max_epsY]); 
axis equal tight off; colorbar; 
colormap(hot); title('epsY - FEMU')
% -
residepsY = ((epsYdic-epsYYfem2dic)./epsYdic_max)*100;
axes('Position',[0.6 0.05 0.4 0.4],'Parent',fig);
imagesc(residepsY); axis equal tight off; colorbar; 
colormap(hot); title('dif. (%)')
finemone = [caminho,angle,filesep,projeto,filesep,projeto,'_FEMU_epsY'];
print(script.imgformat,script.resol,finemone)
crop([finemone,script.filetype2])  

%-------------- 

min_epsS=min(epsSdic(:));
max_epsS=max(epsSdic(:));
fig = figure();
 axes('Position',[0.05 0.5 0.5 0.5],'Parent',fig);
 imagesc(xdicline,ydicline,epsSdic, [min_epsS max_epsS]); 
 axis equal tight off; colorbar; 
 colormap(hot); title('epsS - DIC')
 axes('Position',[0.05 0.05 0.5 0.5],'Parent',fig);
 imagesc(xdicline,ydicline,epsXYfem2dic, [min_epsS max_epsS]); 
axis equal tight off; colorbar; 
colormap(hot); title('epsS - FEMU')
% -
residepsS = ((epsSdic-epsXYfem2dic)./epsSdic_max)*100;
axes('Position',[0.6 0.05 0.4 0.4],'Parent',fig);
imagesc(residepsS); axis equal tight off; colorbar; 
colormap(hot); title('dif. (%)')
finemone = [caminho,angle,filesep,projeto,filesep,projeto,'_FEMU_epsS'];
print(script.imgformat,script.resol,finemone)
crop([finemone,script.filetype2])  

%--------------  

end
