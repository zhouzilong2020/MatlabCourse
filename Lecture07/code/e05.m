%% 绘制散点图观察可能的曲线关系
x=0.1:0.01:0.18;
y=[42,41.5,45.0,45.5,45.0,47.5,49.0,55.0,50.0];
plot(x,y,'r*')

%% 通过观察散点图，可假设函数关系为线性关系：y=ax+b
x1=(0.1:0.01:0.18)';
y=[42,41.5,45.0,45.5,45.0,47.5,49.0,55.0,50.0]';
x=[ones(9,1),x1];
[b,bint,r,rint,stats]=regress(y,x);
b,bint,stats,figure,rcoplot(r,rint)

%% 结果分析
% 由p=0.0012<0.05知道在0.05的水平下拒绝原假设（H0：a=0），说明上述假设成立
% 观察残差图发现除了第8组数据外残差置信区间均包含零点，因此可认为第8组数据是异常的
% 剔除后再进行计算
x1=[0.1:0.01:0.16,0.18]';
y=[42,41.5,45.0,45.5,45.0,47.5,49.0,50.0]';
x=[ones(8,1),x1];
[b,bint,r,rint,stats]=regress(y,x);
b,bint,stats,figure,rcoplot(r,rint)