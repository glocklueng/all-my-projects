function y = GetVectorFromArray( x,deep )
% GetVector ������ �� ����������� ������� - ���������,
% �������� ������ �� �������
for index=1:deep
  y(index,:)=x(index:(length(x)-deep+index));  
end
end

