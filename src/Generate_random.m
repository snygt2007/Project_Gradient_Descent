function [ output_args ] = Untitled( input_args )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
path_name = 'E:\Sping_2018\Cross_validation_algorithm\Letter_Draft\Cost_parameters\Output_Files\Nondiff_Nonconvex_NormalRandom';
filepart1=path_name;
filepart2='Normal_Random_numbers.txt';
filename = fullfile(filepart1,filepart2);
fileID = fopen(filename,'w');
fprintf(fileID,'%6s \r\n','Count  ');
for i = 1:5
n_count = randn();
fprintf(fileID,'%7.5e\r\n',n_count);
end
fclose(fileID);
end

