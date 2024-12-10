tic

%epss=1;
%epss=0.1;

user_X=300;
ExNumber=640;

M=4;  %基站天线数
N=512;          %RIS单元数

Ps_max=10;        %基站最大功率限制 mW
Pr_max=Ps_max;        %PA-RIS最大功率限制 mW

sigma2 = 10^(-10);

sigmar2=sigma2;

f_c=5;      %载频

K=4;            %用户数量
eta_k=ones(K,1);%权值

large_fading_AI=2.2;
large_fading_DI=2.2;

SI_factor_dB=[-40:5:-20];

SI_factor = 10.^(SI_factor_dB/10);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Rsum=zeros(length(SI_factor),ExNumber);
Rsum_noRIS=zeros(length(SI_factor),ExNumber);
Rsum_passive=zeros(length(SI_factor),ExNumber);
Rsum_random=zeros(length(SI_factor),ExNumber);
Rsum_SI=zeros(length(SI_factor),ExNumber);
Rsum_SI_no=zeros(length(SI_factor),ExNumber);

for a=1:length(SI_factor)
    fprintf('第%d轮\n',a);
    parfor b=1:ExNumber
        [Dis_BStoRIS, Dis_BStoUser, Dis_RIStoUser]=Position_generate_2(K,user_X);    %基站RIS用户位置设置
        [ h_k,f_k,G] = Channel_generate2(K,N,M,large_fading_AI,large_fading_DI,Dis_BStoRIS,Dis_BStoUser,Dis_RIStoUser,f_c);

        Theta=diag(exp(1j*2*pi*rand(N,1)));
        W=exp(1j*2*pi*rand(K*M,1))*sqrt(Ps_max/K/M);
        
        [W, Rsum_noRIS(a,b)]= NoRIS_precoding(M,K,N,Ps_max,sigma2,eta_k,W,h_k,f_k,G);
%        Rsum_noRIS(a,b)=0;
        [W, ~, Rsum_random(a,b)]= random_RIS_precoding(M,K,N,Ps_max,sigma2,eta_k,Theta,W,h_k,f_k,G);

        [W, Theta, Rsum_passive(a,b)]= passive_RIS_precoding(M,K,N,Ps_max,sigma2,eta_k,Theta,W,h_k,f_k,G);
        Theta=100*Theta;
        
        [W,Theta,Rsum(a,b)]= active_RIS_precoding(M,K,N,Ps_max*0.99,Pr_max*0.01,sigma2,sigmar2,eta_k,Theta,W,h_k,f_k,G);
        
        [W,Rsum_SI(a,b),Rsum_SI_no(a,b)]= active_RIS_precoding_SI(M,K,N,Pr_max*0.01,sigma2,sigmar2,Theta,W,h_k,f_k,G,SI_factor(a));

    end
end

Rsum_mean=mean(Rsum,2);
Rsum_SI_mean=mean(Rsum_SI,2);
Rsum_SI_no_mean=mean(Rsum_SI_no,2);
Rsum_noRIS_mean=mean(Rsum_noRIS,2);
Rsum_passive_mean=mean(Rsum_passive,2);
Rsum_random_mean=mean(Rsum_random,2);

figure;
hold on;
box on;
grid on;
plot(SI_factor_dB,Rsum_mean,'-r^','LineWidth',1.5);
plot(SI_factor_dB,Rsum_SI_mean,'--g<','LineWidth',1.5);
plot(SI_factor_dB,Rsum_SI_no_mean,'-gp','LineWidth',1.5);
plot(SI_factor_dB,Rsum_passive_mean,'-bo','LineWidth',1.5);
plot(SI_factor_dB,Rsum_random_mean,'-m>','LineWidth',1.5);
plot(SI_factor_dB,Rsum_noRIS_mean,'--k','LineWidth',1.5);
xlabel('SI factor (dB)','Interpreter','latex');
ylabel('Sum-rate (bps/Hz)','Interpreter','latex');

set(gca,'FontName','Times','FontSize',12);

legend('Active RIS (Algorithm 1)','SI cancellation','No cancellation','Passive RIS [24]','Random phase shift [46]','Without RIS [46]','Interpreter','latex','FontSize',12);

save('main_4_2_plus.mat','Rsum_mean','Rsum_SI_mean','Rsum_SI_no_mean','Rsum_passive_mean','Rsum_random_mean','Rsum_noRIS_mean');

toc
