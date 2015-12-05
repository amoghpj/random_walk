clc;
clear;
rand('seed',getdate('s'));
X=[1];
Y=[1];
count=1;
while(X(count)>0 & Y(count)>0 & X(count)<6 & Y(count)<6 & count<50000)
    x=X(count);
    y=Y(count);
    if(~(((x-6)^2+(y-6)^2)<=16)) then
//      if( (x^2+y^2)<36) then
            if(rand()<0.5) then
              X(count+1)=x+0.1;
            else 
              X(count+1)=x-0.1;
            end; 
            if(rand()<0.5) then
              Y(count+1)=y+0.1;
            else 
              Y(count+1)=y-0.1;
            end;
    else
        if((6-x)>0) then
            X(count+1)=x+0.1;
        else
            X(count+1)=x-0.1
        end;
        if((6-y)>0) then
            Y(count+1)=y+0.1;
        else
            Y(count+1)=y-0.1;
        end;
        if(x==6 & y==6) then
            break;
        end;
//        if(rand()<1) then        //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
//              X(count+1)=x+0.1;
//            else 
//              X(count+1)=x-0.1;
//            end;                    //%Biased when line 10 is modified to restr
//            if(rand()<1) then    //%-ict unbiased random walk to a specified
//              Y(count+1)=y+0.1;     //%region
//            else 
//              Y(count+1)=y-0.1;
//            end;                    //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
////                   X(count+1)=x+0.1;
//                   Y(count+1)=y+0.1;  //%Biased to 45 degree line
     end;                             //%%%%%%%%%%%%%%%%%%%%%%%%%%%
count=count+1;
     if((X(count)<=0) | (Y(count)<=0)) then
            X(count)=x;
            Y(count)=y;
     end;
 
end;
theta=0:%pi/50:2*%pi;
xcent=6;
ycent=6;
r=4;
xdash=xcent+r*cos(theta);
ydash=ycent+r*sin(theta);
figure(1);
plot(xdash,ydash,'r');
i=1;
//plot(a,(16-(a-6)^2)^0.5+6,'g');
//plot(a,(36-a.^2)^0.5,'g');
comet(X(:),Y(:));
plot(X(1),Y(1),"o");
h_compound = gce();
h_compound.children.mark_size = 10;
h_compound.children.mark_background = 2;
h_axes = gca();
h_axes.data_bounds=[0,0;10,10];
//i=100;
//while i<=length(X)
//    plot(X(i),Y(i));
//end
//// Animation Loo
//Another comment
i = 1;
while i<=length(X)
    xs2bmp(0, 'i.bmp');
    drawlater();
    h_compound.children.data = [X(i),Y(i)];
    drawnow();
    i = i+1;
end
///This is a new comment to test git/
