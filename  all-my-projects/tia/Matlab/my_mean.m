function res = my_mean( x ,deep)
% ������� ��� ������� �������� ����������� �������
%   ������� ��������� ��� ������ �������� � +-deep ���������
y=x;
len=length(x);
for index=1:len
    st=(index-deep);
    en=(index+deep);
    if (st<1) st=1;end      %����� �� ����� �� ������� �������
    if (en>len) en=len; end
    y(index)=mean(x(st:en));
end
res=y;
end

