%% Input

% D. Henriques, J. Xavier, G. Andrade-Campos, 2021

clear; clc; close all

tic
d2f = struct;
script = struct;

% USER ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
% Xavier:

caminho = 'C:\Users\joaod\OneDrive\Ambiente de Trabalho\Doutoramento\Artigo Cientifico\Codigo Matlab\ANSYS\Compression\';
angle = 'A00';
projeto = 'A00_10';
nomedoc = projeto;
caminho2 = [caminho,angle,filesep,projeto,'\ANSYS\'];
caminhoMAT=[caminho,'Proc\'];
% -
Analysis = 'Stiffness'; %Stiffness , Modulis
Parameter_to_Analyze = 'User_defined'; %Q11 , Q12, Q22, Q66, User_defined
nomeFEM = [caminho,angle,filesep,projeto,filesep,projeto,'_infoFEMU','.mat'];
load(nomeFEM,'materialTipo','FEM_as_DIC','DIC_Software','tipoBC')

% NOTE! CODE NOT READY FOR HOMOGENEOUS MATERIAL

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

switch Analysis
  case 'Stiffness' 

switch Parameter_to_Analyze
     case 'Q11' 
        disp('Analyzing Q11 parameter')
      
% Earlywood

%------Q11----------

Q11_EWref = mater.E2_EW/(1-mater.CP23_EW*mater.CP32_EW);

aux_a1 = linspace(500,Q11_EWref-150,45)';
aux_a2 = linspace(Q11_EWref-150,Q11_EWref,75)';
aux_a3 = linspace(Q11_EWref,Q11_EWref+150,75)';
aux_a4 = linspace(Q11_EWref+150,1200,45)';

Q11_EW_Points = unique(cat(1,aux_a1,aux_a2,aux_a3,aux_a4));


%------Q12----------

Q12_EW = mater.E2_EW*mater.CP32_EW/(1-mater.CP23_EW*mater.CP32_EW);


%------Q22----------

Q22_EW = mater.E3_EW/(1-mater.CP23_EW*mater.CP32_EW);

%------Q66----------

Q66_EW = mater.G23_EW;


% LateWood

%------Q11----------

Q11_LWref = mater.E2_LW/(1-mater.CP23_LW*mater.CP32_LW);

aux_b1 = linspace(1500,Q11_LWref-400,45)';
aux_b2 = linspace(Q11_LWref-400,Q11_LWref,75)';
aux_b3 = linspace(Q11_LWref,Q11_LWref+400,75)';
aux_b4 = linspace(Q11_LWref+400,3300,45)';

Q11_LW_Points = flipud(unique(cat(1,aux_b1,aux_b2,aux_b3,aux_b4)));

%------------------------------------------------------------
% Q11_LWref = mater.E2_LW/(1-mater.CP23_LW*mater.CP32_LW);
% 
% aux_b2 = linspace(Q11_LWref-400,Q11_LWref,75)';
% aux_b3 = linspace(Q11_LWref,Q11_LWref+400,75)';
% 
% Q11_LW_Points = flipud(unique(cat(1,aux_b2,aux_b3)));

%------Q12----------

Q12_LW = mater.E2_LW*mater.CP32_LW/(1-mater.CP23_LW*mater.CP32_LW);

%------Q22----------

Q22_LW = mater.E3_LW/(1-mater.CP23_LW*mater.CP32_LW);

%------Q66----------

Q66_LW = mater.G23_LW;


[Q11_EW_Points,Q11_LW_Points] = meshgrid(Q11_EW_Points,Q11_LW_Points);
                                    

% Plotting Data Points Mesh
figure('color',[1 1 1]);
plot(Q11_EW_Points,Q11_LW_Points,'r*'); hold on
plot(ones(length(Q11_EW_Points),1)*Q11_EWref,linspace(min(Q11_LW_Points(:)),max(Q11_LW_Points(:)),length(Q11_EW_Points)),'--','linewidth',2,'color',[0 0 0]);hold on
plot(linspace(min(Q11_EW_Points(:)),max(Q11_EW_Points(:)),length(Q11_LW_Points)),ones(length(Q11_LW_Points),1)*Q11_LWref,'--','linewidth',2,'color',[0 0 1]);
title('Q11 EW and Q11 LW Mesh')
LH(1) = plot(nan,nan,'r*');
LH(2) = plot(nan,nan,'--','linewidth',2,'color',[0 0 0]);
LH(3) = plot(nan,nan,'--','linewidth',2,'color',[0 0 1]);
L{1} = 'Mesh points';
L{2} = 'Q11 EW reference value';
L{3} = 'Q11 LW reference value';
legend(LH,L);
xlabel('Q11 EW [MPa]')  
ylabel('Q11 LW [MPa]')
hold off


     case 'Q12'  
        disp('Analyzing Q12 parameter')
        
% Earlywood

%------Q11----------

Q11_EW=mater.E2_EW/(1-mater.CP23_EW*mater.CP32_EW);

%------Q12----------

Q12_EWref =  mater.E2_EW*mater.CP32_EW/(1-mater.CP23_EW*mater.CP32_EW);

aux_a1 = linspace(10,Q12_EWref-100,45)';
aux_a2 = linspace(Q12_EWref-100,Q12_EWref,75)';
aux_a3 = linspace(Q12_EWref,Q12_EWref+100,75)';
aux_a4 = linspace(Q12_EWref+100,500,45)';

Q12_EW_Points = unique(cat(1,aux_a1,aux_a2,aux_a3,aux_a4));

%------Q22----------

Q22_EW = mater.E3_EW/(1-mater.CP23_EW*mater.CP32_EW);

%------Q66----------

Q66_EW = mater.G23_EW;


% LateWood

%------Q11----------

Q11_LW = mater.E2_LW/(1-mater.CP23_LW*mater.CP32_LW);

%------Q12----------

Q12_LWref = mater.E2_LW*mater.CP32_LW/(1-mater.CP23_LW*mater.CP32_LW);

aux_b1 = linspace(500,Q12_LWref-200,45)';
aux_b2 = linspace(Q12_LWref-200,Q12_LWref,75)';
aux_b3 = linspace(Q12_LWref,Q12_LWref+200,75)';
aux_b4 = linspace(Q12_LWref+200,1500,45)';

Q12_LW_Points = flipud(unique(cat(1,aux_b1,aux_b2,aux_b3,aux_b4)));

%------Q22----------

Q22_LW = mater.E3_LW/(1-mater.CP23_LW*mater.CP32_LW);

%------Q66----------

Q66_LW = mater.G23_LW;


[Q12_EW_Points,Q12_LW_Points] = meshgrid(Q12_EW_Points,Q12_LW_Points);
                                    

% Plotting Data Points Mesh
figure('color',[1 1 1]);
plot(Q12_EW_Points,Q12_LW_Points,'r*'); hold on
plot(ones(length(Q12_EW_Points),1)*Q12_EWref,linspace(min(Q12_LW_Points(:)),max(Q12_LW_Points(:)),length(Q12_EW_Points)),'--','linewidth',2,'color',[0 0 0]);hold on
plot(linspace(min(Q12_EW_Points(:)),max(Q12_EW_Points(:)),length(Q12_LW_Points)),ones(length(Q12_LW_Points),1)*Q12_LWref,'--','linewidth',2,'color',[0 0 1]);
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
hold off
        
               
     case 'Q22' 
        disp('Analyzing Q22 parameter')
        
% Earlywood

%------Q11----------

Q11_EW=mater.E2_EW/(1-mater.CP23_EW*mater.CP32_EW);

%------Q12----------

Q12_EW = mater.E2_EW*mater.CP32_EW/(1-mater.CP23_EW*mater.CP32_EW);

%------Q22----------

Q22_EWref = mater.E3_EW/(1-mater.CP23_EW*mater.CP32_EW);

aux_a1 = linspace(5,Q22_EWref-100,45)';
aux_a2 = linspace(Q22_EWref-100,Q22_EWref,75)';
aux_a3 = linspace(Q22_EWref,Q22_EWref+100,75)';
aux_a4 = linspace(Q22_EWref+100,500,45)';

Q22_EW_Points = unique(cat(1,aux_a1,aux_a2,aux_a3,aux_a4));


%------Q66----------

Q66_EW = mater.G23_EW;


% LateWood

%------Q11----------

Q11_LW = mater.E2_LW/(1-mater.CP23_LW*mater.CP32_LW);

%------Q12----------

Q12_LW = mater.E2_LW*mater.CP32_LW/(1-mater.CP23_LW*mater.CP32_LW);

%------Q22----------

Q22_LWref = mater.E3_LW/(1-mater.CP23_LW*mater.CP32_LW);

aux_b1 = linspace(900,Q22_LWref-300,45)';
aux_b2 = linspace(Q22_LWref-300,Q22_LWref,75)';
aux_b3 = linspace(Q22_LWref,Q22_LWref+300,75)';
aux_b4 = linspace(Q22_LWref+300,2400,45)';

Q22_LW_Points = flipud(unique(cat(1,aux_b1,aux_b2,aux_b3,aux_b4)));

%------Q66----------

Q66_LW = mater.G23_LW;


[Q22_EW_Points,Q22_LW_Points] = meshgrid(Q22_EW_Points,Q22_LW_Points);
                                    

% Plotting Data Points Mesh
figure('color',[1 1 1]);
plot(Q22_EW_Points,Q22_LW_Points,'r*'); hold on
plot(ones(length(Q22_EW_Points),1)*Q22_EWref,linspace(min(Q22_LW_Points(:)),max(Q22_LW_Points(:)),length(Q22_EW_Points)),'--','linewidth',2,'color',[0 0 0]);hold on
plot(linspace(min(Q22_EW_Points(:)),max(Q22_EW_Points(:)),length(Q22_LW_Points)),ones(length(Q22_LW_Points),1)*Q22_LWref,'--','linewidth',2,'color',[0 0 1]);
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
hold off
       

     case 'Q66'  
        disp('Analyzing Q66 parameter') 
        
% Earlywood

%------Q11----------

Q11_EW=mater.E2_EW/(1-mater.CP23_EW*mater.CP32_EW);


%------Q12----------

Q12_EW = mater.E2_EW*mater.CP32_EW/(1-mater.CP23_EW*mater.CP32_EW);

%------Q22----------

Q22_EW = mater.E3_EW/(1-mater.CP23_EW*mater.CP32_EW);

%------Q66----------

Q66_EWref = mater.G23_EW;

aux_a1 = linspace(5,Q66_EWref-20,40)';
aux_a2 = linspace(Q66_EWref-20,Q66_EWref,65)';
aux_a3 = linspace(Q66_EWref,Q66_EWref+20,65)';
aux_a4 = linspace(Q66_EWref+20,150,70)';

Q66_EW_Points = unique(cat(1,aux_a1,aux_a2,aux_a3,aux_a4));


% LateWood

%------Q11----------

Q11_LW = mater.E2_LW/(1-mater.CP23_LW*mater.CP32_LW);

%------Q12----------

Q12_LW = mater.E2_LW*mater.CP32_LW/(1-mater.CP23_LW*mater.CP32_LW);

%------Q22----------

Q22_LW = mater.E3_LW/(1-mater.CP23_LW*mater.CP32_LW);

%------Q66----------

Q66_LWref = mater.G23_LW;

aux_b1 = linspace(5,Q66_LWref-65,45)';
aux_b2 = linspace(Q66_LWref-65,Q66_LWref,70)';
aux_b3 = linspace(Q66_LWref,Q66_LWref+65,70)';
aux_b4 = linspace(Q66_LWref+65,500,55)';

Q66_LW_Points = flipud(unique(cat(1,aux_b1,aux_b2,aux_b3,aux_b4)));


[Q66_EW_Points,Q66_LW_Points] = meshgrid(Q66_EW_Points,Q66_LW_Points);
                                    

% Plotting Data Points Mesh
figure('color',[1 1 1]);
plot(Q66_EW_Points,Q66_LW_Points,'r*'); hold on
plot(ones(length(Q66_EW_Points),1)*Q66_EWref,linspace(min(Q66_LW_Points(:)),max(Q66_LW_Points(:)),length(Q66_EW_Points)),'--','linewidth',2,'color',[0 0 0]);hold on
plot(linspace(min(Q66_EW_Points(:)),max(Q66_EW_Points(:)),length(Q66_LW_Points)),ones(length(Q66_LW_Points),1)*Q66_LWref,'--','linewidth',2,'color',[0 0 1]);
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
hold off
 
     case 'User_defined' 
        disp('Analyzing User defined parameters')
      
% Earlywood

%------Q11----------

Q11_EWref = mater.E2_EW/(1-mater.CP23_EW*mater.CP32_EW);

% aux_a1 = linspace(500,Q11_EWref-150,45)';
aux_a2 = linspace(Q11_EWref-150,Q11_EWref,75)';
aux_a3 = linspace(Q11_EWref,Q11_EWref+150,75)';
% aux_a4 = linspace(Q11_EWref+150,1200,45)';

Q11_EW_Points = unique(cat(1,aux_a2,aux_a3));

%------Q12----------

% Q12_EW = mater.E2_EW*mater.CP32_EW/(1-mater.CP23_EW*mater.CP32_EW);

Q12_EWref =  mater.E2_EW*mater.CP32_EW/(1-mater.CP23_EW*mater.CP32_EW);

aux_a2 = linspace(Q12_EWref-100,Q12_EWref,75)';
aux_a3 = linspace(Q12_EWref,Q12_EWref+100,75)';

Q12_EW_Points = flipud(unique(cat(1,aux_a2,aux_a3)));


%------Q22----------

Q22_EW = mater.E3_EW/(1-mater.CP23_EW*mater.CP32_EW);

%------Q66----------

Q66_EW = mater.G23_EW;


% LateWood

%------Q11----------

Q11_LW = mater.E2_LW/(1-mater.CP23_LW*mater.CP32_LW);

%------Q12----------

Q12_LW = mater.E2_LW*mater.CP32_LW/(1-mater.CP23_LW*mater.CP32_LW);

%------Q22----------

Q22_LW = mater.E3_LW/(1-mater.CP23_LW*mater.CP32_LW);

%------Q66----------

Q66_LW = mater.G23_LW;


[Q11_EW_Points,Q12_EW_Points] = meshgrid(Q11_EW_Points,Q12_EW_Points);
                                    

% Plotting Data Points Mesh
figure('color',[1 1 1]);
plot(Q11_EW_Points,Q12_EW_Points,'r*'); hold on
plot(ones(length(Q11_EW_Points),1)*Q11_EWref,linspace(min(Q12_EW_Points(:)),max(Q12_EW_Points(:)),length(Q11_EW_Points)),'--','linewidth',2,'color',[0 0 0]);hold on
plot(linspace(min(Q11_EW_Points(:)),max(Q11_EW_Points(:)),length(Q12_EW_Points)),ones(length(Q12_EW_Points),1)*Q12_EWref,'--','linewidth',2,'color',[0 0 1]);
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

end     

 case 'Modulis'
     
     
end




%Importing FEM Simulation Data
nomeFEM = [caminho,angle,filesep,projeto,filesep,projeto,'_infoFEMU',script.mat];
load(nomeFEM,'xdic','ydic','uxdic','uydic','epsXdic','epsYdic','epsSdic',...
    'nodeCoordinates','elementNodes','nnel','materialTipo','Lx','Ly','thickness','xdicline',...
    'ydicline','index_xL','index_yL','index_xR','index_yR','fReacEXP');


% max values for strain
epsXdic_vec = epsXdic(:); % transforming the epsXdic matrix to a vector
[~,absmax_epsX] = max(abs(epsXdic_vec)); % Index for the absolute maxvalue for epsX
epsXdic_max = epsXdic_vec(absmax_epsX); % Absolute max value for epsX from DIC

epsYdic_vec = epsYdic(:); % transforming the epsYdic matrix to a vector
[~,absmax_epsY] = max(abs(epsYdic_vec)); % Index for the absolute maxvalue for epsY
epsYdic_max = epsYdic_vec(absmax_epsY); % Absolute max value for epsY from DIC

epsSdic_vec = epsSdic(:); % transforming the epsSdic matrix to a vector
[~,absmax_epsS] = max(abs(epsSdic_vec)); % Index for the absolute maxvalue for epsS
epsSdic_max = epsSdic_vec(absmax_epsS); % Absolute max value for epsS from DIC

%% FEA


switch Analysis
  case 'Stiffness'

    switch Parameter_to_Analyze
     case 'Q11' 
        disp('Analyzing Q11 parameter')
        
nomeFic    = [caminho,angle,filesep,projeto,filesep,'Sensivity Analysis',filesep,projeto,'_Sensivity_Analysis',script.dat];
fid        = fopen(nomeFic,'w');
fprintf(fid,' [Q11_EW, Q11_LW] O.F.1  IT_1 IT_Force Force_ref Force_FEM \n');

for ii = 1:length(Q11_EW_Points)
    
    for j = 1:length(Q11_LW_Points)
        
    Q11_EW = Q11_EW_Points(ii,j);
    Q11_LW = Q11_LW_Points(ii,j);
    
    C_EW = [Q11_EW Q12_EW 0; Q12_EW Q22_EW 0; 0 0 Q66_EW];
    C_LW   = [Q11_LW Q12_LW 0; Q12_LW Q22_LW 0;0 0 Q66_LW];
    
    MesoFEupdating
    
     % Strain analysis
    
     epsXXfem2dic_vec = epsXXfem2dic(:);% transforming the epsXXfem2dic matrix to a vector
     aux_x = (epsXdic_vec - epsXXfem2dic_vec)./epsXdic_max; % Assembling the residue function ...
                                                           % with the gap between exp. and numerical data...
                                                           % for the epsX normalized by the max. value
                                                           
     epsYYfem2dic_vec = epsYYfem2dic(:);% transforming the psYYfem2dic matrix to a vector
     aux_y = (epsYdic_vec - epsYYfem2dic_vec)./epsYdic_max; % Assembling the residue function ...
                                                           % with the gap between exp. and numerical data...
                                                           % for the epsY normalized by the max. value
     
     epsXYfem2dic_vec = epsXYfem2dic(:);% transforming the epsXYfem2dic matrix to a vector
     aux_S = (epsSdic_vec - epsXYfem2dic_vec)./epsSdic_max; % Assembling the residue function ...
                                                            % with the gap between exp. and numerical data...
                                                            % for the epsS normalized by the max. value

     %Removing NaN entries                                                      
     aux_x = rmmissing(aux_x);       
     aux_y = rmmissing(aux_y);  
     aux_S = rmmissing(aux_S);  
     
     aux = norm(aux_x)^2 + norm(aux_y)^2 + norm(aux_S)^2; % Final residue func
     
     %Force gap
     aux_force = (fReacEXP - abs(fReacLB))/fReacEXP; %Force Gap between experimental and numerical data...
                                                     %normalized by the experimental value
     Weight_F = 0.5;
     
%    IT_1 = norm(aux); 
     IT_1 = aux/(length(aux_x)*3);                % Euclidian norm of the residue function from strain
     IT_Force = abs(aux_force);                   % Term with the force gap using a weight factor
     
     error1 = (1-Weight_F)*(IT_1^2) + Weight_F*(IT_Force^2); % Objective function using euclidian norm and a weight...
                                              %for the force gap 
    disp(['Q11_EW = ',num2str(Q11_EW),' Q11_LW = ',num2str(Q11_LW),...
    ' OF1 = ', num2str(error1),' IT_1 = ',num2str(IT_1),...
    ' IT_Force = ',num2str(IT_Force),' Force_ref = ',num2str(abs(fReacEXP)),' Force_FEM = ',num2str(abs(fReacLB))])


fid = fopen(nomeFic,'a+');
formatSpec = ['%12.4f  %12.4f %18.10e %18.10e %18.10e %12.10f %12.10f \n'];
fprintf(fid,formatSpec, Q11_EW, Q11_LW, error1, IT_1, IT_Force,abs(fReacEXP),abs(fReacLB));

status = fclose(fid);

Z1(ii,j) = error1;      % Objective Function Value
Z2(ii,j) = IT_1;        % IT_1 Value
Z3(ii,j) = IT_Force;    % IT_Force Value

    end
end

filenome = [caminho,angle,filesep,projeto,filesep,'Sensivity Analysis',filesep,projeto,'_SensivityAnalysisMatrixes','.mat'];
save(filenome,'Q11_EW_Points','Q12_EW_Points','Z1','Z2','Z3');
        

     case 'Q12'  
        disp('Analyzing Q12 parameter')
        
nomeFic    = [caminho,angle,filesep,projeto,filesep,'Sensivity Analysis',filesep,projeto,'_Sensivity_Analysis',script.dat];
fid        = fopen(nomeFic,'w');
fprintf(fid,' [Q12_EW, Q12_LW] O.F.1  IT_1 IT_Force Force_ref Force_FEM \n');

for ii = 1:length(Q12_EW_Points)
    
    for j = 1:length(Q12_LW_Points)
        
    Q12_EW = Q12_EW_Points(ii,j);
    Q12_LW = Q12_LW_Points(ii,j);
    
    C_EW = [Q11_EW Q12_EW 0; Q12_EW Q22_EW 0; 0 0 Q66_EW];
    C_LW   = [Q11_LW Q12_LW 0; Q12_LW Q22_LW 0;0 0 Q66_LW];
    
    MesoFEupdating
    
     % Strain analysis
    
     epsXXfem2dic_vec = epsXXfem2dic(:);% transforming the epsXXfem2dic matrix to a vector
     aux_x = (epsXdic_vec - epsXXfem2dic_vec)./epsXdic_max; % Assembling the residue function ...
                                                           % with the gap between exp. and numerical data...
                                                           % for the epsX normalized by the max. value
                                                           
     epsYYfem2dic_vec = epsYYfem2dic(:);% transforming the psYYfem2dic matrix to a vector
     aux_y = (epsYdic_vec - epsYYfem2dic_vec)./epsYdic_max; % Assembling the residue function ...
                                                           % with the gap between exp. and numerical data...
                                                           % for the epsY normalized by the max. value
     
     epsXYfem2dic_vec = epsXYfem2dic(:);% transforming the epsXYfem2dic matrix to a vector
     aux_S = (epsSdic_vec - epsXYfem2dic_vec)./epsSdic_max; % Assembling the residue function ...
                                                            % with the gap between exp. and numerical data...
                                                            % for the epsS normalized by the max. value

     %Removing NaN entries                                                      
     aux_x = rmmissing(aux_x);       
     aux_y = rmmissing(aux_y);  
     aux_S = rmmissing(aux_S);  
     
     aux = norm(aux_x)^2 + norm(aux_y)^2 + norm(aux_S)^2; % Final residue func
     
     %Force gap
     aux_force = (fReacEXP - abs(fReacLB))/fReacEXP; %Force Gap between experimental and numerical data...
                                                %normalized by the experimental value
     Weight_F = 0.5;
     
%    IT_1 = norm(aux); 
     IT_1 = aux/(length(aux_x)*3);                % Euclidian norm of the residue function from strain
     IT_Force = abs(aux_force);            % Term with the force gap using a weight factor
     
     error1 = (1-Weight_F)*(IT_1^2) + Weight_F*(IT_Force^2); % Objective function using euclidian norm and a weight...
                                              %for the force gap 
    disp(['Q12_EW = ',num2str(Q12_EW),' Q12_LW = ',num2str(Q11_LW),...
    ' OF1 = ', num2str(error1),' IT_1 = ',num2str(IT_1),...
    ' IT_Force = ',num2str(IT_Force),' Force_ref = ',num2str(abs(fReacEXP)),' Force_FEM = ',num2str(abs(fReacLB))])


fid = fopen(nomeFic,'a+');
formatSpec = ['%12.4f  %12.4f %18.10e %18.10e %18.10e %12.10f %12.10f \n'];
fprintf(fid,formatSpec, Q12_EW, Q12_LW, error1, IT_1, IT_Force,abs(fReacEXP),abs(fReacLB));

status = fclose(fid);

Z1(ii,j) = error1;      % Objective Function Value
Z2(ii,j) = IT_1;        % IT_1 Value
Z3(ii,j) = IT_Force;    % IT_Force Value

    end
end

filenome = [caminho,angle,filesep,projeto,filesep,'Sensivity Analysis',filesep,projeto,'_SensivityAnalysisMatrixes','.mat'];
save(filenome,'Q12_EW_Points','Q12_LW_Points','Z1','Z2','Z3');
        
     case 'Q22' 
        disp('Analyzing Q22 parameter')
        
nomeFic    = [caminho,angle,filesep,projeto,filesep,'Sensivity Analysis',filesep,projeto,'_Sensivity_Analysis',script.dat];
fid        = fopen(nomeFic,'w');
fprintf(fid,' [Q22_EW, Q22_LW] O.F.1  IT_1 IT_Force Force_ref Force_FEM \n');

for ii = 1:length(Q22_EW_Points)
    
    for j = 1:length(Q22_LW_Points)
        
    Q22_EW = Q22_EW_Points(ii,j);
    Q22_LW = Q22_LW_Points(ii,j);
    
    C_EW = [Q11_EW Q12_EW 0; Q12_EW Q22_EW 0; 0 0 Q66_EW];
    C_LW   = [Q11_LW Q12_LW 0; Q12_LW Q22_LW 0;0 0 Q66_LW];
    
    MesoFEupdating
    
     % Strain analysis
    
     epsXXfem2dic_vec = epsXXfem2dic(:);% transforming the epsXXfem2dic matrix to a vector
     aux_x = (epsXdic_vec - epsXXfem2dic_vec)./epsXdic_max; % Assembling the residue function ...
                                                           % with the gap between exp. and numerical data...
                                                           % for the epsX normalized by the max. value
                                                           
     epsYYfem2dic_vec = epsYYfem2dic(:);% transforming the psYYfem2dic matrix to a vector
     aux_y = (epsYdic_vec - epsYYfem2dic_vec)./epsYdic_max; % Assembling the residue function ...
                                                           % with the gap between exp. and numerical data...
                                                           % for the epsY normalized by the max. value
     
     epsXYfem2dic_vec = epsXYfem2dic(:);% transforming the epsXYfem2dic matrix to a vector
     aux_S = (epsSdic_vec - epsXYfem2dic_vec)./epsSdic_max; % Assembling the residue function ...
                                                            % with the gap between exp. and numerical data...
                                                            % for the epsS normalized by the max. value

     %Removing NaN entries                                                      
     aux_x = rmmissing(aux_x);       
     aux_y = rmmissing(aux_y);  
     aux_S = rmmissing(aux_S);  
     
     aux = norm(aux_x)^2 + norm(aux_y)^2 + norm(aux_S)^2; % Final residue func
     
     %Force gap
     aux_force = (fReacEXP - abs(fReacLB))/fReacEXP; %Force Gap between experimental and numerical data...
                                                %normalized by the experimental value
     Weight_F = 0.5;
     
%    IT_1 = norm(aux); 
     IT_1 = aux/(length(aux_x)*3);                % Euclidian norm of the residue function from strain
     IT_Force = abs(aux_force);            % Term with the force gap using a weight factor
     
     error1 = (1-Weight_F)*(IT_1^2) + Weight_F*(IT_Force^2); % Objective function using euclidian norm and a weight...
                                              %for the force gap 
    disp(['Q22_EW = ',num2str(Q22_EW),' Q11_LW = ',num2str(Q22_LW),...
    ' OF1 = ', num2str(error1),' IT_1 = ',num2str(IT_1),...
    ' IT_Force = ',num2str(IT_Force),' Force_ref = ',num2str(abs(fReacEXP)),' Force_FEM = ',num2str(abs(fReacLB))])


fid = fopen(nomeFic,'a+');
formatSpec = ['%12.4f  %12.4f %18.10e %18.10e %18.10e %12.10f %12.10f \n'];
fprintf(fid,formatSpec, Q22_EW, Q22_LW, error1, IT_1, IT_Force,abs(fReacEXP),abs(fReacLB));

status = fclose(fid);

Z1(ii,j) = error1;      % Objective Function Value
Z2(ii,j) = IT_1;        % IT_1 Value
Z3(ii,j) = IT_Force;    % IT_Force Value

    end
end

filenome = [caminho,angle,filesep,projeto,filesep,'Sensivity Analysis',filesep,projeto,'_SensivityAnalysisMatrixes','.mat'];
save(filenome,'Q22_EW_Points','Q22_LW_Points','Z1','Z2','Z3');


     case 'Q66'  
        disp('Analyzing Q66 parameter') 
        
nomeFic    = [caminho,angle,filesep,projeto,filesep,'Sensivity Analysis',filesep,projeto,'_Sensivity_Analysis',script.dat];
fid        = fopen(nomeFic,'w');
fprintf(fid,' [Q66_EW, Q66_LW] O.F.1  IT_1 IT_Force Force_ref Force_FEM \n');

for ii = 1:length(Q66_EW_Points)
    
    for j = 1:length(Q66_LW_Points)
        
    Q66_EW = Q66_EW_Points(ii,j);
    Q66_LW = Q66_LW_Points(ii,j);
    
    C_EW = [Q11_EW Q12_EW 0; Q12_EW Q22_EW 0; 0 0 Q66_EW];
    C_LW   = [Q11_LW Q12_LW 0; Q12_LW Q22_LW 0;0 0 Q66_LW];
    
    MesoFEupdating
    
     % Strain analysis
    
     epsXXfem2dic_vec = epsXXfem2dic(:);% transforming the epsXXfem2dic matrix to a vector
     aux_x = (epsXdic_vec - epsXXfem2dic_vec)./epsXdic_max; % Assembling the residue function ...
                                                           % with the gap between exp. and numerical data...
                                                           % for the epsX normalized by the max. value
                                                           
     epsYYfem2dic_vec = epsYYfem2dic(:);% transforming the psYYfem2dic matrix to a vector
     aux_y = (epsYdic_vec - epsYYfem2dic_vec)./epsYdic_max; % Assembling the residue function ...
                                                           % with the gap between exp. and numerical data...
                                                           % for the epsY normalized by the max. value
     
     epsXYfem2dic_vec = epsXYfem2dic(:);% transforming the epsXYfem2dic matrix to a vector
     aux_S = (epsSdic_vec - epsXYfem2dic_vec)./epsSdic_max; % Assembling the residue function ...
                                                            % with the gap between exp. and numerical data...
                                                            % for the epsS normalized by the max. value

     %Removing NaN entries                                                      
     aux_x = rmmissing(aux_x);       
     aux_y = rmmissing(aux_y);  
     aux_S = rmmissing(aux_S);  
     
     aux = norm(aux_x)^2 + norm(aux_y)^2 + norm(aux_S)^2; % Final residue func
     
     %Force gap
     aux_force = (fReacEXP - abs(fReacLB))/fReacEXP; %Force Gap between experimental and numerical data...
                                                %normalized by the experimental value
     Weight_F = 0.5;
     
%    IT_1 = norm(aux); 
     IT_1 = aux/(length(aux_x)*3);                % Euclidian norm of the residue function from strain
     IT_Force = abs(aux_force);            % Term with the force gap using a weight factor
     
     error1 = (1-Weight_F)*(IT_1^2) + Weight_F*(IT_Force^2); % Objective function using euclidian norm and a weight...
                                              %for the force gap 
    disp(['Q66_EW = ',num2str(Q66_EW),' Q66_LW = ',num2str(Q66_LW),...
    ' OF1 = ', num2str(error1),' IT_1 = ',num2str(IT_1),...
    ' IT_Force = ',num2str(IT_Force),' Force_ref = ',num2str(abs(fReacEXP)),' Force_FEM = ',num2str(abs(fReacLB))])


fid = fopen(nomeFic,'a+');
formatSpec = ['%12.4f  %12.4f %18.10e %18.10e %18.10e %12.10f %12.10f \n'];
fprintf(fid,formatSpec, Q66_EW, Q66_LW, error1, IT_1, IT_Force,abs(fReacEXP),abs(fReacLB));

status = fclose(fid);

Z1(ii,j) = error1;      % Objective Function Value
Z2(ii,j) = IT_1;        % IT_1 Value
Z3(ii,j) = IT_Force;    % IT_Force Value

    end
end

filenome = [caminho,angle,filesep,projeto,filesep,'Sensivity Analysis',filesep,projeto,'_SensivityAnalysisMatrixes','.mat'];
save(filenome,'Q66_EW_Points','Q66_LW_Points','Z1','Z2','Z3');

     case 'User_defined' 
        disp('Analyzing User defined parameters')
        
nomeFic    = [caminho,angle,filesep,projeto,filesep,'Sensivity Analysis',filesep,projeto,'_Sensivity_Analysis',script.dat];
fid        = fopen(nomeFic,'w');
fprintf(fid,' [Q11_EW, Q12_EW] O.F.1  IT_1 IT_Force Force_ref Force_FEM \n');

for ii = 1:length(Q11_EW_Points)
    
    for j = 1:length(Q12_EW_Points)
        
    Q11_EW = Q11_EW_Points(ii,j);
    Q12_EW = Q12_EW_Points(ii,j);
    
    C_EW = [Q11_EW Q12_EW 0; Q12_EW Q22_EW 0; 0 0 Q66_EW];
    C_LW   = [Q11_LW Q12_LW 0; Q12_LW Q22_LW 0;0 0 Q66_LW];
    
    MesoFEupdating
    
     % Strain analysis
    
     epsXXfem2dic_vec = epsXXfem2dic(:);% transforming the epsXXfem2dic matrix to a vector
     aux_x = (epsXdic_vec - epsXXfem2dic_vec)./epsXdic_max; % Assembling the residue function ...
                                                           % with the gap between exp. and numerical data...
                                                           % for the epsX normalized by the max. value
                                                           
     epsYYfem2dic_vec = epsYYfem2dic(:);% transforming the psYYfem2dic matrix to a vector
     aux_y = (epsYdic_vec - epsYYfem2dic_vec)./epsYdic_max; % Assembling the residue function ...
                                                           % with the gap between exp. and numerical data...
                                                           % for the epsY normalized by the max. value
     
     epsXYfem2dic_vec = epsXYfem2dic(:);% transforming the epsXYfem2dic matrix to a vector
     aux_S = (epsSdic_vec - epsXYfem2dic_vec)./epsSdic_max; % Assembling the residue function ...
                                                            % with the gap between exp. and numerical data...
                                                            % for the epsS normalized by the max. value

     %Removing NaN entries                                                      
     aux_x = rmmissing(aux_x);       
     aux_y = rmmissing(aux_y);  
     aux_S = rmmissing(aux_S);  
     
     aux = norm(aux_x)^2 + norm(aux_y)^2 + norm(aux_S)^2; % Final residue func
     
     %Force gap
     aux_force = (fReacEXP - abs(fReacLB))/fReacEXP; %Force Gap between experimental and numerical data...
                                                     %normalized by the experimental value
     Weight_F = 0.5;
     
%    IT_1 = norm(aux); 
     IT_1 = aux/(length(aux_x)*3);                % Euclidian norm of the residue function from strain
     IT_Force = abs(aux_force);                   % Term with the force gap using a weight factor
     
     error1 = (1-Weight_F)*(IT_1^2) + Weight_F*(IT_Force^2); % Objective function using euclidian norm and a weight...
                                              %for the force gap 
    disp(['Q11_EW = ',num2str(Q11_EW),' Q12_EW = ',num2str(Q12_EW),...
    ' OF1 = ', num2str(error1),' IT_1 = ',num2str(IT_1),...
    ' IT_Force = ',num2str(IT_Force),' Force_ref = ',num2str(abs(fReacEXP)),' Force_FEM = ',num2str(abs(fReacLB))])


fid = fopen(nomeFic,'a+');
formatSpec = ['%12.4f  %12.4f %18.10e %18.10e %18.10e %12.10f %12.10f \n'];
fprintf(fid,formatSpec, Q11_EW, Q12_EW, error1, IT_1, IT_Force,abs(fReacEXP),abs(fReacLB));

status = fclose(fid);

Z1(ii,j) = error1;      % Objective Function Value
Z2(ii,j) = IT_1;        % IT_1 Value
Z3(ii,j) = IT_Force;    % IT_Force Value

    end
end

filenome = [caminho,angle,filesep,projeto,filesep,'Sensivity Analysis',filesep,projeto,'_SensivityAnalysisMatrixes','.mat'];
save(filenome,'Q11_EW_Points','Q12_EW_Points','Z1','Z2','Z3');
        

    end

      case 'Modulis'
          
          
          
end

filenome2 = [caminho,angle,filesep,projeto,filesep,'Sensivity Analysis',filesep,projeto,'_Parameters','.mat'];
save(filenome2,'DIC_Software','FEM_as_DIC','materialTipo','tipoBC','Analysis');
