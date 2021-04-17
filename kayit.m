%Sensor verilerinin kayit edilmesi
comport = serial('COM5','BaudRate',115200);
fopen(comport);
x=0;
while(x<100)
x=x+1;comport = serial('COM5','BaudRate',115200);
fopen(comport);
x=0;
y1(x)=fscanf(comport, '%d');   
y2(x)=fscanf(comport, '%d');  
y3(x)=fscanf(comport, '%d');  
end
f1=[y1(); y2();y3()];
a=f1.^2;
b=a(1,:)+a(2,:)+a(3,:);
c=sqrt(b);
ort2=c;
fclose(comport);
dosya=fopen('file1.txt','w');
