function y = DelElementFromArray_no_shift( x,delete_count )
%   ������� �� ������� ��������� ���������� ��������� �� ������� ��������
%   ��������� ���������
len_old=length(x);
%%x=cell2mat(x);
a=len_old/delete_count;  
indx=a:a:len_old;
indx=floor(indx);
%x(indx-1)=(x(indx-1)+x(indx))/2;
x(indx)=[];
y=x;
end
