% �������������� ������ ��� �������� ���������
load('data_120115_3.mat','ForceArray','PressArray','LengthArray','ValveInPowerArray','ValveOutPowerArray','ValveInCountArray','ValveOutCountArray');

before=4;
after=3;

%% �������������� ������
% f1=ForceArray;
% p1=PressArray;
f1=my_mean(ForceArray,3);
p1=my_mean(PressArray,3);


% ������ ������� ������ ����������
% l1=LengthArray; 
l=l_calc;

v1=ValveInPowerArray;
v2=ValveOutPowerArray;
c1=ValveInCountArray;
c2=ValveOutCountArray;

%% �������� ������ ��������� ��������� ��������
index=2:length(c1);
bc1(index)=c1(index-1)~=c1(index);
index=2:length(c2);
bc2(index)=c2(index-1)~=c2(index);

%% ������� �������� �� ���� �����, ����� ����� ���������
index=~bc1;
v1(index)=0;
index=~bc2;
v2(index)=0;

%% ������� ����� ���������, ��� ������ ��� ������
bc1=v1>0;
bc2=v2>0;
bc=bc1|bc2;
%% ��������� vector ������ ��� ��������.
index=find(bc);

press=[];
force=[];
speed_a=[];
speed_b=[];
len_calc=[];
valve_in=[];
valve_out=[];
point_ind=[];

i=0;
for i=index
    if (i<before) continue; end; % ���� �� ����� �� ������� �������
    if (i>(length(bc)-after)) continue; end;
    if any(bc((i-before):(i-1))) continue; end;% �� ��������� ��������� ���� ������ ��������� ��������
    if any(bc((i+1):(i+after))) continue; end;% �� ��������� ��������� ���� ������ ��������� ��������
    s_before=mean(l((i-before):(i-1)))-l(i-1);
    s_after=l(i-1)-mean(l((i-1):(i+after+1)));
    p=p1((i-before):i);
    f=f1((i-before):i);
    ind=i; % ����� ����� ��������� ������ ����� ����
    press=[press; p];
    force=[force; f];
    len_calc=[len_calc; l((i-before):i)];
    speed_a=[speed_a;s_after];
    speed_b=[speed_b; s_before];
    point_ind=[point_ind; ind];
    valve_in=[valve_in; v1(i)];
    valve_out=[valve_out;v2(i)];
end

%% ����� ���������  - ��������������� ������
len=length(PressArray);
res_press=zeros(1,len);
res_force=zeros(1,len);
res_valve_in=zeros(1,len);
res_speed=zeros(1,len);
i=0;
for i=1:length(press)
    ind=point_ind(i);
    res_press((ind-before):ind)=press(i,1:before+1);
    res_force((ind-before):ind)=force(i,1:before+1);
    res_valve_in(ind)=valve_in(i);
    res_speed(ind-1)=speed_b(i);
    res_speed(ind+1)=speed_a(i);
    
end
%% �������������� ������


p1=p1-200000;
p1=p1.*0.002;

res_press=res_press-200000;
res_press=res_press.*0.002;
res_press(res_press==-400)=0;

l=l_calc+4000;
l=l.*0.1;

res_valve_in=res_valve_in+1;
%% ������ �������
st=6400;
en=6500;
hold on
axis auto
xlim([st,en])

plot(res_valve_in,'r');
plot(v1,'m');
plot(res_press,'r');
plot(p1,'m');
plot(l,'r');
plot(res_speed,'b');


