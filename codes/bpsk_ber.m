
%%SNR values in db
SNR_db = linspace(0,9,10);
%%SNR values
SNR = 10.^(0.1.*SNR_db);
%%simulated ber declaration
err_sim = [];
%%analytical ber declaration
err_ana = [];
simlen = 100000;
for i = 1:10
    n = normrnd(0,1,[1,simlen]);
    rx = sqrt(SNR(i)) + n;
    
    %%storing indices of rx<0
    idx = rx<0;
    neg = rx(idx);
    %%calculating simulation error
    err_sim = [err_sim,(length(neg))/simlen];
    %%calculating analytical error
    a = 0.5*erfc((sqrt(SNR(i)))/sqrt(2));
    err_ana = [err_ana,a];
end
semilogy(SNR_db,err_ana);

hold on
xlabel('E_b/N_o');
ylabel('p_e');
semilogy(SNR_db,err_sim,'o');
hold off






