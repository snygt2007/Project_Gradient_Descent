function [ Output_x1,grad_x1 ] = Get_loss_function_value_iclr( x1,i_iterations )
%Get_loss_function_value provides the Numerical value of the ICLR paper function at x1
% Input:
% Variable x1
% Number of iterations i_iterations

b_iteration_num = mod(i_iterations,3);
if b_iteration_num==1
    Output_x1 = 3.0.*x1;
    grad_x1 = 3.0;
else
    Output_x1 =-1.0.*x1;
    grad_x1 = -1.0;
end


end

