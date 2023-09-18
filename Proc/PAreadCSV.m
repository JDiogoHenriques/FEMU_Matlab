function PA = PAreadCSV(caminho)

%%% load data
opts = delimitedTextImportOptions("NumVariables", 2);
% Specify range and delimiter
opts.DataLines = [3, Inf];
opts.Delimiter = ";";
% Specify column names and types
opts.VariableNames = ["X","Y"];
opts.VariableTypes = ["double", "double"];
% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";
% Import the data
dados = readtable(caminho, opts);
ind = find(isnan(dados.X)); 
ind_0_i = 1; ind_0_f = ind(1)-1; 
ind_1_i = ind(1)+2; ind_1_f = ind(3)-1; 
ind_2_i = ind(3)+2; ind_2_f = ind(5)-1; 
ind_3_i = ind(5)+2; ind_3_f = length(dados.X);
% -
PA = struct;
PA.AffQ4.X = dados.X(ind_0_i:ind_0_f); % Affine/Q4
PA.AffQ4.Y = dados.Y(ind_0_i:ind_0_f); 
PA.AffQ8.X = dados.X(ind_1_i:ind_1_f); % Affine/Q8
PA.AffQ8.Y = dados.Y(ind_1_i:ind_1_f);
PA.QuadQ4.X = dados.X(ind_2_i:ind_2_f); % Quadratic/Q4
PA.QuadQ4.Y = dados.Y(ind_2_i:ind_2_f);
PA.QuadQ8.X = dados.X(ind_3_i:ind_3_f); % Quadratic/Q8
PA.QuadQ8.Y = dados.Y(ind_3_i:ind_3_f);