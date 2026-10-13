# by Engineer Jhoberg Quevedo Ruiz cc 82393998 #
Algoritm Isolation Electrocal BOOK Oxford
MATLAB OCTAVE LINUX CAD ALGORITM ISOLATION ELECTRICAL
WORK CHIP POWER ELECTRONIC CHIP ISOLATION CONDESADOR INDIITOR ARRAY CHIP BATERRY
[SUPER COMTER CIRCUIT SOFWARE PHYCAL RUSSIAN 2008](https://www.youtube.com/watch?v=wdg4zmv3vwY)

![ISOLAGTION ELECTRICAL PHYSICAL BOOK](https://github.com/JhobergLucifer/ISOLATIONELECTRICAL/blob/main/tarea1.jpg)


```c
# BY ENGINEER jHOBEERG QUEVEDO RUIZ CC 823993998 
v1=0.0;
v2=0.0;
v3=0.0;
v4=0.0;

v5=200;
v6=200;
v7=200;
v8=200;

ni=1000;
n=20;
nx=n+1;
ny=n+1;
a=10;
b=10;
px=5;
py=10;
volt1=200;
errortol=10E-9;
rel=1.9;




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
	cap2=q*2;
	for i=1:nx-1
	   q=q+(v(i,ny-1)+v(i+1,ny-1))*0.5;
	end
	
	cap=q*4;
	cap=cap*8.854187*1E-12
	
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

%carga de el conductor en la matriz v

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



iter=0;
oldcap = 0;
for iter = 1:ni                   % Maximum de iteraciones
   v = delta(nx,ny,v,mask);       % calculo de la funcion delta
   cap = gauss(nx,ny,v,mask)      % Calculo de la capacitancia
   
    if cap >0
	if (abs(cap-oldcap)/cap<errortol)   % error de convegencia
		break                       
	else
		oldcap = cap;               
	end
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

%text (pi, 0.7, "arbitrary text");



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
zlabel ("V")
```c
