function [  Output_x1,grad_x1 ] = Get_loss_function_value_convex( x1 )
%Get_loss_function_value provides the Numerical value of a convex function at x1
% Input:
% Variable x1
% Number of iterations i_iterations
Output_x1 = x1.^2;
grad_x1 = 2.*x1;
end

