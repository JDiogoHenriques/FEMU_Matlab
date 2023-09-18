%% extension files
script.mac        = '.mac';
script.txt        = '.txt';
script.dat        = '.dat';
script.mat        = '.mat';
script.tex        = '.tex';
script.xls        = '.xls';
script.cor        = [0.88 0.917647063732147 0.796078443527222];
script.colormap   = 'hot'; % 'hot'; 'bone'

%% Material parameters 

caminho2 = [caminho,angle,filesep,projeto,'\ANSYS\'];

switch Analysis
    case 'Modulis' % valores de referencia

        switch materialTipo

        case 'heter' % valores de referencia
% Earlywood
% matriz C_EW

CPTR_EW = CPRT_EW * (ET_EW/ER_EW);

Q11_EW = ER_EW/(1-CPRT_EW*CPTR_EW);
Q12_EW = ER_EW*CPTR_EW/(1-CPRT_EW*CPTR_EW);
Q22_EW = ET_EW/(1-CPRT_EW*CPTR_EW);
Q66_EW = GRT_EW;

C_EW = [Q11_EW Q12_EW 0; Q12_EW Q22_EW 0; 0 0 Q66_EW];

% LateWood
% matriz C_LW

CPTR_LW = CPRT_LW * (ET_LW/ER_LW);

Q11_LW = ER_LW/(1-CPRT_LW*CPTR_LW);
Q12_LW = ER_LW*CPTR_LW/(1-CPRT_LW*CPTR_LW);
Q22_LW = ET_LW/(1-CPRT_LW*CPTR_LW);
Q66_LW = GRT_LW;

C_LW = [Q11_LW Q12_LW 0; Q12_LW Q22_LW 0;0 0 Q66_LW];


Properties_EW = [ER_EW;ET_EW;CPRT_EW;GRT_EW];
Properties_LW = [ER_LW;ET_LW;CPRT_LW;GRT_LW];

nomeFic3 = [caminho2,filesep,'Variable_materialproperties_Heter','.dat'];
fid  = fopen(nomeFic3,'w');
WriteContent3 = [Properties_EW,Properties_LW];
formatSpec = ['%12.6f  %12.6f  \n'];
fprintf(fid,formatSpec, WriteContent3.');
status = fclose(fid);

        case 'homog' % valores de referencia

% matriz C_EW

Q11_EW = ER_EW/(1-CPRT_EW*CPTR_EW);
Q12_EW = ER_EW*CPTR_EW/(1-CPRT_EW*CPTR_EW);
Q22_EW = ET_EW/(1-CPRT_EW*CPTR_EW);
Q66_EW = GRT_EW;

C_EW = [Q11_EW Q12_EW 0; Q12_EW Q22_EW 0; 0 0 Q66_EW];


 Properties_EW = [ER_EW;ET_EW;CPRT_EW;GRT_EW];   
 
 nomeFic3 = [caminho2,filesep,'Variable_materialproperties_Homog','.dat'];
fid  = fopen(nomeFic3,'w');
WriteContent3 = [Properties_EW];
formatSpec = ['%12.6f \n'];
fprintf(fid,formatSpec, WriteContent3.');
status = fclose(fid);

        end
        
    case 'Stiffness' 
        
        switch materialTipo

        case 'heter' % valores de referencia
% Earlywood
% matriz C_EW
C_EW = [Q11_EW Q12_EW 0; Q12_EW Q22_EW 0; 0 0 Q66_EW];

S_EW = inv(C_EW);

% EL_EW = 
ER_EW = 1/S_EW(1,1);
ET_EW =1/S_EW(2,2);
CPRT_EW = -S_EW(2,1)*ER_EW;
% CPTL_EW = 
% CPLR_EW = 
GRT_EW = 1/S_EW(3,3);
% GLT_EW =
% GLR_EW = 

% LateWood
% matriz C_LW
C_LW = [Q11_LW Q12_LW 0; Q12_LW Q22_LW 0;0 0 Q66_LW];

S_LW = inv(C_LW);

% EL_EW = 
ER_LW = 1/S_LW(1,1);
ET_LW =1/S_LW(2,2);
CPRT_LW = -S_LW(2,1)*ER_LW;
% CPTL_EW = 
% CPLR_EW = 
GRT_LW = 1/S_LW(3,3);
% GLT_EW =
% GLR_EW = 

Properties_EW = [ER_EW;ET_EW;CPRT_EW;GRT_EW];
Properties_LW = [ER_LW;ET_LW;CPRT_LW;GRT_LW];

nomeFic3 = [caminho2,filesep,'Variable_materialproperties_Heter','.dat'];
fid  = fopen(nomeFic3,'w');
WriteContent3 = [Properties_EW,Properties_LW];
formatSpec = ['%12.6f  %12.6f  \n'];
fprintf(fid,formatSpec, WriteContent3.');
status = fclose(fid);

        case 'homog' % valores de referencia

% matriz C_EW
C_EW = [Q11_EW Q12_EW 0; Q12_EW Q22_EW 0; 0 0 Q66_EW];

S_EW = inv(C_EW);

% EL_EW = 
ER_EW = 1/S_EW(1,1);
ET_EW =1/S_EW(2,2);
CPRT_EW = -S_EW(2,1)*ER_EW;
% CPTL_EW = 
% CPLR_EW = 
GRT_EW = 1/S_EW(3,3);
% GLT_EW =
% GLR_EW =     

 Properties_EW = [ER_EW;ET_EW;CPRT_EW;GRT_EW];   
 
 nomeFic3 = [caminho2,filesep,'Variable_materialproperties_Homog','.dat'];
fid  = fopen(nomeFic3,'w');
WriteContent3 = [Properties_EW];
formatSpec = ['%12.6f \n'];
fprintf(fid,formatSpec, WriteContent3.');
status = fclose(fid);

end
        
end

% Writing Boundary Conditions from MesoFE Analysis for stage i

nomeFicheiro1 = [caminho2,filesep,'Mesh_Left_DIC2FEM',script.dat];
fid  = fopen(nomeFicheiro1,'w');
WriteContent = [index_Left,yFEM_UX_leftBC,yFEM_UY_leftBC];

formatSpec = ['%12.6f  %16.10f  %16.10f\n'];
fprintf(fid,formatSpec, WriteContent.');
status = fclose(fid);

nomeFicheiro2 = [caminho2,filesep,'Mesh_Right_DIC2FEM',script.dat];
fid  = fopen(nomeFicheiro2,'w');
WriteContent2 = [index_Right,yFEM_UX_rightBC,yFEM_UY_rightBC];

formatSpec = ['%12.6f  %16.10f  %16.10f\n'];
fprintf(fid,formatSpec, WriteContent2.');
status = fclose(fid);        

%% FE meshing

% ======================================================================= %
% Mesh generation 
% ======================================================================= %

nel = size(elementNodes,1);
numberNodes = size(nodeCoordinates(:,1),1);
numberElements = size(elementNodes,1);
% GDof: global number of degrees of freedom
GDof = 2*numberNodes;


%% Ansys in Batch mode

disp(['FEA Analysis in ANSYS...']) 

directy = 'C:\Program Files\ANSYS Inc\ANSYS Student\v202\ansys\bin\winx64\';
ansysV = 'ANSYS202';
filname3 = 'outansys';

switch DIC_Software
    case 'Aramis2D' 
    filname1 = [projeto,'_FEA'];
    case 'MatchID' 
    filname1 = [projeto,'_FEA_MatchID'];
end


% executing ANSYS with the actual EF parameters:
% ======================================================================= %
cd(caminho2);   % changing Directory by the one where ANSYS files are stored
dos(['"' directy ansysV '" -b nolist -i ' filname1 script.mac ' -j ' ...
    projeto ' -o ' filname3 script.dat]); % ANSYS is executed in batch mode
% ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: %

% Reading numerical results from ANSYS
% ======================================================================= %
cd(caminhoMAT);    % rechanging Directory to the 'Identification' one


%% Solution

Nodal_FEA = importdata([caminho2,filesep,'Nodal_fea',script.dat]); % Column 1:Node Index;
                                                                   % Column 2:Coord X; Column 3:Coord Y;
                                                                   % Column 4:Displ X; Column 5:Displ Y;
                                                                   % Column 6:Strain X; Column 7:Strain Y; 
                                                                   % Column 8:Strain XY;
xx = nodeCoordinates(:,1);
yy = nodeCoordinates(:,2);

displacements = cat(1,Nodal_FEA(:,4),Nodal_FEA(:,5));

Nodal_Forces = importdata([caminho2,filesep,'Nodal_forces',script.dat]); %Nodal forces matrix:
                                                                        % Column 1:Node Index;
                                                                        % Column 2:FX; Column 3:FY;                                                                        
vecForce = cat(1,Nodal_Forces(:,2),Nodal_Forces(:,3));

Force_scalar_LB = importdata([caminho2,filesep,'ScalarsFE_LeftBoundary',script.dat]); %Sum of force matrix:
                                                                        % Column 1:Node Index;
                                                                        % Column 2:FX; Column 3:FY;
fReacLB_x = Force_scalar_LB(1,1);
fReacLB_y = Force_scalar_LB(1,2);
fReacLB = fReacLB_x;


Force_scalar_RB = importdata([caminho2,filesep,'ScalarsFE_RightBoundary',script.dat]); %Sum of force matrix:
                                                                        % Column 1:Node Index;
                                                                        % Column 2:FX; Column 3:FY;
fReacRB_x = Force_scalar_RB(1,1);
fReacRB_y = Force_scalar_RB(1,2);
fReacRB = fReacRB_x;


%% Results

UX = displacements(1:numberNodes);
UY = displacements(numberNodes+1:GDof);

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

%% Output

% ----------------------------------------------------------------------- %
% Displacements FEM interpolated at subset points of DIC
% ----------------------------------------------------------------------- %

xx    = nodeCoordinates(:,1);
yy    = nodeCoordinates(:,2);

[xxE, yyE] = meshgrid(xdicline,ydicline);
funcInt = 'scatteredInterpolant';
switch funcInt
    case 'scatteredInterpolant'
        UX2 = scatteredInterpolant(xx,yy,UX);
        UXfem2dic = UX2(xxE,yyE);
        % -
        UY2 = scatteredInterpolant(xx,yy,UY);
        UYfem2dic = UY2(xxE,yyE);
        % -
        epsXX2 = scatteredInterpolant(coodXElements,coodYElements,strainEF.XX);
        epsXXfem2dic = epsXX2(xxE,yyE);
        % -
        epsYY2 = scatteredInterpolant(coodXElements,coodYElements,strainEF.YY);
        epsYYfem2dic = epsYY2(xxE,yyE);        
        % -
        epsXY2 = scatteredInterpolant(coodXElements,coodYElements,strainEF.XY);
        epsXYfem2dic = epsXY2(xxE,yyE);          
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

