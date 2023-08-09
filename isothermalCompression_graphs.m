close all;

p1_range = (100e3:1e3:60000e3);
L = length(p1_range);

volume = -ones(1,L);
energy_per_m3 = -ones(1,L);
idx = 1;
for p1 = p1_range
    [volume(idx), energy_per_m3(idx)] = isothermalCompression(100e3,p1);
    idx = idx+1;
end

figure;hold on;subplot(2,1,1);
plot(p1_range/100e3,-energy_per_m3/3600/1000,'LineWidth',3);
xlabel("pressure ratio [P1 / 100 kPa]",'FontSize',16);
ylabel("energy density [kWh / L]",'FontSize',16);

grid on;
subplot(2,1,2);
plot(p1_range/100e3,-energy_per_m3/1e6,'LineWidth',3);
xlabel("pressure ratio [P1 / 100 kPa]",'FontSize',16);
ylabel("energy density [MJ / m^3]",'FontSize',16);
grid on;

