function res = myresample( x,len_new,shift )
if (nargin ~= 3)% ���� �� ��������, �� ������������ ������� �� ���������
    shift='shift' ;
end
x=x';
    
%x=double(x);
len_old=length(x);
if (len_old<len_new) %�������� ��������
    while ((len_new-len_old)>(len_old-1)) %��������� ����� ��� � 2 ���� -1
       if (strcmp(shift,'noshift'))x=AddElementToArray_no_shift(x, len_old-1);end
       if (strcmp(shift,'shift'))x=AddElementToArray_shift(x, len_old-1);end
       len_old=length(x);
    end
    if (strcmp(shift,'noshift'))x=AddElementToArray_no_shift(x,len_new- len_old);end
    if (strcmp(shift,'shift'))x=AddElementToArray_shift(x,len_new- len_old);end
end
if (len_old>len_new) % ������� ������ ��������
    while ((len_new*2)<len_old)
         if (strcmp(shift,'noshift'))x=DelElementFromArray_no_shift(x,len_old/2);end
         if (strcmp(shift,'shift'))x=DelElementFromArray_shift(x,len_old/2);end
         len_old=length(x);
    end
    if (strcmp(shift,'noshift')) x=DelElementFromArray_no_shift(x,len_old-len_new);end
    if (strcmp(shift,'shift')) x=DelElementFromArray_shift(x,len_old-len_new);end
end
res=x';
end

