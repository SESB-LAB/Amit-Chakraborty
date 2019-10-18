%Author Names: Mubasher Rashid and Amit Chakraborty
%Publication: Rashid et al., (2019). Feedforward control of plant nitrate %transporter NRT1.1 biphasic adaptive activity. Biophysical Journal.

function dx = ODESystem_NRT1.1(t,x,NI,a1,a2,a3,b1,b2,b3,k1,k11,k12,k2,h1,h2)
%NI=instep+heaviside(t-stepdur)*instep1;
dx=zeros(3,1);
%CHL1_signalling system...
%x(1)=CHL1,x(2)=CHL1_CBL9-CIPK23,x(3)=CHL1-P
dx(1)= (a1*NI*x(1)^h1/(k1+x(1)^h1))-(b1*x(1)*x(3)); %Ref: U_Alon PNAS
dx(2)= (a2*x(1)/(k11+x(1)))*1/(k1+x(1)^h1)-(b2*x(2)/(k12+x(2))); %Ref: Ultrasensitivity part-I  %*1/(k1+x(1)^h1)
dx(3)= (a3*((x(1)^h1/(k1+x(1)^h1))+1)*x(2)^h2/(k2+x(2)^h2))-b3*x(3); %Gate function construction
return     