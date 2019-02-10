function [  ] = Adam_Gradient_convex_ICLR(beta_2,loss_function_ID)
%Adam_Gradient_convex_ICLR: Implements the paper
%"ON THE CONVERGENCE OF ADAM AND BEYOND functions",
% S. J. Reddi, S. Kale, S. Kumar using
% ADAM Gradient Descent
% Input: beta_2 hyperparameter [0.1,0.999], loss_function_ID
% =['ICLR','convex']
% Output: Iteration Plot and Loss function value
% Author: Sanyogita Purandare
%
%% Clear all previous data and close plots
close all;clc;
format shortEng; % Set format
try
    %% Structure to set initial hyper-parameters
    Initial_val.x1 =0.5;
    Initial_val.m_t_prev_x1 =0.0;
    Initial_val.v_t_prev_x1=0.0;
    %% Structure for fix parameters
    fix_val.maxiterations = 1000;
    fix_val.x1Low = -1.0;
    fix_val.x1High = 1.0;
    fix_val.epsilon=10^-8;
    fix_val.Step_size_x1 = 0.5;
    fix_val.alpha =0.001;
    fix_val.beta1 =0.9;
    fix_val.beta2 = beta_2;
    i_iterations=0;
    function_string = loss_function_ID;
    s_iclr_paper = 'ICLR';
    %% File storage parameters
    path_name = pwd;
    filename.filepart1=path_name;
    filename.filepart2='Adam_convex_iclr_store_';
    filename.filepart3 = num2str(Initial_val.x1,'%5.2f');
    filename.filepart4 = strcat(filename.filepart2,filename.filepart3,'.txt');
    filename_store = fullfile(filename.filepart1,filename.filepart4);
    fileID = fopen(filename_store,'w');
    fprintf(fileID,'%6s     %6s     %6s     %6s  \r\n','x_1  ','f_x1','grad_x1  ','x_1_step ');
    
    %% Iteration paramters
    Iteration_val.x1 =Initial_val.x1;
    Iteration_val.Step_size_x1 =fix_val.Step_size_x1;
    Iteration_val.m_t_prev_x1 =Initial_val.m_t_prev_x1;
    Iteration_val.v_t_prev_x1=Initial_val.v_t_prev_x1;
    Iteration_val.grad_x1 = 0.0;
    %% Gradient Iterations
    while i_iterations <= fix_val.maxiterations &&  Iteration_val.x1 >= fix_val.x1Low && Iteration_val.x1 <= fix_val.x1High% && A > 0.0 && B > 0.0 && A > B
        i_iterations = i_iterations+1;
        %% Obtain J(theta) and gradient descent to minimize J using theta parameters
        if strcmp(function_string,s_iclr_paper) == 0
            [function_x1,Iteration_val.grad_x1] = Get_loss_function_value_convex(Iteration_val.x1);
        else
            [function_x1,Iteration_val.grad_x1] = Get_loss_function_value_iclr(Iteration_val.x1,i_iterations);
        end
        
        %% Store intermediate results
        text_write_matrix = [Iteration_val.x1; function_x1; Iteration_val.grad_x1 ; Iteration_val.Step_size_x1];
        fprintf(fileID,'%7.5e  %7.5e  %7.5e  %7.5e  \r\n',text_write_matrix);
        %% Increment steps
        m_t_x1 = fix_val.beta1.*Iteration_val.m_t_prev_x1 +(1- fix_val.beta1).*Iteration_val.grad_x1;
        v_t_x1 = fix_val.beta2.*Iteration_val.v_t_prev_x1 +(1- fix_val.beta2).*(Iteration_val.grad_x1).^2;
        m_t_x1_cap=m_t_x1/(1-(fix_val.beta1)^(i_iterations));
        v_t_x1_cap=v_t_x1/(1-(fix_val.beta2)^(i_iterations));
        
        Iteration_val.Step_size_x1 = fix_val.alpha.*m_t_x1_cap/(sqrt(v_t_x1_cap)+fix_val.epsilon);
        Iteration_val.m_t_prev_x1 = m_t_x1;
        Iteration_val.v_t_prev_x1 = v_t_x1;
        Iteration_val.x1= Iteration_val.x1-Iteration_val.Step_size_x1;
    end
    fclose(fileID);
    %% Plot and Store Data
    Plot_Store_Data(filename_store,function_string);
catch ME
    fprintf(1,'There was an error! The message was:\n%s',ME.message);
end


