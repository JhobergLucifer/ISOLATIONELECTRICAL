
ni=1000;
nx=21;
ny=21;
a=10;
b=10;
px=5;
py=10;
volt1=200;
volt2=100;
tol=10E-9;
rel=1.9;
px2=8;
py2=13;
b2=4;
a2=4;

v1=0;
v2=0;
v3=0;
v4=0;

v5=volt2;
v6=volt2;
v7=volt2;
v8=volt2;
function v=delta(nx,ny,v,mask)
	for i=2:nx-1
		for j=2:ny-1
	        
			    v(i,j)=v(i,j)+mask(i,j)*(0.25*(v(i+1,j)+v(i-1,j)+v(i,j+1)+v(i,j-1))-v(i,j));
			   
        end 
    end
	
	i = 1;
	for j = 2:ny-1
		v(i,j) = v(i,j)+mask(i,j)*(0.25*( v(i+1,j) + v(i+1,j) + v(i,j-1) + v(i,j+1)) - v(i,j));
	end
% Simetría en la parte inferior de límites j-1 -> j+1
	j = 1;
	for i = 2:nx-1
			v(i,j) = v(i,j)+mask(i,j)*(0.25*( v(i-1,j) + v(i+1,j) + v(i,j+1) + v(i,j+1)) - v(i,j));
	end
	
endfunction

function cap=gauss(nx,ny,v)
	q=0;
	for j=1:ny-1
		q=q+(v(nx-1,j)+v(nx-1,j+1))*0.5;
	end
	
	for i=1:nx-1
	   q=q+(v(i,ny-1)+v(i+1,ny-1))*0.5;
	end
	cap=q*4;
	cap=cap*8.854187*1E-12
	
endfunction

function cap2=gauss2(px2,py2,a2,b2,v)
	q=0;
	for j=py2:py2+b2-1
		q=q+(v(px2-1,j)+v(px2-1,j+1))*0.5;
	end

	for i=px2:px2+a2-1
	   q=q+(v(i,py2-1)+v(i+1,py2-1))*0.5;
	end
		
	cap2=q*4;
	cap2=cap2*8.854187*1E-12*2.5;
	
endfunction

v=zeros(nx,ny);
mask=ones(nx,ny)*rel;
for i=2:nx-1
  v(i,1)=v1;
  v(i,ny)=v3;
end
for j=2:ny-1
    v(1,j)=v4;
    v(nx,j)=v2;
end
v(1,1)=0.5*(v1+v4);
v(nx,1)=0.5*(v1+v2);
v(1,ny)=0.5*(v3+v4);
v(nx,ny)=0.5*(v2+v3);



%conductor 1 

for j = py:py+b
     aux=j-py;
     switch aux
	 case 0, 
			v(px+4,j)  = volt1;
           	mask(px+4,j)=0;
			v(px+5,j)  = volt1;
			mask(px+5,j)=0;
			v(px+6,j)  = volt1;
           	mask(px+6,j)=0;
	 case 1,
			v(px+2,j)  = volt1;
           	mask(px+2,j)=0;
			v(px+3,j)  = volt1;
           	mask(px+3,j)=0;
			v(px+4,j)  = volt1;
           	mask(px+4,j)=0;
			v(px+5,j)  = volt1;
           	mask(px+5,j)=0;
			v(px+6,j)  = volt1;
           	mask(px+6,j)=0;
			v(px+7,j)  = volt1;
           	mask(px+7,j)=0;
	case 2,
			v(px+1,j)  = volt1;
           	mask(px+1,j)=0;
			v(px+2,j)  = volt1;
           	mask(px+2,j)=0;
			v(px+3,j)  = volt1;
           	mask(px+3,j)=0;
			v(px+4,j)  = volt1;
           	mask(px+4,j)=0;
			v(px+5,j)  = volt1;
           	mask(px+5,j)=0;
			v(px+6,j)  = volt1;
           	mask(px+6,j)=0;
			v(px+7,j)  = volt1;
           	mask(px+7,j)=0;
			v(px+8,j)  = volt1;
           	mask(px+8,j)=0;
	case 3,
			v(px,j)  = volt1;
           	mask(px,j)=0;
			v(px+1,j)  = volt1;
           	mask(px+1,j)=0;
			v(px+2,j)  = volt1;
           	mask(px+2,j)=0;
			v(px+3,j)  = volt1;
           	mask(px+3,j)=0;
			v(px+4,j)  = volt1;
           	mask(px+4,j)=0;
			v(px+5,j)  = volt1;
           	mask(px+5,j)=0;
			v(px+6,j)  = volt1;
           	mask(px+6,j)=0;
			v(px+7,j)  = volt1;
           	mask(px+7,j)=0;
			v(px+8,j)  = volt1;
           	mask(px+8,j)=0;
			v(px+9,j)  = volt1;
           	mask(px+9,j)=0;	
	case 4,
			v(px,j)  = volt1;
           	mask(px,j)=0;
			v(px+1,j)  = volt1;
           	mask(px+1,j)=0;
			v(px+2,j)  = volt1;
           	mask(px+2,j)=0;
			v(px+3,j)  = volt1;
           	mask(px+3,j)=0;
			v(px+4,j)  = volt1;
           	mask(px+4,j)=0;
			v(px+5,j)  = volt1;
           	mask(px+5,j)=0;
			v(px+6,j)  = volt1;
           	mask(px+6,j)=0;
			v(px+7,j)  = volt1;
           	mask(px+7,j)=0;
			v(px+8,j)  = volt1;
           	mask(px+8,j)=0;
			v(px+9,j)  = volt1;
           	mask(px+9,j)=0;	
	case 5,	
	       v(px,j)  = volt1;
           	mask(px,j)=0;
			v(px+1,j)  = volt1;
           	mask(px+1,j)=0;
			v(px+2,j)  = volt1;
           	mask(px+2,j)=0;
			v(px+3,j)  = volt1;
           	mask(px+3,j)=0;
			v(px+4,j)  = volt1;
           	mask(px+4,j)=0;
			v(px+5,j)  = volt1;
           	mask(px+5,j)=0;
			v(px+6,j)  = volt1;
           	mask(px+6,j)=0;
			v(px+7,j)  = volt1;
           	mask(px+7,j)=0;
			v(px+8,j)  = volt1;
           	mask(px+8,j)=0;
			v(px+9,j)  = volt1;
           	mask(px+9,j)=0;
	case 6,
			v(px+1,j)  = volt1;
           	mask(px+1,j)=0;
			v(px+2,j)  = volt1;
           	mask(px+2,j)=0;
			v(px+3,j)  = volt1;
           	mask(px+3,j)=0;
			v(px+4,j)  = volt1;
           	mask(px+4,j)=0;
			v(px+5,j)  = volt1;
           	mask(px+5,j)=0;
			v(px+6,j)  = volt1;
           	mask(px+6,j)=0;
			v(px+7,j)  = volt1;
           	mask(px+7,j)=0;
			v(px+8,j)  = volt1;
           	mask(px+8,j)=0;
	case 7,
			v(px+1,j)  = volt1;
           	mask(px+1,j)=0;
			v(px+2,j)  = volt1;
           	mask(px+2,j)=0;
			v(px+3,j)  = volt1;
           	mask(px+3,j)=0;
			v(px+4,j)  = volt1;
           	mask(px+4,j)=0;
			v(px+5,j)  = volt1;
           	mask(px+5,j)=0;
			v(px+6,j)  = volt1;
           	mask(px+6,j)=0;
			v(px+7,j)  = volt1;
           	mask(px+7,j)=0;
			v(px+8,j)  = volt1;
           	mask(px+8,j)=0;
	case 8, 
			v(px+2,j)  = volt1;
           	mask(px+2,j)=0;
			v(px+3,j)  = volt1;
           	mask(px+3,j)=0;
			v(px+4,j)  = volt1;
           	mask(px+4,j)=0;
			v(px+5,j)  = volt1;
           	mask(px+5,j)=0;
			v(px+6,j)  = volt1;
           	mask(px+6,j)=0;
			v(px+7,j)  = volt1;
           	mask(px+7,j)=0;
			
	case 9, 
			v(px+4,j)  = volt1;
           	mask(px+4,j)=0;
			v(px+5,j)  = volt1;
			mask(px+5,j)=0;
			v(px+6,j)  = volt1;
           	mask(px+6,j)=0;
			
	end		 
end

%conductor 2
for j = py2:py2+b2
     aux=j-py2;
     switch aux
	 case 0, 
			v(px2+1,j)  = volt2;
           	 mask(px2+1,j)=0;
			 v(px2+2,j)  = volt2;
           	 mask(px2+2,j)=0;
	 case 1,
			v(px2,j)  = volt2;
           	mask(px2,j)=0;
			v(px2+1,j)  = volt2;
           	mask(px2+1,j)=0;
			v(px2+2,j)  = volt2;
           	mask(px2+2,j)=0;
			v(px2+3,j)  = volt2;
           	mask(px2+3,j)=0;
	case 2,
			v(px2,j)  = volt2;
           	mask(px2,j)=0;
			v(px2+1,j)  = volt2;
           	mask(px2+1,j)=0;
			v(px2+2,j)  = volt2;
           	mask(px2+2,j)=0;
			v(px2+3,j)  = volt2;
           	mask(px2+3,j)=0;
	case 3,
			v(px2+1,j)  = volt2;
           	mask(px2+1,j)=0;
			v(px2+2,j)  = volt2;
           	mask(px2+2,j)=0;
	end		 
end

v


cap2=0;
iter=0;
oldcap = 0;
oldcap2 = 0;
for iter = 1:ni                % Maximo numero de iteraciones
   v = delta(nx,ny,v,mask);       % ejecutar funcion delta
   cap = gauss(nx,ny,v)         % calculo capacitacia 1 externa
   
    if cap >0
		if (abs(cap-oldcap)/cap<tol&&abs(cap2-oldcap2)/cap2<tol)
			break                       
		else
			oldcap = cap;               
		end
	end 
	
	cap2 = gauss2(px2,py2,a2,b2,v) %caculo capacitancia 2 interna
	if cap2 >0
		oldcap2 = cap2;
	
    end 
	
end
cap



%calculo campo electrico maximo
Emax=0;
Vmax=0;
Vsig=0;
Vmaxx=0;
Vmaxy=0;
Vsigx=0;
Vsigy=0;
for i=1:nx-1
	for j=1:ny-1
		if Vmax<v(i,j)
			Vsig=Vmax;
			Vsigx=Vmaxx;
			Vsigy=Vmaxy;
			Vmax=v(i,j);	
			Vmaxx=i;
			Vmaxy=j;		
		endif
    end
end
Vmax
Vmaxx
Vmaxy
Vsig
Vsigx
Vsigy
Emax=(Vmax-Vsig)/1E-2

%ploteado de los contornonos de voltaje
[vjh,hjh]=contour(v);
text_handle=clabel(vjh,hjh);
set(text_handle,'BackgroundColor',[1 1 .6],'Edgecolor',[.7 .7 .7]);
title ("Contornos equipotenciales");
xlabel ("posicion en x [cm]");
ylabel ("posicion en y [cm]");
zlabel ("Voltaje");


%ploteado de los la matriz de voltajes en 3D
mesh([1:nx],[1:ny],v);

title ("Contornos equipotenciales 3D");
xlabel ("posicion en x [cm]");
ylabel ("posicion en y [cm]");
zlabel ("Voltaje");
