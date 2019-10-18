%Author Names: Mubasher Rashid and Amit Chakraborty 
%Publication: Rashid et al., (2019). Feedforward control of plant nitrate %transporter NRT1.1 biphasic adaptive activity. Biophysical Journal. 

clear all;
%close all;
clc;             
%format short;
tspan = 0:0.05:400;
x0 = [0.3 0.01 0.01];     

%RATE C01ONSTANTS(must be all positive)
a1=0.02;    %%check at 0.001,0.002     
a2=0.1;      %%check at 0.01       
a3=0.1;      %%check at 0.01,1      
b1=0;  
b2=0.1;            %%check at 0.01,0.5      
b3=0.3;       %%check at 0.1,1 
%fprintf('par a1=%f\n para a2=%f\n par a3=%f\n para b1=%f\n para b2=%f\n par b3=%f\n' ,a1, a2, a3, b1, b2, b3)

%AFFINITY PARAMETERS(MICHAELIS_CONSTANTS)and Hill Coefficient 
k1 =0.15; %0.05;        %%check at 2.5                 
k11=0.1;  %0.1;                         
k12=0.1;         %%check at 2.5                  
k2 =0.3; 
h1 =0.5;
h2 =2.6;          
%fprintf('par k1=%f\n par k11=%f\n par kr12=%f\n par k2=%f\n par h1=%f\n par h2=%f\n', k1, k11, k12, k2, h1, h2)

eps=0.02; %dummy index setting  
    
%PHASE-I
instepA1=linspace(0.1,25,100);  %% As per Cell paper, low nitrate conc. is 0.2 mM, while...
                                %  ... as high nitrate conc. is 25 mM.
ss=0;    
for i=1:length(instepA1)
    NIT(i)=instepA1(i)/25;
    NI=NIT(i);
    %NI=instepA1(i);
    [T1{i},X1{i}]= ode45(@(t,x) ODESystem_NRT1.1(t,x,NI,a1,a2,a3,b1,b2,b3,k1,k11,k12,k2,h1,h2),tspan,x0);
    l1=length(T1{i});
    s_index1=0; %dummy steady state index
    if (X1{i}>zeros(size(X1{i})))%condition for nonnegativity
        mm1(1,:)=mean(X1{i}(l1-30:l1,:)); %steady state values
        for k=1:10
            if(abs(X1{i}(l1+1-k,:)-mm1(1,:))<eps*ones(size(X1{i}(l1+1-k,:))))
                s_index1=s_index1+1 % psudo index for steady-state
            else
                s_index1=0
            end
        end
        if(s_index1==10)
            ss=1;
            disp('system is at steady state ');
            mm_s1(i,:)=mm1(1,:);
            %x3_rel1(i)=mm_s1(i,3)./(mm_s1(i,1)+mm_s1(i,2)+mm_s1(i,3))
            yy=mm_s1(:,3)/max(mm_s1(:,3))  %x3_normalized calculation
        else
            ss=0;
            disp('system is NOT reaching steady-state');
            break;
        end
    else
        disp('system is NOT satisfying positiveness condition');
        break;
    end
    %plot(tspan,X1{i}(:,3),'-')
    %hold on;
end

% X_Axis Scaling

ax1 = subplot(1, 2, 1);
plot(NIT(1:5)',yy(1:5),'-o','LineWidth',2)
hold on
ax2 = subplot(1, 2, 2);
plot(NIT(5:100)',yy(5:100),'-o','LineWidth',2)
set(ax1,'units','normalized','position',[0.1 0.1 0.4 0.8]);
set(ax2,'units','normalized','position',[0.5 0.1 0.4 0.8]);
set(ax1,'xlim',[0 0.04]);
set(ax2,'xlim',[0.041 1],'yticklabel','');
set([ax1 ax2],'ylim',[0 1.1],'ytick',0:0.1:1.1,'box','off');
set(ax2,'yticklabel','');
uistack(ax1,'top');
grid(ax1,'on');
grid(ax2,'on');

%xlswrite('abc_lyap_data.xls',[NIT',mm_s1]);