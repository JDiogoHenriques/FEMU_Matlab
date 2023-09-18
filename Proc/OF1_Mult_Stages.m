function error1 = OF1_Mult_Stages(Estimative,nomeFic,projeto,Analysis,angle,caminho,n_stages,stage,...
    materialTipo,nomeFic2,Interp_M)


for i = 1:n_stages

auxil = stage(i,:);    
nomeFEM = [caminho,angle,filesep,projeto,filesep,'FEMU_Mult_Stages',filesep,...
           materialTipo,filesep,auxil,filesep,Interp_M,filesep,projeto,'_infoFEMU','.mat'];    
    
load(nomeFEM,'d2f','xdic','ydic','uxdic','uydic','epsXdic','epsYdic','epsSdic',...
    'nodeCoordinates','elementNodes','nnel','materialTipo','DIC_Software',...
    'Lx','Ly','thickness','xdicline','ydicline','index_xL','index_yL',...
    'index_xR','index_yR','yFEM_UX_leftBC','yFEM_UY_leftBC',...
    'yFEM_UX_rightBC','yFEM_UY_rightBC','fReacEXP','index_Right','index_Left')

caminhoMAT=[caminho,'Proc\'];

% run fem model

switch Analysis
    case 'Modulis' % valores de referencia
        
            switch materialTipo

        case 'heter'
ER_EW = Estimative(1);
ET_EW = Estimative(2);
CPRT_EW = Estimative(3); 
GRT_EW = Estimative(4); 
ER_LW = Estimative(5); 
ET_LW = Estimative(6); 
CPRT_LW = Estimative(7); 
GRT_LW = Estimative(8);

        case 'homog' 
ER_EW = Estimative(1);
ET_EW = Estimative(2);
CPRT_EW = Estimative(3); 
GRT_EW = Estimative(4); 
            end

    case 'Stiffness' 
        
        switch materialTipo

        case 'heter' 
Q11_EW = Estimative(1);
Q12_EW = Estimative(2);
Q22_EW = Estimative(3); 
Q66_EW = Estimative(4); 
Q11_LW = Estimative(5); 
Q12_LW = Estimative(6); 
Q22_LW = Estimative(7); 
Q66_LW = Estimative(8);

        case 'homog' 
Q11_EW = Estimative(1);
Q12_EW = Estimative(2);
Q22_EW = Estimative(3); 
Q66_EW = Estimative(4); 
        end
end
        

% input: Qij(EW|LW) updated 
MesoFEupdating_Mult_Stages
% output: uFEM epsFEM stessFEM

% Objective Function

uxdic_vec = uxdic(:); % transforming the uxdic matrix to a vector
[~,absmax_ux] = max(abs(uxdic_vec)); % Index for the absolute maxvalue for ux
uxdic_max = uxdic_vec(absmax_ux); % Absolute max value for ux from DIC

uydic_vec = uydic(:); % transforming the uydic matrix to a vector
[~,absmax_uy] = max(abs(uydic_vec)); % Index for the absolute maxvalue for uy
uydic_max = uydic_vec(absmax_uy); % Absolute max value for uy from DIC

% max values for DIC strain
epsXdic_vec = epsXdic(:); % transforming the epsXdic matrix to a vector
[~,absmax_epsX] = max(abs(epsXdic_vec)); % Index for the absolute maxvalue for epsX
epsXdic_max = epsXdic_vec(absmax_epsX); % Absolute max value for epsX from DIC

epsYdic_vec = epsYdic(:); % transforming the epsYdic matrix to a vector
[~,absmax_epsY] = max(abs(epsYdic_vec)); % Index for the absolute maxvalue for epsY
epsYdic_max = epsYdic_vec(absmax_epsY); % Absolute max value for epsY from DIC

epsSdic_vec = epsSdic(:); % transforming the epsSdic matrix to a vector
[~,absmax_epsS] = max(abs(epsSdic_vec)); % Index for the absolute maxvalue for epsS
epsSdic_max = epsSdic_vec(absmax_epsS); % Absolute max value for epsS from DIC

%FE Results
epsXXfem2dic_vec = epsXXfem2dic(:);% transforming the epsXXfem2dic matrix to a vector
epsYYfem2dic_vec = epsYYfem2dic(:);% transforming the epsYYfem2dic matrix to a vector
epsXYfem2dic_vec = epsXYfem2dic(:);% transforming the epsXYfem2dic matrix to a vector


%Structuring data Stage i

%DIC data
eval([auxil,'.DIC.UX = uxdic_vec;']);           %Ux
eval([auxil,'.DIC.UXmax = uxdic_max;']);        %Ux Max Value
eval([auxil,'.DIC.UY = uydic_vec;']);           %Uy
eval([auxil,'.DIC.UYmax = uydic_max;']);        %Uy Max Value

eval([auxil,'.DIC.EXX = epsXdic_vec;']);        %Exx
eval([auxil,'.DIC.EXXmax = epsXdic_max;']);     %Exx Max value
eval([auxil,'.DIC.EYY = epsYdic_vec;']);        %Eyy
eval([auxil,'.DIC.EYYmax = epsYdic_max;']);     %Eyy Max value
eval([auxil,'.DIC.EXY = epsSdic_vec;']);        %Exy 
eval([auxil,'.DIC.EXYmax = epsSdic_max;']);     %Exy Max value
eval([auxil,'.DIC.FORCE = fReacEXP;']);         %Force

%FE data
eval([auxil,'.FE.UX = UXfem2dic(:);']);         %Ux 
eval([auxil,'.FE.UY = UYfem2dic(:);']);         %Uy
eval([auxil,'.FE.EXX = epsXXfem2dic_vec;']);    %Exx  
eval([auxil,'.FE.EYY = epsYYfem2dic_vec;']);    %Eyy
eval([auxil,'.FE.EXY = epsXYfem2dic_vec;']);    %Exy
eval([auxil,'.FE.FORCE = fReacLB;']);           %Force

%Difference in DIC and FE fields normalized by max value
eval([auxil,'.DIFF.UX=(',auxil,'.DIC.UX-',auxil,'.FE.UX)./',auxil,'.DIC.UXmax;']);      %Ux  
eval([auxil,'.DIFF.UY=(',auxil,'.DIC.UY-',auxil,'.FE.UY)./',auxil,'.DIC.UYmax;']);      %Uy
eval([auxil,'.DIFF.EXX=(',auxil,'.DIC.EXX-',auxil,'.FE.EXX)./',auxil,'.DIC.EXXmax;']);  %Exx  
eval([auxil,'.DIFF.EYY=(',auxil,'.DIC.EYY-',auxil,'.FE.EYY)./',auxil,'.DIC.EYYmax;']);  %Eyy  
eval([auxil,'.DIFF.EXY=(',auxil,'.DIC.EXY-',auxil,'.FE.EXY)./',auxil,'.DIC.EXYmax;']);  %Exy  
eval([auxil,'.DIFF.FORCE=(',auxil,'.DIC.FORCE-abs(',auxil,'.FE.FORCE))/',auxil,'.DIC.FORCE;']);  %Force 

%Putting NaN entries to 0 in difference fields
% eval([auxil,'.DIFF.UX(isnan(',auxil,'.DIFF.UX))=0;']);      %Ux  
% eval([auxil,'.DIFF.UY(isnan(',auxil,'.DIFF.UY))=0;']);      %Uy
% eval([auxil,'.DIFF.EXX(isnan(',auxil,'.DIFF.EXX))=0;']);    %Exx
% eval([auxil,'.DIFF.EYY(isnan(',auxil,'.DIFF.EYY))=0;']);    %Eyy
% eval([auxil,'.DIFF.EXY(isnan(',auxil,'.DIFF.EXY))=0;']);    %Exy 
 

%Writting results to plot graphics for first stage

filenome = [caminho,angle,filesep,projeto,filesep,'FEMU_Mult_Stages',filesep,...
    materialTipo,filesep,auxil,filesep,Interp_M,filesep,projeto,'_FemuRes','.mat'];

save(filenome,'uxdic_max','uydic_max','epsXdic_max','epsYdic_max','epsSdic_max',...
    'UXfem2dic','UYfem2dic','epsXXfem2dic','epsYYfem2dic','epsXYfem2dic');

end


% Objective Function
calTyo = '1';  %  1 for strain analysis; 
switch calTyo
    
    case '1'
        
%Sum of difference Field from analyzed stages        
% eval(['aux_x=zeros(length(',stage(1,:),'.DIFF.EXX),1);']);
% eval(['aux_y=zeros(length(',stage(1,:),'.DIFF.EYY),1);']);
% eval(['aux_S=zeros(length(',stage(1,:),'.DIFF.EXY),1);']);
aux = zeros(1,1);
eval(['aux_force=zeros(length(',stage(1,:),'.DIFF.FORCE),1);']);

for i=1:n_stages   
    
 eval(['auxiliar_x=',stage(i,:),'.DIFF.EXX;']);  %Exx  
 eval(['auxiliar_y=',stage(i,:),'.DIFF.EYY;']);  %Exy  
 eval(['auxiliar_S=',stage(i,:),'.DIFF.EXY;']);  %Exy  
 eval(['auxiliar_force=',stage(i,:),'.DIFF.FORCE;']);  %Force 
 
 %Removing NaN entries
auxiliar_x = rmmissing(auxiliar_x);
auxiliar_y = rmmissing(auxiliar_y);
auxiliar_S = rmmissing(auxiliar_S); 
 
auxiliar_t = (norm(auxiliar_x)^2 + norm(auxiliar_y)^2 + norm(auxiliar_S)^2)/length(auxiliar_x); % Final residue func 
    
aux = aux+abs(auxiliar_t);

%  aux_x = aux_x+abs(auxiliar_x);
%  aux_y = aux_y+abs(auxiliar_y);
%  aux_S = aux_S+abs(auxiliar_S);
 aux_force = aux_force+abs(auxiliar_force);
end

     Weight_F = 10^-5;                                 
%        Weight_F = 0;


     IT_1 = aux/(3*n_stages);     % Strain Residue
     IT_Force = abs(aux_force/n_stages);        % Term with the force gap using a weight factor
     
     error1 = (1-Weight_F)*(IT_1^2) + Weight_F*(IT_Force^2); % Objective function using euclidian norm and a weight...
                                              %for the force gap 
                                     
                                  
end
% error1 < 10e-4;

switch materialTipo
        case 'heter' % valores de referencia

disp(['Q11_EW = ',num2str(Q11_EW),' Q11_LW = ',num2str(Q11_LW),...
    ' OF1 = ', num2str(error1),' IT_1 = ',num2str(IT_1),...
    ' IT_Force = ',num2str(IT_Force),' Force_Exp = ',num2str(abs(fReacEXP)),...
    ' Force_FEMU = ',num2str(abs(fReacLB))])

fid = fopen(nomeFic,'a+');
formatSpec = ['%12.2f  %12.2f %12.2f %12.2f %12.2f %12.2f',...
    '%12.2f %12.2f %18.6e %18.6e %18.6e %12.3f %12.3f\n'];
fprintf(fid,formatSpec, Q11_EW, Q12_EW, Q22_EW, Q66_EW,...
    Q11_LW, Q12_LW, Q22_LW, Q66_LW, error1, IT_1, IT_Force,fReacEXP,abs(fReacLB));

status = fclose(fid);


fid2 = fopen(nomeFic2,'a+');
formatSpec = ['%12.3f  %12.3f %12.5f %12.3f %12.3f %12.3f',...
    '%12.5f %12.3f %18.6e %18.6e %18.6e %12.3f %12.3f\n'];
fprintf(fid,formatSpec, ER_EW, ET_EW, CPRT_EW, GRT_EW,...
    ER_LW, ET_LW, CPRT_LW, GRT_LW, error1, IT_1, IT_Force,fReacEXP,abs(fReacLB));

status = fclose(fid2);


        case 'homog' % valores de referencia
            
disp(['Q11 = ',num2str(Q11_EW),' Q12 = ',num2str(Q12_EW),...
    ' OF1 = ', num2str(error1),' IT_1 = ',num2str(IT_1),...
    ' IT_Force = ',num2str(IT_Force),' Force_Exp = ',num2str(abs(fReacEXP)),...
    ' Force_FEMU = ',num2str(abs(fReacLB))])



fid = fopen(nomeFic,'a+');
formatSpec = ['%12.2f  %12.2f %12.2f %12.2f',...
    '%18.6e %18.6e %18.6e %12.3f %12.3f\n'];
fprintf(fid,formatSpec, Q11_EW, Q12_EW, Q22_EW, Q66_EW,...
    error1, IT_1, IT_Force,fReacEXP,abs(fReacLB));

status = fclose(fid);

fid2 = fopen(nomeFic2,'a+');
formatSpec = ['%12.3f  %12.3f %12.5f %12.3f',...
    '%18.6e %18.6e %18.6e %12.3f %12.3f\n'];
fprintf(fid,formatSpec, ER_EW, ET_EW, CPRT_EW, GRT_EW,...
    error1, IT_1, IT_Force,fReacEXP,abs(fReacLB));

status = fclose(fid2);

end

