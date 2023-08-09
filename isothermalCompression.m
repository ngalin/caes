function [V_A, W] = isothermalCompression(p_A,p_B)
%V_A = ?; %[m3]
V_B = 1; %[m3]

%work to go from p_A/V_A to p_B/V_B:

W = p_B * V_B * log(p_A/p_B) + (p_B - p_A)*V_B; %[J]
V_A = p_B / p_A * V_B;

end


