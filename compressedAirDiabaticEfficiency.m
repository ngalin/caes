function [P1_atAmbientT, percentage, energy_per_m3, T1, V1] = compressedAirDiabaticEfficiency(P1)

    polytropic_idx = 1.4;

    P0 = 100e3; %[Pa]
    V0 = mLtom3(1000); %[m3]
    T0 = 295; %[K]

    %P1 = 1.2e6; %[Pa]
    compression_ratio = exp(log(P1/P0) / polytropic_idx);
    V1 = V0/compression_ratio;
    T1 = (P1 /P0) * (1/compression_ratio) * T0; %[K]

    %what is the pressure drop when temperature T1 reaches T0 (ambient)
    P1_atAmbientT = P1 * (T0/T1);
    percentage = P1_atAmbientT / P1 * 100;
    work_done = (P0 * V0) / (polytropic_idx - 1) * (1 - compression_ratio^(polytropic_idx-1)); %polytropic compression
    
    work_done2 = P1 * 1 * log(P0/P1) + (P1 - P0) * 1; %isothermal compression, in 1m3
    %energy_per_m3 = -work_done2;
    energy_per_m3 = work_done * (percentage/100) / V1;
end