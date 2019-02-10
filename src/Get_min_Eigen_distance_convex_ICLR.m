function [ batch_function_AB,batch_function_AB_A_incre] = Get_min_Eigen_distance_convex_ICLR(A,Step_size_A,i_iterations)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
format shortEng;
batch_function_AB = 0.0;
batch_function_AB_B_incre = 0.0;
batch_function_AB_A_incre = 0.0;
Detection_count_AB =0;
Detection_count_AB_B_incre = 0;
Detection_count_AB_A_incre = 0;
Detection_count_AB_17 =0;
Detection_count_AB_B_17_incre = 0;
Detection_count_AB_A_17_incre = 0;
i_total_tripole = 20;
b = mod(i_iterations,3);
 
if b == 1
Detection_count_AB = 3*A;
else
    Detection_count_AB = -A;
end
if b == 1
% [Detection_count]=New_trial_Simulated_training_blur_another_parallel(Input_experimental_image,tripole_shifts_1,tripole_shifts_2,B+Step_size_B,A,r_size,Index_defect_array,path_name);
Detection_count_AB_A_incre = 3*(A+Step_size_A);
else
  Detection_count_AB_A_incre = -(A+Step_size_A);
end  



% H_theta=1/(1+exp(-(Detection_count_AB)));
% H_theta_B_incre = 1/(1+exp(-(Detection_count_AB_B_incre)));
% H_theta_A_incre = 1/(1+exp(-(Detection_count_AB_A_incre)));
% batch_function_AB = -log(H_theta);
% batch_function_AB_B_incre = -log(H_theta_B_incre);
% batch_function_AB_A_incre = -log(H_theta_A_incre);
H_theta=Detection_count_AB;
H_theta_A_incre =Detection_count_AB_A_incre;
batch_function_AB = H_theta;
batch_function_AB_A_incre = H_theta_A_incre;
end    

