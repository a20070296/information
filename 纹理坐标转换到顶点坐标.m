 a=[];b=[];x0=[];y0=[];
 
 
 yv = zeros(3,1); xv = yv;xv1=xv;yv1=yv;
 c=zeros(441,1)*NaN;d=c;
 a0=x0;b0=y0;
for m=  1  :  21  %ÐÐ1-21,x - ¡ú  ÊúÏß
for n=  1  :  21    %ÁÐ1-21,x + ¡û
    t=21*(m-1)+n;
    for mm=1:20;
    for nn=1:20;
        t1= 21*(mm-1)+nn;
        xv(1,1)=a(t1,1);xv(2,1)=a(t1+1,1);xv(3,1)=a(t1+22,1);
        yv(1,1)=b(t1,1);yv(2,1)=b(t1+1,1);yv(3,1)=b(t1+22,1);
        xv1(1,1)=a(t1,1);xv1(2,1)=a(t1+22,1);xv1(3,1)=a(t1+21,1);
        yv1(1,1)=b(t1,1);yv1(2,1)=b(t1+22,1);yv1(3,1)=b(t1+21,1);
        if(inpolygon(x0(t,1),y0(t,1),xv,yv))
           [u v]=solve('x0(t,1)=(1-u-v)*xv(1,1)+u*xv(2,1)+v*xv(3,1)','y0(t,1)=(1-u-v)*yv(1,1)+u*yv(2,1)+v*yv(3,1)');
           u=eval(u);v=eval(v);
           c(t,1)=(1-u-v)*a0(t1,1)+u*a0(t1+1,1)+v*a0(t1+22,1);
           d(t,1)=(1-u-v)*b0(t1,1)+u*b0(t1+1,1)+v*b0(t1+22,1);
        else if (inpolygon(x0(t,1),y0(t,1),xv1,yv1))
           [u v]=solve('x0(t,1)=(1-u-v)*xv1(1,1)+u*xv1(2,1)+v*xv1(3,1)','y0(t,1)=(1-u-v)*yv1(1,1)+u*yv1(2,1)+v*yv1(3,1)'); 
           u=eval(u);v=eval(v);
           c(t,1)=(1-u-v)*a0(t1,1)+u*a0(t1+22,1)+v*a0(t1+21,1);
           d(t,1)=(1-u-v)*b0(t1,1)+u*b0(t1+22,1)+v*b0(t1+21,1);    
            end
        end
    end
    end
end
end