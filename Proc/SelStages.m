%% Initialization

% J.Xavier

clc, clear, close all, warning('off','all'); % switch warning off


caminho = 'C:\Users\joaod\OneDrive\Ambiente de Trabalho\Doutoramento\Artigo Cientifico\Codigo Matlab\ANSYS\Compression\';

angle = 'A60';      % A00; A05; A10; A20; A40; A50; A60; A70; A80; A90  
projeto = 'A60_09'; % A00_01;A00_02;A00_03;A00_04;A00_05;A00_06;A00_07;A00_08;A00_09;A00_10; 
                    % A05_09; A10_08; A20_08; A40_08; A50_06; A60_10; A70_03; A80_02; A90_05;



fileload = [caminho,angle,filesep,projeto,'\Stage_Selection\','dados.dat'];
DELIMITER     = '\t';
HEADERLINES   = 0;
expdata           = importdata(fileload, DELIMITER, HEADERLINES);

% ensure root units are pixels and get the size of the screen
set(0,'Units','pixels'); scrsz = get(0,'ScreenSize');
% define the size and location of the figures
script.fig_pos = [scrsz(3)/6 scrsz(4)/6 scrsz(3)/1.5 scrsz(4)/1.5];
script.size_font1     = 14;
script.size_font2     = 18;
script.nomeF          = 'Times New Roman';
script.imgformat      = '-dtiff';
script.filetype       = '.tif';
script.xls            = '.xls';
script.ext            = '.dat';
script.csv            = '.csv';
script.mat            = '.mat';
script.txt            = '.txt';
script.resol          = '-r300';

%% ID stage

test.name = projeto;

inpdata

width = test.dimension.width; % unit: mm
thickness = test.dimension.thickness;
area = width*thickness;

switch projeto 
case 'A00_01'
Veloc = 0.2/60; %Unit: mm/sec 
    otherwise
Veloc = 0.5/60; %Unit: mm/sec 
end


Load = expdata(:,1);
stress = Load./area;
epsXX = expdata(:,2);
epsYY = expdata(:,3);
Stress_tresh = 2;   % MPa
stages = linspace(1,length(epsXX),length(epsXX))';
Displacement = stages*Veloc;

% correcting/translation P-d curve »»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»»
porder = 1;
xx     = epsXX;   % displacement (mm)
yy     = epsYY;    % load (N)    
% Data point in the linear least-squares regression
limsup = length(xx); % number maximum data points for LSR
inic   = find(min(abs(Stress_tresh-stress))==abs(Stress_tresh-stress));                          % to be checked!
liminf = inic+5;        % number minimum data points for LSR
xx     = xx(inic:limsup);
yy     = yy(inic:limsup);
Rtot   = zeros(limsup-inic-liminf+1,1);

for  j = 1:limsup-inic-liminf+1
    limt_sup = liminf + j - 1;
    xfit     = xx(1:limt_sup);
    yfit     = yy(1:limt_sup);
    p        = polyfit(xfit,yfit,porder);
    dev      = yfit - mean(yfit);      % deviations - measure of spread
    SST      = sum(dev.^2);            % total variation are accounted for
    resid    = yfit - polyval(p,xfit); % residuals - measure of mismatch
    SSE      = sum(resid.^2); 	       % variation NOT accounted for
    normr    = sqrt(SSE); % 2-norm of vector of the residuals for the fit
    Rtot(j)  = 1 - SSE/SST;            % variation NOT accounted for
end


switch projeto 
case 'A00_01'
R_Thresh = 0.9965;
case 'A00_02'
R_Thresh = 0.998;
case 'A00_03'
R_Thresh = 0.9983;
case 'A00_04'
R_Thresh = 0.998;
case 'A00_05'
R_Thresh = 0.9987;
case 'A00_06'
R_Thresh = 0.9955;
case 'A00_07'
R_Thresh = 0.9955;
case 'A00_08'
R_Thresh = 0.99;
case 'A00_09'
R_Thresh = 0.9965;
case 'A00_10'
R_Thresh = 0.996;
end

% position for the best fitting point parameters
% bestpos = find(max(Rtot)==Rtot); 
bestpos = find(min(abs(R_Thresh-Rtot))==abs(R_Thresh-Rtot)); 
stagio = liminf + bestpos;
disp(['stage = ', num2str(stagio),' / ',num2str(length(xx))])
disp(['R^2 = ',num2str(Rtot(bestpos))])

f = figure('color', [1 1 1]);
ax1 = axes('position',[0.12 0.15 .8 .75],'parent',f);
plot(epsXX,epsYY,'--sk',...
    'MarkerFaceColor',[0.5 0.5 0.5],...
    'MarkerEdgeColor',[0.25 0.25 0.25],...
    'MarkerSize',10,...
    'Marker','square',...
    'LineStyle','--',...
    'Color',[0 0 0])
xlabel('$\varepsilon_{xx}$','interpreter','latex','fontsize',20)
ylabel('$\varepsilon_{yy}$','interpreter','latex','fontsize',20)
hold on;
plot(epsXX(stagio),epsYY(stagio),'sr','MarkerSize',12,...
    'MarkerFaceColor',[0.2 0.2 0.2])

plot(epsXX(inic),epsYY(inic),'*b','MarkerSize',14,...
    'MarkerFaceColor',[0.2 0.2 0.2])
plot(epsXX(liminf),epsYY(liminf),'og','MarkerSize',14,...
    'MarkerFaceColor',[0.2 0.2 0.2])

ax2 = axes('position',[0.6 0.25 .3 .25],'parent',f);
plot(Rtot,'rs'); hold on;
plot(bestpos,Rtot(bestpos),'bs')

%% Stress-strain

f = figure('color', [1 1 1]);
ax2 = axes('position',[0.12 0.15 .8 .75],'parent',f);
plot(epsXX,stress,'--sk',...
    'MarkerFaceColor',[0.5 0.5 0.5],...
    'MarkerEdgeColor',[0.25 0.25 0.25],...
    'MarkerSize',10,...
    'Marker','square',...
    'LineStyle','--',...
    'Color',[0 0 0]);
hold on;
plot(epsXX(stagio),stress(stagio),'sr','MarkerSize',12,...
    'MarkerFaceColor',[0.2 0.2 0.2])

plot(epsXX(inic),stress(inic),'*b','MarkerSize',14,...
    'MarkerFaceColor',[0.2 0.2 0.2])
plot(epsXX(liminf),stress(liminf),'og','MarkerSize',14,...
    'MarkerFaceColor',[0.2 0.2 0.2])

ERest = stress(stagio)/epsXX(stagio);
disp(['ER (stagio = ',num2str(stagio),') = ',num2str(ERest), ' MPa'])

%% Stress-stages

f = figure('color', [1 1 1]);
ax2 = axes('position',[0.12 0.15 .8 .75],'parent',f);
plot(stages,stress,'--sk',...
    'MarkerFaceColor',[0.5 0.5 0.5],...
    'MarkerEdgeColor',[0.25 0.25 0.25],...
    'MarkerSize',10,...
    'Marker','square',...
    'LineStyle','--',...
    'Color',[0 0 0]);
hold on;
plot(stages(stagio),stress(stagio),'sr','MarkerSize',12,...
    'MarkerFaceColor',[0.2 0.2 0.2])

plot(stages(inic),stress(inic),'*b','MarkerSize',14,...
    'MarkerFaceColor',[0.2 0.2 0.2])
plot(stages(liminf),stress(liminf),'og','MarkerSize',14,...
    'MarkerFaceColor',[0.2 0.2 0.2])

%% Load-Displacement
f = figure('color', [1 1 1]);
ax2 = axes('position',[0.12 0.15 .8 .75],'parent',f);
plot(Displacement,Load,'--sk',...
    'MarkerFaceColor',[0.5 0.5 0.5],...
    'MarkerEdgeColor',[0.25 0.25 0.25],...
    'MarkerSize',10,...
    'Marker','square',...
    'LineStyle','--',...
    'Color',[0 0 0]);
hold on;
plot(Displacement(stagio),Load(stagio),'sr','MarkerSize',12,...
    'MarkerFaceColor',[0.2 0.2 0.2])

plot(Displacement(inic),Load(inic),'*b','MarkerSize',14,...
    'MarkerFaceColor',[0.2 0.2 0.2])
plot(Displacement(liminf),Load(liminf),'og','MarkerSize',14,...
    'MarkerFaceColor',[0.2 0.2 0.2])

