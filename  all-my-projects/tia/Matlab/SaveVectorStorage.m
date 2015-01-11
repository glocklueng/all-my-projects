% ����������     0 � ������ ������
%                1- ����������� ����� ����
function res= SaveVectorStorage(path, filename )
%��������� ������������ ����
if (exist(path,'dir')~=7) 
    res=1;
    return;
end;

if (strcmp(filename,'')) 
    filename='noname.mat'; 
end;

global ForceArray;
global PressArray;
global LengthArray;
global ValveInPowerArray;
global ValveOutPowerArray;
global ValveInCountArray;
global ValveOutCountArray;
old_dir=cd(path);
save(filename,'ForceArray','PressArray','LengthArray','ValveInPowerArray','ValveOutPowerArray','ValveInCountArray','ValveOutCountArray');
cd(old_dir);
res=0;
end

