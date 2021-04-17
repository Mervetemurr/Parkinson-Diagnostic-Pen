clc;
clear all;

comport = serial('COM5','BaudRate',115200);
fopen(comport);
x=0;
while(x<100)
x=x+1;
y1(x)=fscanf(comport, '%d');  
y2(x)=fscanf(comport, '%d');  
y3(x)=fscanf(comport, '%d');  
plot(y1,'r','linewidth',1)
hold on;
plot(y2,'b','linewidth',1)
plot(y3,'g','linewidth',1)

hold off
drawnow
end
fclose(comport);
delete(comport);