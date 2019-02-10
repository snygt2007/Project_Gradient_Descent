function [ ] = Plot_Store_Data( filename_store,function_string )
%Plot_Store_Data: Plots and Store data from the gradient descent
% Input:
% File name in which gradient data is stored
% Function instance specific string for plot file name
% Expected loss function value of -1.0 for ICLR and -2.0 for convex.
%% Get all the data from the iterations
delimiterIn = ' ';
headerlinesIn = 1;
text_write_matrix = importdata(filename_store,delimiterIn,headerlinesIn);
x1_val =text_write_matrix.data(:,1);
Loss_val=text_write_matrix.data(:,2);
%% Find the minimum value of the loss function
[min_val,i_index_min] = min((Loss_val(:)));
%% Plot values
h=plot(x1_val ,Loss_val);

min_loss_val=Loss_val(i_index_min)
set(h,'linewidth',3);
grid on;
title(['ADAM Gradient min value ' num2str(min_loss_val)]);
set(gcf,'color','white');
axis on;
xlabel('x1');
ylabel('Loss Function');
set(gca,'FontSize',25);
printfilename=strcat('CONVEX_diff_adam_Gradient_',function_string);
path_name = pwd;
filename.filepart1=path_name;
filename_store = fullfile(filename.filepart1,'Results',printfilename);
print(filename_store, '-dpng', '-r600');
end

