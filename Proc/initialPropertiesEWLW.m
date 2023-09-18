%% Material parameters - reference values

mater        = [];

switch materialTipo

        case 'heter' % valores de referencia
        
        % EarlyWood (lenho inicial) elastic orthotropic parameters
        mater.E1_EW   = 10.400E3; % unit: MPa 1, 2, 3 = L, R, T
        mater.E2_EW   = .566E3;
        mater.E3_EW   = .152E3;
        mater.CP32_EW = .30;
        mater.CP31_EW = 0.033;
        mater.CP12_EW = 0.753;
        mater.G23_EW  = .050E3;
        mater.G13_EW  = 1.096E3;
        mater.G12_EW  = 1.109E3;
        % -
        mater.CP23_EW = mater.CP32_EW/(mater.E3_EW/mater.E2_EW);
        
        % Late (lenho final) elastic orthotropic parameters
        mater.E1_LW   = 20.700E3; % unit: MPa 1, 2, 3 = L, R, T
        mater.E2_LW   = 1.752E3;
        mater.E3_LW   = 1.215E3;
        mater.CP32_LW = .425;
        mater.CP31_LW = .033;
        mater.CP12_LW = .484;
        mater.G23_LW  = 0.215E3;
        mater.G13_LW  = 1.096E3;
        mater.G12_LW  = 1.109E3;
        % -
        mater.CP23_LW = mater.CP32_LW/(mater.E3_LW/mater.E2_LW);
        
    case 'refs10upB20'
        % EW
        mater.E2_EW   = 622.60000;
        mater.E3_EW   = 167.20000;
        mater.CP32_EW =  0.33000;
        mater.G23_EW  = 55.00000;
        % LW
        mater.E2_LW   = 1927.20000;
        mater.E3_LW   = 1336.50000;
        mater.CP32_LW = 0.46200;        
        mater.G23_LW  = 236.50000;
        
        % EarlyWood (lenho inicial) elastic orthotropic parameters
        mater.E1_EW   = 10.400E3; % unit: MPa 1, 2, 3 = L, R, T
        mater.CP31_EW = 0.033;
        mater.CP12_EW = 0.041;
        mater.G13_EW  = 1.096E3;
        mater.G12_EW  = 1.109E3;
        % -
        mater.CP23_EW = mater.CP32_EW/(mater.E3_EW/mater.E2_EW);
        
        % Late (lenho final) elastic orthotropic parameters
        mater.E1_LW   = 20.700E3; % unit: MPa 1, 2, 3 = L, R, T
        mater.CP31_LW = .033;
        mater.CP12_LW = .041;
        mater.G13_LW  = 1.096E3;
        mater.G12_LW  = 1.109E3;
        % -
        mater.CP23_LW = mater.CP32_LW/(mater.E3_LW/mater.E2_LW);
        
    case 'refs10downB20'
        % EW
        mater.E2_EW   = 509.40000;
        mater.E3_EW   = 136.80000;
        mater.CP32_EW =  0.27000;
        mater.G23_EW  = 45.00000;
        % LW
        mater.E2_LW   = 1576.80000;   
        mater.E3_LW   = 1093.50000;
        mater.CP32_LW = 0.37800;        
        mater.G23_LW  = 193.50000;
        
        % EarlyWood (lenho inicial) elastic orthotropic parameters
        mater.E1_EW   = 10.400E3; % unit: MPa 1, 2, 3 = L, R, T
        mater.CP31_EW = 0.033;
        mater.CP12_EW = 0.041;
        mater.G13_EW  = 1.096E3;
        mater.G12_EW  = 1.109E3;
        % -
        mater.CP23_EW = mater.CP32_EW/(mater.E3_EW/mater.E2_EW);
        
        % Late (lenho final) elastic orthotropic parameters
        mater.E1_LW   = 20.700E3; % unit: MPa 1, 2, 3 = L, R, T
        mater.CP31_LW = .033;
        mater.CP12_LW = .041;
        mater.G13_LW  = 1.096E3;
        mater.G12_LW  = 1.109E3;
        % -
        mater.CP23_LW = mater.CP32_LW/(mater.E3_LW/mater.E2_LW);        
        
    case 'homog'
        
        % Late elastic orthotropic parameters
        mater.E1_LW   = 15.133E3; % unit: MPa
        mater.E2_LW   = 1.912E3;
        mater.E3_LW   = 1.010E3;
        mater.CP23_LW = .586;
        mater.CP31_LW = .051;
        mater.CP12_LW = .471;
        mater.G23_LW  = 0.176E3;
        mater.G13_LW  = 1.096E3;
        mater.G12_LW  = 1.109E3;
        % -
        mater.CP32_LW = mater.CP23_LW*(mater.E3_LW/mater.E2_LW);
  
        mater.E1_EW   = mater.E1_LW; % unit: MPa
        mater.E2_EW   = mater.E2_LW;
        mater.E3_EW   = mater.E3_LW;
        mater.CP23_EW = mater.CP23_LW;
        mater.CP31_EW = mater.CP31_LW;
        mater.CP12_EW = mater.CP12_LW;
        mater.G23_EW  = mater.G23_LW;
        mater.G13_EW  = mater.G13_LW;
        mater.G12_EW  = mater.G12_LW;
        % -
        mater.CP32_EW = mater.CP23_EW*(mater.E3_EW/mater.E2_EW);
        
    case 'heterInv'
        % troca de EW por LW !
        
        % EW >> LW
        mater.E2_LW   = .566E3;
        mater.E3_LW   = .152E3;
        mater.CP32_LW = .30;
        mater.G23_LW  = .050E3;
        
        % LW >> EW
        
        mater.E2_EW   = 1.752E3;
        mater.E3_EW   = 1.215E3;
        mater.CP32_EW = .425;
        mater.G23_EW  = 0.215E3;
        
        % EarlyWood (lenho inicial) elastic orthotropic parameters
        mater.E1_EW   = 10.400E3; % unit: MPa 1, 2, 3 = L, R, T        
        mater.CP31_EW = 0.033;
        mater.CP12_EW = 0.041;
        mater.G13_EW  = 1.096E3;
        mater.G12_EW  = 1.109E3;
        % -
        mater.CP23_EW = mater.CP32_EW/(mater.E3_EW/mater.E2_EW);
        
        % Late (lenho final) elastic orthotropic parameters
        mater.E1_LW   = 20.700E3; % unit: MPa 1, 2, 3 = L, R, T       
        mater.CP31_LW = .033;
        mater.CP12_LW = .041;
        mater.G13_LW  = 1.096E3;
        mater.G12_LW  = 1.109E3;
        % -
        mater.CP23_LW = mater.CP32_LW/(mater.E3_LW/mater.E2_LW);        
        
end