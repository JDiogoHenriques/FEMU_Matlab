clear all; 
clc; 
close all;
imtool close all;
%------------------------------------------------------------------------------------------------

angle = 'A60';      % A00; A60;
projeto = 'A60_10'; % A00_10; A60_10;
caminho = ['C:\Users\joaod\OneDrive\Ambiente de Trabalho\Doutoramento\Artigo Cientifico\Codigo Matlab\ANSYS\Compression\',angle,filesep,projeto,filesep,'PA'];
switch projeto
    case 'A00_10'
iSpeckle = imread([caminho,filesep,projeto,'_0000.tif']);
iRings = flipud(imread([caminho,filesep,projeto,'_Rings.tif']));
ytrans = -40;
    case 'A60_10'
iSpeckle = imread([caminho,filesep,projeto,'_0000.tif']);
iRings = flipud(imread([caminho,filesep,projeto,'_Rings.tif']));
ytrans = 211;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
im = iSpeckle + iRings;
imtool(im)
imAligned = iSpeckle + imtranslate(iRings,[0, ytrans]);
imtool(imAligned)

