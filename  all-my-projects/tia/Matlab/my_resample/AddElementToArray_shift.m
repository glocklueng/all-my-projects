function y = AddElementToArray_shift( x,insert_count )
%   ��������� � ������ ��������� ���������� ��������� � �������� ��������� 
%   �������� ����� �������������� ��������� �����
% �� ����� ��� ��������� �� ����� ��� len-1 ���������
y=[];
y=double(y);
%x=cell2mat(x);
%% ��������� ������ �����, �� ������� ����� ������� ������� ������,
new_length=length(x)+insert_count;
q=(new_length-1)/insert_count;
sum=0;
dr=0;
n=[];
while (sum<(new_length-1))
    int=dr+q;
    dr=int-round(int);
    int=round(int);
    sum=sum+int;
    n=[n,int];
end

%% ��������� ������� ������ �� ������ � �������� � ������ ������ �� ������ ��������
for i=1:length(n)
    b=x(1:n(i));
    y=[y(1:(end-1)),AddOneElement(b)];
    x=x(n(i):end);
end

end

function y = AddOneElement( x)
y=[x,0];
l=length(x);
x=double(x);
for i=2:l
    y(i)=((x(i-1)-x(i))*(i-1)/l)+x(i);
end
y(i+1)=x(i);
end
