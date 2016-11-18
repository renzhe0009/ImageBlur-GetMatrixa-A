function testforgetmatrixa

Nx=10;
Ny=10;
%b=randn(3,3); 
%b=ones(3,3);
%b=[0 -1 0; -1 4 -1; 0 -1 0];%3*3 factor 
%b=[0,-1,0,-1,0;-1,0,0,0,-1;0,0,4,0,0;-1,0,0,0,-1;0,-1,0,-1,0];%5*5 factor
b=randn(3,3);
X=randn(Nx,Ny);
[Kx,Ky]=size(b);

% 
Y1=filter2(b,X,'same');
%Y1=conv2(X,b,'same');
%Y1=imfilter(X,b);

%
A = getmatrixaA(b, Nx, Ny);
x=X';
x=x(:);
y=A*x;
Y2=reshape(y,[Nx,Ny]);
Y2=Y2';

Y2=reshape(Y2',1,Nx*Ny);
Y1=reshape(Y1',1,Nx*Ny);

%error compute
err=sqrt(mean((Y2(:)-Y1(:)).^2));
disp(err)

if err<sqrt(eps)
    disp('right')
else
    disp('wrong')
end