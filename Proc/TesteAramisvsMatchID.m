

Load = importdata([caminho,angle,filesep,projeto,filesep,projeto,'_load','.dat']);
Load.data= Load.data-Load.data(1);
Load.data = Load.data*100;

figure()
plot(Load.data,'-k'); hold on
plot(aramis2D.load*(100/aramis2D.loadCFact), '-b'); 
plot(MatchID.load, '-r'); 

Index=aramis2D.strain(35).X
Strain = mean(Index(~isnan(Index)))

Force = Strain*1900*Ly*thickness


figure()
subplot(2,1,1)
imagesc(aramis2D.displ(35).X);colorbar
subplot(2,1,2)
imagesc(MatchID.u.s35);colorbar

figure()
subplot(2,1,1)
imagesc(aramis2D.displ(35).Y);colorbar
subplot(2,1,2)
imagesc(MatchID.v.s35);colorbar

figure()
subplot(2,1,1)
imagesc(aramis2D.strain(35).X);colorbar
subplot(2,1,2)
imagesc(MatchID.exx.s35);colorbar

figure()
subplot(2,1,1)
imagesc(aramis2D.strain(35).Y);colorbar
subplot(2,1,2)
imagesc(MatchID.eyy.s35);colorbar

figure()
subplot(2,1,1)
imagesc(-aramis2D.strain(35).S);colorbar
subplot(2,1,2)
imagesc(MatchID.exy.s35);colorbar


%chaging theta angle

% load([caminho,angle,filesep,projeto,filesep,projeto,'_theta',script.mat]);
% theta = deg2rad(0.3)
% 
% filenome2 = [caminho,angle,filesep,projeto,filesep,projeto,'_theta',script.mat];
% save(filenome2,'pos','theta');




