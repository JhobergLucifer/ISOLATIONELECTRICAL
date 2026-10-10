a=1;
b=1;
c=2;
d=2;
n=10;


% --------------------------------------------------------------
% Compute capacitance per unit length of
% a coaxial pair of rectangles
% --------------------------------------------------------------
function cap = capacitor(a, b, c, d, n, tol, rel)
% Arguments:
%    a   = width of inner conductor
%    b   = height of inner conductor
%    c   = width of outer conductor
%    d   = height of outer conductor

%      n   = number of points in the x-direction (horizontal)
%      tol = relative tolerance for capacitance
%      rel = relaxation parameter
%            (a good choice is 2-c/n, where c is about pi)
% Returns:
%      cap = capacitance per unit length [pF/m]
% Make grids
h = 0.5*c/n;                   %  Grid size
na = round(0.5*a/h);           %  Number of segments on ’a’
x = linspace(0,0.5*c,n+1);     %  Grid points along x-axis
m = round(0.5*d/h);            %  Number of segments on ’d’
mb = round(0.5*b/h);           %  Number of segments on ’b’
y = linspace(0,0.5*d,m+1);     %  Grid points along y-axis
% Initialize potential and mask array
f = zeros(n+1,m+1);            % 2D-array with solution
mask = ones(n+1,m+1)*rel;      % 2D-array with relaxation
                               % [mask(i,j) = 0 implies
                               % unchanged f(i,j)]
for i = 1:na+1
   for j = 1:mb+1
     mask(i,j) = 0;
     f(i,j)      = 1;
   end
end
% Gauss Seidel iteration
oldcap = 0;
for iter = 1:1000                % Maximum number of iterations
   f = seidel(f,mask,n,m);       % Perform Gauss-Seidel iteration
   cap = gauss(n,m,h,f);         % Compute the capacitance
   if (abs(cap-oldcap)/cap<tol)
     break                       % Stop if change in capacitance
                                % is sufficiently small
   else
     oldcap = cap;               % Contiue until converged
   end
end
str = sprintf('Number of iterations = %4i',iter); disp(str)
% --------------------------------------------------------------
% Make one Seidel iteration
% --------------------------------------------------------------
function f = seidel(f, mask, n, m)
% Arguments:
%      f    = 2D-array with solution
%      mask = 2D-array with relaxation
%     n    = number of points in the x-direction (horizontal)
%     m    = number of points in the y-direction (vertical)
% Returns:
%     f    = 2D-array with solution after Gauss-Seidel iteration
% Gauss seidel iteration
for i = 2:n
  for j = 2:m
    f(i,j) = f(i,j) + mask(i,j)* ...
              (0.25*( f(i-1,j) + f(i+1,j) ...
                      + f(i,j-1) + f(i,j+1)) - f(i,j));
  end
end
% Symmetry on left boundary i-1 -> i+1
i = 1;
for j = 2:m
  f(i,j) = f(i,j) + mask(i,j)* ...
            (0.25*( f(i+1,j) + f(i+1,j) ...
                    + f(i,j-1) + f(i,j+1)) - f(i,j));
end
% Symmetry on lower   boundary j-1 -> j+1
j = 1;
for i = 2:n
  f(i,j) = f(i,j) +   mask(i,j)* ...
            (0.25*(   f(i-1,j) + f(i+1,j) ...
                    + f(i,j+1) + f(i,j+1)) - f(i,j));
end
% --------------------------------------------------------------
% Compute capacitance from the potential
% --------------------------------------------------------------
function cap = gauss(n, m, h, f)
% Arguments:
%     n    = number of points in the x-direction (horizontal)
%     m    = number of points in the y-direction (vertical)
%     h    = cell size
%     f    = 2D-array with solution
% Returns:
%     cap = capacitance per unit length [pF/m]
q = 0;
for i = 1:n
  q = q + (f(i,m)+f(i+1,m))*0.5; % integrate along upper boundary
end

for j = 1:m
   q = q + (f(n,j)+f(n,j+1))*0.5; % integrate along right boundary
end
cap = q*4;              % 4 quadrants
cap = cap*8.854187;     % epsilon0*1e12 gives answer in pF/m
