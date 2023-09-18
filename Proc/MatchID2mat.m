%% Input

% J. Henriques, J. Xavier, Gilac 2021


% clear workSpace
clc; close all; clear all;
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
script.dat        = '.dat';
script.ext        = '.txt';
script.csv        = '.csv';
script.resol      = '-r300';
script.xls        = '.xls';
script.MatchIDext = '.tif';

% Change default axes fonts.
set(0,'DefaultAxesFontName', script.nomeF)
set(0,'DefaultAxesFontSize', script.size_font2)

% Change default text fonts.
set(0,'DefaultTextFontname', script.nomeF)
set(0,'DefaultTextFontSize', script.size_font2)

% ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: %
caminho = 'D:\JDHenriques\Compression\';
angle = 'A60';
projeto = 'A60_06';
% ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: %

% struture variable
MatchID = struct;
MatchID.project.name = projeto;

switch projeto

        case 'A00_01'
        MatchID.SubsetSize = 17;
        MatchID.StepSize = 5;
        MatchID.Correlation = 'ZNSSD';
        MatchID.GreyInterpolation = 'Bicubic spline';
        MatchID.SubsetTransformation = 'Quadratic';
        MatchID.StrainWindow = 9;
        MatchID.StrainConvention = 'GreenLagrange';
        MatchID.StrainInterpolation = 'Q4'; % Bilinear Quadrilateral
        % -
        MatchID.loadCFact = 50;
        load([caminho,angle,filesep,projeto,filesep,projeto,'_ConvFact',script.mat])
        MatchID.mm2pixel = converfactor;
        stages = 200;
        % -        
        MatchID.ROI.X = 39; %pixel
        MatchID.ROI.Y = 215; %pixel
        X_end = 1576; %pixel
        Y_end = 978; %pixel        
    
        case 'A00_02'
        MatchID.SubsetSize = 17;
        MatchID.StepSize = 5;
        MatchID.Correlation = 'ZNSSD';
        MatchID.GreyInterpolation = 'Bicubic spline';
        MatchID.SubsetTransformation = 'Quadratic';
        MatchID.StrainWindow = 9;
        MatchID.StrainConvention = 'GreenLagrange';
        MatchID.StrainInterpolation = 'Q4'; % Bilinear Quadrilateral
        % -
        MatchID.loadCFact = 100;
        load([caminho,angle,filesep,projeto,filesep,projeto,'_ConvFact',script.mat])
        MatchID.mm2pixel = converfactor;
        stages = 100;
        % -        
        MatchID.ROI.X = 46; %pixel
        MatchID.ROI.Y = 221; %pixel
        X_end = 1570; %pixel
        Y_end = 1019; %pixel       
    
        case 'A00_03'
        MatchID.SubsetSize = 17;
        MatchID.StepSize = 5;
        MatchID.Correlation = 'ZNSSD';
        MatchID.GreyInterpolation = 'Bicubic spline';
        MatchID.SubsetTransformation = 'Quadratic';
        MatchID.StrainWindow = 9;
        MatchID.StrainConvention = 'GreenLagrange';
        MatchID.StrainInterpolation = 'Q4'; % Bilinear Quadrilateral
        % -
        MatchID.loadCFact = 100;
        load([caminho,angle,filesep,projeto,filesep,projeto,'_ConvFact',script.mat])
        MatchID.mm2pixel = converfactor;
        stages = 100;
        % -        
        MatchID.ROI.X = 39; %pixel
        MatchID.ROI.Y = 219; %pixel
        X_end = 1578; %pixel
        Y_end = 1005; %pixel       
 
        case 'A00_04'
        MatchID.SubsetSize = 17;
        MatchID.StepSize = 5;
        MatchID.Correlation = 'ZNSSD';
        MatchID.GreyInterpolation = 'Bicubic spline';
        MatchID.SubsetTransformation = 'Quadratic';
        MatchID.StrainWindow = 9;
        MatchID.StrainConvention = 'GreenLagrange';
        MatchID.StrainInterpolation = 'Q4'; % Bilinear Quadrilateral
        % -
        MatchID.loadCFact = 100;
        load([caminho,angle,filesep,projeto,filesep,projeto,'_ConvFact',script.mat])
        MatchID.mm2pixel = converfactor;
        stages = 100;
        % -        
        MatchID.ROI.X = 34; %pixel
        MatchID.ROI.Y = 247; %pixel
        X_end = 1572; %pixel
        Y_end = 1017; %pixel      
    
        case 'A00_05'
        MatchID.SubsetSize = 17;
        MatchID.StepSize = 5;
        MatchID.Correlation = 'ZNSSD';
        MatchID.GreyInterpolation = 'Bicubic spline';
        MatchID.SubsetTransformation = 'Quadratic';
        MatchID.StrainWindow = 9;
        MatchID.StrainConvention = 'GreenLagrange';
        MatchID.StrainInterpolation = 'Q4'; % Bilinear Quadrilateral
        % -
        MatchID.loadCFact = 100;
        load([caminho,angle,filesep,projeto,filesep,projeto,'_ConvFact',script.mat])
        MatchID.mm2pixel = converfactor;
        stages = 100;
        % -        
        MatchID.ROI.X = 40; %pixel
        MatchID.ROI.Y = 231; %pixel
        X_end = 1554; %pixel
        Y_end = 1018; %pixel      
    
        case 'A00_06'
        MatchID.SubsetSize = 17;
        MatchID.StepSize = 5;
        MatchID.Correlation = 'ZNSSD';
        MatchID.GreyInterpolation = 'Bicubic spline';
        MatchID.SubsetTransformation = 'Quadratic';
        MatchID.StrainWindow = 9;
        MatchID.StrainConvention = 'GreenLagrange';
        MatchID.StrainInterpolation = 'Q4'; % Bilinear Quadrilateral
        % -
        MatchID.loadCFact = 100;
        load([caminho,angle,filesep,projeto,filesep,projeto,'_ConvFact',script.mat])
        MatchID.mm2pixel = converfactor;
        stages = 100;
        % -        
        MatchID.ROI.X = 40; %pixel
        MatchID.ROI.Y = 231; %pixel
        X_end = 1554; %pixel
        Y_end = 998; %pixel  
    
        case 'A00_07'
        MatchID.SubsetSize = 17;
        MatchID.StepSize = 5;
        MatchID.Correlation = 'ZNSSD';
        MatchID.GreyInterpolation = 'Bicubic spline';
        MatchID.SubsetTransformation = 'Quadratic';
        MatchID.StrainWindow = 9;
        MatchID.StrainConvention = 'GreenLagrange';
        MatchID.StrainInterpolation = 'Q4'; % Bilinear Quadrilateral
        % -
        MatchID.loadCFact = 100;
        load([caminho,angle,filesep,projeto,filesep,projeto,'_ConvFact',script.mat])
        MatchID.mm2pixel = converfactor;
        stages = 100;
        % -        
        MatchID.ROI.X = 30; %pixel
        MatchID.ROI.Y = 202; %pixel
        X_end = 1580; %pixel
        Y_end = 1008; %pixel  
    
        case 'A00_08'
        MatchID.SubsetSize = 17;
        MatchID.StepSize = 5;
        MatchID.Correlation = 'ZNSSD';
        MatchID.GreyInterpolation = 'Bicubic spline';
        MatchID.SubsetTransformation = 'Quadratic';
        MatchID.StrainWindow = 9;
        MatchID.StrainConvention = 'GreenLagrange';
        MatchID.StrainInterpolation = 'Q4'; % Bilinear Quadrilateral
        % -
        MatchID.loadCFact = 100;
        load([caminho,angle,filesep,projeto,filesep,projeto,'_ConvFact',script.mat])
        MatchID.mm2pixel = converfactor;
        stages = 100;
        % -        
        MatchID.ROI.X = 37; %pixel
        MatchID.ROI.Y = 211; %pixel
        X_end = 1577; %pixel
        Y_end = 998; %pixel  
    
    case 'A00_09'
        MatchID.SubsetSize = 17;
        MatchID.StepSize = 5;
        MatchID.Correlation = 'ZNSSD';
        MatchID.GreyInterpolation = 'Bicubic spline';
        MatchID.SubsetTransformation = 'Quadratic';
        MatchID.StrainWindow = 9;
        MatchID.StrainConvention = 'GreenLagrange';
        MatchID.StrainInterpolation = 'Q4'; % Bilinear Quadrilateral
        % -
        MatchID.loadCFact = 100;
        load([caminho,angle,filesep,projeto,filesep,projeto,'_ConvFact',script.mat])
        MatchID.mm2pixel = converfactor;
        stages = 100;
        % -        
        MatchID.ROI.X = 36; %pixel
        MatchID.ROI.Y = 217; %pixel
        X_end = 1580; %pixel
        Y_end = 1005; %pixel    
    
    case 'A00_10'
        MatchID.SubsetSize = 17;
        MatchID.StepSize = 5;
        MatchID.Correlation = 'ZNSSD';
        MatchID.GreyInterpolation = 'Bicubic spline';
        MatchID.SubsetTransformation = 'Quadratic';
        MatchID.StrainWindow = 9;
        MatchID.StrainConvention = 'GreenLagrange';
        MatchID.StrainInterpolation = 'Q4'; % Bilinear Quadrilateral
        % -
        MatchID.loadCFact = 100;
        load([caminho,angle,filesep,projeto,filesep,projeto,'_ConvFact',script.mat])
        MatchID.mm2pixel = converfactor;
        stages = 100;
        % -        
        MatchID.ROI.X = 33; %pixel
        MatchID.ROI.Y = 208; %pixel
        X_end = 1582; %pixel
        Y_end = 1003; %pixel

    case 'A60_01'
        MatchID.SubsetSize = 21;
        MatchID.StepSize = 5;
        MatchID.Correlation = 'ZNSSD';
        MatchID.GreyInterpolation = 'Bicubic spline';
        MatchID.SubsetTransformation = 'Quadratic';
        MatchID.StrainWindow = 11;
        MatchID.StrainConvention = 'GreenLagrange';
        MatchID.StrainInterpolation = 'Q4'; % Bilinear Quadrilateral
        % -
        MatchID.loadCFact = 100;
        load([caminho,angle,filesep,projeto,filesep,projeto,'_ConvFact',script.mat])
        MatchID.mm2pixel = converfactor;
        stages = 150;
        % -        
        MatchID.ROI.X = 13; %pixel
        MatchID.ROI.Y = 377; %pixel
        X_end = 1599; %pixel
        Y_end = 1038; %pixel           
        
    case 'A60_02'
        MatchID.SubsetSize = 21;
        MatchID.StepSize = 5;
        MatchID.Correlation = 'ZNSSD';
        MatchID.GreyInterpolation = 'Bicubic spline';
        MatchID.SubsetTransformation = 'Quadratic';
        MatchID.StrainWindow = 11;
        MatchID.StrainConvention = 'GreenLagrange';
        MatchID.StrainInterpolation = 'Q4'; % Bilinear Quadrilateral
        % -
        MatchID.loadCFact = 100;
        load([caminho,angle,filesep,projeto,filesep,projeto,'_ConvFact',script.mat])
        MatchID.mm2pixel = converfactor;
        stages = 150;
        % -        
        MatchID.ROI.X = 30; %pixel
        MatchID.ROI.Y = 410; %pixel
        X_end = 1597; %pixel
        Y_end = 1049; %pixel          
        
    case 'A60_03'
        MatchID.SubsetSize = 21;
        MatchID.StepSize = 5;
        MatchID.Correlation = 'ZNSSD';
        MatchID.GreyInterpolation = 'Bicubic spline';
        MatchID.SubsetTransformation = 'Quadratic';
        MatchID.StrainWindow = 11;
        MatchID.StrainConvention = 'GreenLagrange';
        MatchID.StrainInterpolation = 'Q4'; % Bilinear Quadrilateral
        % -
        MatchID.loadCFact = 100;
        load([caminho,angle,filesep,projeto,filesep,projeto,'_ConvFact',script.mat])
        MatchID.mm2pixel = converfactor;
        stages = 150;
        % -        
        MatchID.ROI.X = 23; %pixel
        MatchID.ROI.Y = 390; %pixel
        X_end = 1592; %pixel
        Y_end = 1027; %pixel           
        
    case 'A60_04'
        MatchID.SubsetSize = 21;
        MatchID.StepSize = 5;
        MatchID.Correlation = 'ZNSSD';
        MatchID.GreyInterpolation = 'Bicubic spline';
        MatchID.SubsetTransformation = 'Quadratic';
        MatchID.StrainWindow = 11;
        MatchID.StrainConvention = 'GreenLagrange';
        MatchID.StrainInterpolation = 'Q4'; % Bilinear Quadrilateral
        % -
        MatchID.loadCFact = 100;
        load([caminho,angle,filesep,projeto,filesep,projeto,'_ConvFact',script.mat])
        MatchID.mm2pixel = converfactor;
        stages = 150;
        % -        
        MatchID.ROI.X = 16; %pixel
        MatchID.ROI.Y = 387; %pixel
        X_end = 1599; %pixel
        Y_end = 1021; %pixel         
        
    case 'A60_05'
        MatchID.SubsetSize = 21;
        MatchID.StepSize = 5;
        MatchID.Correlation = 'ZNSSD';
        MatchID.GreyInterpolation = 'Bicubic spline';
        MatchID.SubsetTransformation = 'Quadratic';
        MatchID.StrainWindow = 11;
        MatchID.StrainConvention = 'GreenLagrange';
        MatchID.StrainInterpolation = 'Q4'; % Bilinear Quadrilateral
        % -
        MatchID.loadCFact = 100;
        load([caminho,angle,filesep,projeto,filesep,projeto,'_ConvFact',script.mat])
        MatchID.mm2pixel = converfactor;
        stages = 150;
        % -        
        MatchID.ROI.X = 14; %pixel
        MatchID.ROI.Y = 382; %pixel
        X_end = 1612; %pixel
        Y_end = 1037; %pixel          

 case 'A60_06'
        MatchID.SubsetSize = 21;
        MatchID.StepSize = 5;
        MatchID.Correlation = 'ZNSSD';
        MatchID.GreyInterpolation = 'Bicubic spline';
        MatchID.SubsetTransformation = 'Quadratic';
        MatchID.StrainWindow = 11;
        MatchID.StrainConvention = 'GreenLagrange';
        MatchID.StrainInterpolation = 'Q4'; % Bilinear Quadrilateral
        % -
        MatchID.loadCFact = 100;
        load([caminho,angle,filesep,projeto,filesep,projeto,'_ConvFact',script.mat])
        MatchID.mm2pixel = converfactor;
        stages = 150;
        % -        
        MatchID.ROI.X = 17; %pixel
        MatchID.ROI.Y = 384; %pixel
        X_end = 1593; %pixel
        Y_end = 1027; %pixel                  
        
    case 'A60_07'
        MatchID.SubsetSize = 21;
        MatchID.StepSize = 5;
        MatchID.Correlation = 'ZNSSD';
        MatchID.GreyInterpolation = 'Bicubic spline';
        MatchID.SubsetTransformation = 'Quadratic';
        MatchID.StrainWindow = 11;
        MatchID.StrainConvention = 'GreenLagrange';
        MatchID.StrainInterpolation = 'Q4'; % Bilinear Quadrilateral
        % -
        MatchID.loadCFact = 100;
        load([caminho,angle,filesep,projeto,filesep,projeto,'_ConvFact',script.mat])
        MatchID.mm2pixel = converfactor;
        stages = 150;
        % -        
        MatchID.ROI.X = 10; %pixel
        MatchID.ROI.Y = 384; %pixel
        X_end = 1588; %pixel
        Y_end = 1047; %pixel          
        
    case 'A60_08'
        MatchID.SubsetSize = 21;
        MatchID.StepSize = 5;
        MatchID.Correlation = 'ZNSSD';
        MatchID.GreyInterpolation = 'Bicubic spline';
        MatchID.SubsetTransformation = 'Quadratic';
        MatchID.StrainWindow = 11;
        MatchID.StrainConvention = 'GreenLagrange';
        MatchID.StrainInterpolation = 'Q4'; % Bilinear Quadrilateral
        % -
        MatchID.loadCFact = 100;
        load([caminho,angle,filesep,projeto,filesep,projeto,'_ConvFact',script.mat])
        MatchID.mm2pixel = converfactor;
        stages = 150;
        % -        
        MatchID.ROI.X = 11; %pixel
        MatchID.ROI.Y = 384; %pixel
        X_end = 1574; %pixel
        Y_end = 1040; %pixel          
        
    case 'A60_09'
        MatchID.SubsetSize = 21;
        MatchID.StepSize = 5;
        MatchID.Correlation = 'ZNSSD';
        MatchID.GreyInterpolation = 'Bicubic spline';
        MatchID.SubsetTransformation = 'Quadratic';
        MatchID.StrainWindow = 11;
        MatchID.StrainConvention = 'GreenLagrange';
        MatchID.StrainInterpolation = 'Q4'; % Bilinear Quadrilateral
        % -
        MatchID.loadCFact = 100;
        load([caminho,angle,filesep,projeto,filesep,projeto,'_ConvFact',script.mat])
        MatchID.mm2pixel = converfactor;
        stages = 150;
        % -        
        MatchID.ROI.X = 11; %pixel
        MatchID.ROI.Y = 370; %pixel
        X_end = 1590; %pixel
        Y_end = 1026; %pixel        
        
    case 'A60_10'
        MatchID.SubsetSize = 21;
        MatchID.StepSize = 5;
        MatchID.Correlation = 'ZNSSD';
        MatchID.GreyInterpolation = 'Bicubic spline';
        MatchID.SubsetTransformation = 'Quadratic';
        MatchID.StrainWindow = 11;
        MatchID.StrainConvention = 'GreenLagrange';
        MatchID.StrainInterpolation = 'Q4'; % Bilinear Quadrilateral
        % -
        MatchID.loadCFact = 100;
        load([caminho,angle,filesep,projeto,filesep,projeto,'_ConvFact',script.mat])
        MatchID.mm2pixel = converfactor;
        stages = 150;
        % -        
        MatchID.ROI.X = 16; %pixel
        MatchID.ROI.Y = 388; %pixel
        X_end = 1589; %pixel
        Y_end = 1049; %pixel

end

script.MatchIDext = '.tif';
script.MatchIDextR = '.tif_';

%% Read load data

% e.g., measured for an universal tentile machine - unit: N
fileload    = [caminho,angle,filesep,projeto,filesep,projeto,'_load',script.dat];
if ~exist(fileload,'file'); warning('Load file from Aramis does not exist'); disp('Load file from Aramis does not exist'); return; end;
delimiter   = ';';
startRow    = 3;
demp        = importdata(fileload,delimiter,startRow);
if isstruct(demp)
    test.time   = demp.data(:,1);
    test.load   = demp.data(:,2);
else
    test.time   = demp(:,1);
    test.load   = demp(:,2);
end
test.load = test.load - test.load(1);
MatchID.load = test.load(2:stages+1).*MatchID.loadCFact;    % eliminating first stage: reference stage
MatchID.time = test.time(2:stages+1);


%% Import DIC data

nomeFile = [caminho,angle,filesep,projeto,filesep,'MatchID',filesep,'Current Analysis',filesep,projeto,'_MatchID',script.mat];

% number of stages
MatchID.stages = 0;
MatchID.index = [];
try
    for i = 1:stages
        filen = [caminho,angle,filesep,projeto,filesep,projeto,'_',...
            num2str(floor(i/1000)), num2str(floor(i/100)),...
            num2str(mod(floor(i/10),10)) num2str(mod(i,10)),...
            script.MatchIDext];
        if exist(filen,'file')
            MatchID.stages = MatchID.stages + 1;
            MatchID.index = cat(1,MatchID.index,i);
        end
    end
catch
end


% CoodX - Convert units pixel to mm
Mcomp = 'x_pic';
eval(['MatchID.',Mcomp,' = [];'])

% All Stages

for j = 1:length(MatchID.index)
    i = MatchID.index(j);
    disp([projeto,' : reading cvs files : ',Mcomp,'...stage : ',num2str(i)])
    filen = [caminho,angle,filesep,projeto,filesep,'MatchID',filesep,'Current Analysis',filesep,Mcomp,filesep,projeto,'_',...
        num2str(floor(i/1000)), num2str(floor(i/100)),...
        num2str(mod(floor(i/10),10)) num2str(mod(i,10)),...
        script.MatchIDextR,Mcomp,script.csv];
    eval(['MatchID.',Mcomp,'.s',num2str(j),' = dlmread(filen).*MatchID.mm2pixel;'])
    %MatchID.Exx = cat(3,MatchID.Exx,dlmread(filen));
end

%Some Stages

% for j = 1:2
%     MatchID_SmallAna = [25;35];
%     i = MatchID_SmallAna (j);
%     disp([projeto,' : reading cvs files : ',Mcomp,'...stage : ',num2str(i)])
%     filen = [caminho,projeto,filesep,'MatchID',filesep,Mcomp,filesep,projeto,'_',...
%         num2str(0), num2str(0),num2str(i),script.MatchIDextR,Mcomp,script.csv];
%     eval(['MatchID.',Mcomp,'.s',num2str(i),' = dlmread(filen).*MatchID.mm2pixel;'])
%     %MatchID.Exx = cat(3,MatchID.Exx,dlmread(filen));
% end


% CoodY - Convert units pixel to mm
Mcomp = 'y_pic';
eval(['MatchID.',Mcomp,' = [];'])

% All Stages

for j = 1:length(MatchID.index)
    i = MatchID.index(j);
    disp([projeto,' : reading cvs files : ',Mcomp,'...stage : ',num2str(i)])
    filen = [caminho,angle,filesep,projeto,filesep,'MatchID',filesep,'Current Analysis',filesep,Mcomp,filesep,projeto,'_',...
        num2str(floor(i/1000)), num2str(floor(i/100)),...
        num2str(mod(floor(i/10),10)) num2str(mod(i,10)),...
        script.MatchIDextR,Mcomp,script.csv];
    eval(['MatchID.',Mcomp,'.s',num2str(j),' = dlmread(filen).*MatchID.mm2pixel;'])
    %MatchID.Exx = cat(3,MatchID.Exx,dlmread(filen));
end

%Some Stages

% for j = 1:2
%     MatchID_SmallAna = [25;35];
%     i = MatchID_SmallAna (j);
%     disp([projeto,' : reading cvs files : ',Mcomp,'...stage : ',num2str(i)])
%     filen = [caminho,projeto,filesep,'MatchID',filesep,Mcomp,filesep,projeto,'_',...
%         num2str(0), num2str(0),num2str(i),script.MatchIDextR,Mcomp,script.csv];
%     eval(['MatchID.',Mcomp,'.s',num2str(i),' = dlmread(filen).*MatchID.mm2pixel;'])
%     %MatchID.Exx = cat(3,MatchID.Exx,dlmread(filen));
% end


% UX - Convert units pixel to mm
Mcomp = 'u';
eval(['MatchID.',Mcomp,' = [];'])

% All Stages

for j = 1:length(MatchID.index)
    i = MatchID.index(j);
    disp([projeto,' : reading cvs files : ',Mcomp,'...stage : ',num2str(i)])
    filen = [caminho,angle,filesep,projeto,filesep,'MatchID',filesep,'Current Analysis',filesep,Mcomp,filesep,projeto,'_',...
        num2str(floor(i/1000)), num2str(floor(i/100)),...
        num2str(mod(floor(i/10),10)) num2str(mod(i,10)),...
        script.MatchIDextR,Mcomp,script.csv];
    eval(['MatchID.',Mcomp,'.s',num2str(j),' = dlmread(filen).*MatchID.mm2pixel;'])
    %MatchID.Exx = cat(3,MatchID.Exx,dlmread(filen));
end

%Some Stages

% for j = 1:2
%     MatchID_SmallAna = [25;35];
%     i = MatchID_SmallAna (j);
%     disp([projeto,' : reading cvs files : ',Mcomp,'...stage : ',num2str(i)])
%     filen = [caminho,projeto,filesep,'MatchID',filesep,Mcomp,filesep,projeto,'_',...
%         num2str(0), num2str(0),num2str(i),script.MatchIDextR,Mcomp,script.csv];
%     eval(['MatchID.',Mcomp,'.s',num2str(i),' = dlmread(filen).*MatchID.mm2pixel;'])
%     %MatchID.Exx = cat(3,MatchID.Exx,dlmread(filen));
% end


% UY - Convert units pixel to mm
Mcomp = 'v';
eval(['MatchID.',Mcomp,' = [];'])

% All Stages

for j = 1:length(MatchID.index)
    i = MatchID.index(j);
    disp([projeto,' : reading cvs files : ',Mcomp,'...stage : ',num2str(i)])
    filen = [caminho,angle,filesep,projeto,filesep,'MatchID',filesep,'Current Analysis',filesep,Mcomp,filesep,projeto,'_',...
        num2str(floor(i/1000)), num2str(floor(i/100)),...
        num2str(mod(floor(i/10),10)) num2str(mod(i,10)),...
        script.MatchIDextR,Mcomp,script.csv];
    eval(['MatchID.',Mcomp,'.s',num2str(j),' = dlmread(filen).*MatchID.mm2pixel;'])
    %MatchID.Exx = cat(3,MatchID.Exx,dlmread(filen));
end

%Some Stages

% for j = 1:2
%     MatchID_SmallAna = [25;35];
%     i = MatchID_SmallAna (j);
%     disp([projeto,' : reading cvs files : ',Mcomp,'...stage : ',num2str(i)])
%     filen = [caminho,projeto,filesep,'MatchID',filesep,Mcomp,filesep,projeto,'_',...
%         num2str(0), num2str(0),num2str(i),script.MatchIDextR,Mcomp,script.csv];
%     eval(['MatchID.',Mcomp,'.s',num2str(i),' = dlmread(filen).*MatchID.mm2pixel;'])
%     %MatchID.Exx = cat(3,MatchID.Exx,dlmread(filen));
% end



% EpsX
Mcomp = 'exx';
eval(['MatchID.',Mcomp,' = [];'])

% All Stages

for j = 1:length(MatchID.index)
    i = MatchID.index(j);
    disp([projeto,' : reading cvs files : ',Mcomp,'...stage : ',num2str(i)])
    filen = [caminho,angle,filesep,projeto,filesep,'MatchID',filesep,'Current Analysis',filesep,Mcomp,filesep,projeto,'_',...
        num2str(floor(i/1000)), num2str(floor(i/100)),...
        num2str(mod(floor(i/10),10)) num2str(mod(i,10)),...
        script.MatchIDextR,Mcomp,script.csv];
    eval(['MatchID.',Mcomp,'.s',num2str(j),' = dlmread(filen);'])
    %MatchID.Exx = cat(3,MatchID.Exx,dlmread(filen));
end

%Some Stages

% for j = 1:2
%     MatchID_SmallAna = [25;35];
%     i = MatchID_SmallAna (j);
%     disp([projeto,' : reading cvs files : ',Mcomp,'...stage : ',num2str(i)])
%     filen = [caminho,projeto,filesep,'MatchID',filesep,Mcomp,filesep,projeto,'_',...
%         num2str(0), num2str(0),num2str(i),script.MatchIDextR,Mcomp,script.csv];
%     eval(['MatchID.',Mcomp,'.s',num2str(i),' = dlmread(filen);'])
%     %MatchID.Exx = cat(3,MatchID.Exx,dlmread(filen));
% end



% EpsY
Mcomp = 'eyy';
eval(['MatchID.',Mcomp,' = [];'])

% All Stages

for j = 1:length(MatchID.index)
    i = MatchID.index(j);
    disp([projeto,' : reading cvs files : ',Mcomp,'...stage : ',num2str(i)])
    filen = [caminho,angle,filesep,projeto,filesep,'MatchID',filesep,'Current Analysis',filesep,Mcomp,filesep,projeto,'_',...
        num2str(floor(i/1000)), num2str(floor(i/100)),...
        num2str(mod(floor(i/10),10)) num2str(mod(i,10)),...
        script.MatchIDextR,Mcomp,script.csv];
    eval(['MatchID.',Mcomp,'.s',num2str(j),' = dlmread(filen);'])
    %MatchID.Eyy = cat(3,MatchID.Eyy,dlmread(filen));
end

%Some Stages

% for j = 1:2
%     MatchID_SmallAna = [25;35];
%     i = MatchID_SmallAna (j);
%     disp([projeto,' : reading cvs files : ',Mcomp,'...stage : ',num2str(i)])
%     filen = [caminho,projeto,filesep,'MatchID',filesep,Mcomp,filesep,projeto,'_',...
%         num2str(0), num2str(0),num2str(i),script.MatchIDextR,Mcomp,script.csv];
%     eval(['MatchID.',Mcomp,'.s',num2str(i),' = dlmread(filen);'])
%     %MatchID.Eyy = cat(3,MatchID.Eyy,dlmread(filen));
% end



% EpsXY
Mcomp = 'exy';
eval(['MatchID.',Mcomp,' = [];'])

% All Stages

for j = 1:length(MatchID.index)
    i = MatchID.index(j);
    disp([projeto,' : reading cvs files : ',Mcomp,'...stage : ',num2str(i)])
    filen = [caminho,angle,filesep,projeto,filesep,'MatchID',filesep,'Current Analysis',filesep,Mcomp,filesep,projeto,'_',...
        num2str(floor(i/1000)), num2str(floor(i/100)),...
        num2str(mod(floor(i/10),10)) num2str(mod(i,10)),...
        script.MatchIDextR,Mcomp,script.csv];
    eval(['MatchID.',Mcomp,'.s',num2str(j),' = dlmread(filen);'])
    %MatchID.Exy = cat(3,MatchID.Exy,dlmread(filen));
end

%Some Stages

% for j = 1:2
%     MatchID_SmallAna = [25;35];
%     i = MatchID_SmallAna (j);
%     disp([projeto,' : reading cvs files : ',Mcomp,'...stage : ',num2str(i)])
%     filen = [caminho,projeto,filesep,'MatchID',filesep,Mcomp,filesep,projeto,'_',...
%         num2str(0), num2str(0),num2str(i),script.MatchIDextR,Mcomp,script.csv];
%     eval(['MatchID.',Mcomp,'.s',num2str(i),' = dlmread(filen);'])
%     %MatchID.Exy = cat(3,MatchID.Exy,dlmread(filen));
% end

% ROI size
        
 MatchID.ROI.width  = (X_end-MatchID.ROI.X); %pixel
 MatchID.ROI.height = (Y_end-MatchID.ROI.Y); %pixel

% Save data
disp(['Saving mat file of projet: ',projeto])
save(nomeFile,'MatchID')


