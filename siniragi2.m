%Sinir Agi olusturma ve egitilmesi
function[vcikti,vld_hedef] = siniragi2(n1,n2,loran, training_oran)
%input= sensor degerleri
%output=hastalik durumlari
%training_oran=Verilerin yuzde kacinin training icin kullanilacagini belirleme orani.
%Girdiyi ve ciktilarini training ve validation olarak ayir
%NN olusturup training verileriyle agi egitecegiz.
%Validation verilerini aga girdi olarak verecegiz. Egitilmis agdan cikan
%ciktilarla gercek ciktilari karsilastiracagiz
% Verilerin training ve validation ayrimi yapilir
verisayisi=size(giris,1);
trnsayi=round(verisayisi*training_oran);
trn_girdi=giris(1:trnsayi,:);
vld_girdi=giris(trnsayi+1:end,:);

trn_hedef=cikis(1:trnsayi,:);
vld_hedef=cikis(trnsayi+1:end);
%Verilerin sutunlarda olmasi icin transpozunu almaliyiz
trn_girdi=trn_girdi';
vld_girdi=vld_girdi';
trn_hedef=trn_hedef';
vld_hedef=vld_hedef';
%loran=learning rate yani ogrenme orani
net=newff(trn_girdi, trn_hedef, [n1,n2], {}, 'trainlm');
net.trainParam.lr=loran;
net.trainParam.epochs=1000;
net.trainParam.goal=1e-20;
net.trainParam.show=NaN; %Sonuclari train bitinceye kadar gosterme
%Agi egitme
net=train(net,trn_girdi,trn_hedef);
%Simule etme
vcikti=sim(net,vld_girdi);
vcikti=round(vcikti);
end

