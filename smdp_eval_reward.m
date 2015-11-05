function [reward]=smdp_eval_reward(ind_s1,ind_a,p)


global sizeS
global sizeA
[u1,l1,m1,e1]=ind2sub(sizeS,ind_s1);
[a_display,a_gps]=ind2sub(sizeA,ind_a);


global u_display
global u_gps
global r_outage
global experience
for i=1:prod(sizeS)
    for j=1:prod(sizeA)
        experience(i,j)=u_display(u1,l1,a_display)+u_gps(a_gps,m1);
        if e1==1
            experience(i,j)=experience(i,j)+r_outage;
        end
    end
end
experience=experience.*0.1;



global discount
global lambda_u
global lambda_l
global lambda_m
global lambda_e
lambda=lambda_u+lambda_l+lambda_m+lambda_e(a_display,a_gps);

sump=sum(p(ind_s1,:,ind_a));
exp=experience(ind_s1,ind_a);
reward=sump*exp/(lambda+discount);

end
