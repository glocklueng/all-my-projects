function y = AddElementToArray_no_shift( x,insert_count )
%   ��������� � ������ ��������� ���������� ��������� ��� ���������
%   �������� ��������� ���������
% �� ����� ��� ��������� �� ����� ��� len-1 ���������
len_old=length(x);
%x=cell2mat(x);
a=len_old/insert_count;  
indx=a:a:len_old;
indx=floor(indx);
new_matrix=x(1:indx(1)); %������ �����
 for i=2:(length(indx)) %��������� �����
    new_value=new_matrix(end)+x((indx(i-1)+1));
    new_value=new_value/2;
    new_matrix=[new_matrix,new_value];
    new_matrix=[new_matrix,x((indx(i-1)+1):indx(i))];% ��������� �����
end
new_value=new_matrix(end-1)+new_matrix(end);%����� ������� ���������� ��������
new_value=new_value/2;
new_matrix(end)=new_value;
new_matrix=[new_matrix,x(end)];
y=new_matrix;
end