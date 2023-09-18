function error1 = OF1(Estimative,nomeFEM,nomeFic,projeto,Analysis,angle,caminho,directy,ansysV,calTyo,Weight_F,SyntImag_approach)
    
        switch SyntImag_approach
    case 'no'
    load(nomeFEM,'d2f','xdic','ydic','uxdic','uydic','epsXdic','epsYdic','epsSdic',...
    'nodeCoordinates','elementNodes','nnel','materialTipo','DIC_Software',...
    'Lx','Ly','thickness','xdicline','ydicline','index_xL','index_yL',...
    'index_xR','index_yR','yFEM_UX_leftBC','yFEM_UY_leftBC','Virtual_Reference',...
    'yFEM_UX_rightBC','yFEM_UY_rightBC','fReacEXP','DIC_Sett_Point')

    case 'yes'
    load(nomeFEM,'d2f','xdic','ydic','uxdic','uydic','epsXdic','epsYdic','epsSdic',...
    'nnel','materialTipo','DIC_Software','caminhoMatchID','caminhoFE_DEF','caminhoFE_VAL',...
    'Lx','Ly','thickness','xdicline','ydicline','DIC_Sett_Point','ROI_X','ROI_Y',......
    'yFEM_UX_leftBC','yFEM_UY_leftBC','Virtual_Reference','converfactor',...
    'yFEM_UX_rightBC','yFEM_UY_rightBC','fReacEXP')       
        end

caminhoMAT=[caminho,'Proc\'];
nomeFic2 = [caminho,angle,filesep,projeto,filesep,projeto,'_MatFEMU_OF1.dat'];
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
MesoFEupdating
% output: uFEM epsFEM stessFEM

% Objective Function

%uxmax = max([uxdic(:); UXfem2dic(:)]);
%uymax = min([uydic(:); UYfem2dic(:)]);

% max values for displacements
uxdic_vec = uxdic(:); % transforming the uxdic matrix to a vector
[~,absmax_ux] = max(abs(uxdic_vec)); % Index for the absolute maxvalue for ux
uxdic_max = uxdic_vec(absmax_ux); % Absolute max value for ux from DIC

uydic_vec = uydic(:); % transforming the uydic matrix to a vector
[~,absmax_uy] = max(abs(uydic_vec)); % Index for the absolute maxvalue for uy
uydic_max = uydic_vec(absmax_uy); % Absolute max value for uy from DIC

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


% Objective Function
switch calTyo
    case '1' 
     % Displacements analysis
     
     % aux = ((uxdic-UXfem2dic)./uxdic_max).^2+...
     %    ((uydic-UYfem2dic)./uydic_max).^2;
     % error1 = mean(aux(~isnan(aux)));
        
     UXfem2dic_vec = UXfem2dic(:);% transforming the UXfem2dic matrix to a vector
     aux_x = (uxdic_vec - UXfem2dic_vec)./uxdic_max; % Assembling the residue function ...
                                                    % with the gap between exp. and numerical data for the UX...
                                                    % normalized by the max. value
     
     UYfem2dic_vec = UYfem2dic(:);% transforming the UYfem2dic matrix to a vector
     aux_y = (uydic_vec - UYfem2dic_vec)./uydic_max; % Assembling the residue function ...
                                                    % with the gap between exp. and numerical data for the UX...
                                                    % normalized by the max. value
                                                        
     %Removing NaN entries                                                      
     aux_x = rmmissing(aux_x);       
     aux_y = rmmissing(aux_y);  
                                                                                                 
     %aux = abs(aux_x) + abs(aux_y); % Final residue function taking into account displacements from X and Y axis
     aux = norm(aux_x)^2 + norm(aux_y)^2; % Final residue func
     
     %Force gap
     aux_force = (fReacEXP - abs(fReacLB))/fReacEXP; %Force Gap between experimental and numerical data...
                                                %normalized by the experimental value
                                             

     %IT_1 = norm(aux);                % Euclidian norm of the residue function from displacements
     IT_1 = aux/(length(aux_x)*2);  
     IT_Force = abs(aux_force);            % Term with the force gap using a weight factor
     
    % Checking for negative values
         
     if any(Checking_matrix < 0)    
    disp('There is at least one Stiffness component or constitutive parameter that is negative. Penalizing objective function value.')

    error1=1;
    
     else
    
    error1 = (1-Weight_F)*(IT_1^2) + Weight_F*(IT_Force^2); % Objective function using euclidian norm and a weight...
                                              %for the force gap  
     end
     
    case '2'
         % Strain analysis
         % aux = ((epsXdic-epsXXfem2dic)./epsXdic_max).^2 + ...
         %   ((epsYdic-epsYYfem2dic)./epsYdic_max).^2 + ...
         %   ((epsSdic-epsXYfem2dic)./epsSdic_max).^2;
         % error1 = mean(aux(~isnan(aux)));    

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

%    IT_1 = norm(aux); 
     IT_1 = aux/(length(aux_x)*3);                % Euclidian norm of the residue function from strain
     IT_Force = abs(aux_force);            % Term with the force gap using a weight factor
     
     
    % Checking for negative values
         
     if any(Checking_matrix < 0)    
    disp('There is at least one Stiffness component or constitutive parameter that is negative. Penalizing objective function value.')

    error1=1;
    
     else
    
    error1 = (1-Weight_F)*(IT_1^2) + Weight_F*(IT_Force^2); % Objective function using euclidian norm and a weight...
                                              %for the force gap  
     end
     

                                              
     case '3'
         % Strain analysis
         % aux = ((epsXdic-epsXXfem2dic)./epsXdic_max).^2 + ...
         %   ((epsYdic-epsYYfem2dic)./epsYdic_max).^2 + ...
         %   ((epsSdic-epsXYfem2dic)./epsSdic_max).^2;
         % error1 = mean(aux(~isnan(aux)));    

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
     
%    IT_1 = norm(aux); 
     IT_1 = aux/(length(aux_x)*3);                % Euclidian norm of the residue function from strain
     IT_Force = abs(aux_force);            % Term with the force gap using a weight factor
     
    % Checking for negative values
         
     if any(Checking_matrix < 0)    
    disp('There is at least one Stiffness component or constitutive parameter that is negative. Penalizing objective function value.')

    error1=1;
    
     else
    
    error1 = (1-Weight_F)*(IT_1^2) + Weight_F*(IT_Force^2); % Objective function using euclidian norm and a weight...
                                              %for the force gap  
     end

                                              
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

filenome = [caminho,angle,filesep,projeto,filesep,projeto,'_FemuRes','.mat'];
save(filenome,'uxdic_max','uydic_max','epsXdic_max','epsYdic_max','epsSdic_max',...
    'UXfem2dic','UYfem2dic','epsXXfem2dic','epsYYfem2dic','epsXYfem2dic');