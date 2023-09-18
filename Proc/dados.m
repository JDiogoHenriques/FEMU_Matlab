% dados_Exp = [4.316094978	0.000593796	0.000594092
% 4.60515708	0.000692351	0.000668461
% 4.900838439	0.000791146	0.000746581
% 5.202078277	0.000915703	0.000836105
% 5.509788863	0.001032788	0.000920808
% 5.821254604	0.001164645	0.001004721
% 6.136305776	0.001293908	0.001126527
% 6.452141924	0.001443165	0.00122862
% 6.768147796	0.001605831	0.00134193
% 7.083114106	0.001758042	0.001474337
% 7.39748638	0.001934156	0.001581329
% 7.705154534	0.002109669	0.001707537
% 8.008134048	0.002307016	0.001838244
% 8.305173204	0.002494185	0.001963297
% 8.596038629	0.002693191	0.002093353
% 8.879117942	0.002898134	0.002229112
% 9.154580865	0.003106572	0.002369767
% 9.421324191	0.003320624	0.002512773
% 9.680196541	0.003532641	0.00265576
% 9.931006976	0.003749075	0.002787917
% 10.17324632	0.003971888	0.002936712
% 10.40810265	0.004194	0.003065596
% 10.63205418	0.00441298	0.003223334
% 10.84794379	0.004641752	0.003370662
% 11.05339534	0.004872937	0.003505935
% 11.2506789	0.005101432	0.003643123
% ];
% 
% cftool(dados_Exp(:,2),dados_Exp(:,1))
% 
% (dados_Exp(end,1)-dados_Exp(1,1))/(dados_Exp(end,2)-dados_Exp(1,2))
% 
% E1 = dados_Exp(end,1)/dados_Exp(end,2);
% E2 = dados_Exp(1,1)/dados_Exp(1,2);
% 
% Mean_E = mean([E1;E2])
% 
% eps_xx_s25 = MatchID.exx.s25;

% abs(mean(eps_xx_s25(~isnan(eps_xx_s25))))

%% MatchID

M_eps_xx =zeros(MatchID.stages,1);
M_eps_yy =zeros(MatchID.stages,1);
M_eps_xy =zeros(MatchID.stages,1);

for i=1:MatchID.stages
    
  eval(['aux = MatchID.exx.s',num2str(i),';'])
  M_eps_xx (i)= abs(mean(aux(~isnan(aux))));
  
  eval(['aux1 = MatchID.eyy.s',num2str(i),';'])
  M_eps_yy (i)= abs(mean(aux1(~isnan(aux1))));
  
  eval(['aux2 = MatchID.exy.s',num2str(i),';'])
  M_eps_xy (i)= abs(mean(aux2(~isnan(aux2))));
  
end

M_Force = abs(MatchID.load);


%% Aramis2D

M_eps_xx =zeros(aramis2D.stages,1);
M_eps_yy =zeros(aramis2D.stages,1);
M_eps_xy =zeros(aramis2D.stages,1);

for i=1:aramis2D.stages
    
  eval(['aux = aramis2D.strain(',num2str(i),').X;'])
  M_eps_xx (i)= abs(mean(aux(~isnan(aux))));
  
  eval(['aux1 = aramis2D.strain(',num2str(i),').Y;'])
  M_eps_yy (i)= abs(mean(aux1(~isnan(aux1))));
  
  eval(['aux2 = aramis2D.strain(',num2str(i),').S;'])
  M_eps_xy (i)= abs(mean(aux2(~isnan(aux2))));
  
end

M_Force = abs(aramis2D.load);

figure()
title('Force\Stages','FontName','Times New Roman','FontSize',13)
plot(M_Force(1:end-1));
xlim([0.001 aramis2D.stages]);
xlabel('Stages','FontName','Times New Roman','FontSize',13)
ylabel('Force, N','FontName','Times New Roman','FontSize',13)


figure()
title('Strain\Stress','FontName','Times New Roman','FontSize',13)
plot(M_eps_xx(1:end-1),M_Force(1:end-1)./13.7414);
xlabel('Eps_X','FontName','Times New Roman','FontSize',13)
ylabel('Stress, MPa','FontName','Times New Roman','FontSize',13)

