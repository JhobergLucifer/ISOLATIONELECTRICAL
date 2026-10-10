NE=25;
ND=21;
NP=15;
NL=[1 2 7
	2 8 7
	2 3 8
	3 9 8
	3 4 9
	4 10 9
	4 5 10
	5 11 10
	5 6 11
	7 8 12
	8 13 12
	8 9 13
	9 14 13
	9 10 14
	10 15 14
	10 11 15
	12 13 16
	13 17 16
	13 14 17 
	14 18 17
	14 15 18
	16 17 19
	17 20 19
	17 20 19
	17 18 20
	19 20 21 ];
X=[0.0 0.2 0.4 0.6 0.8 1.0 0.0 0.2 0.4 0.6 0.8 0.0 0.2 0.4 ...
   0.6 0.0 0.2 0.4 0.0 0.2 0.0];
Y=[0.0 0.0 0.0 0.0 0.0 0.0 0.2 0.2 0.2 0.2 0.2 0.4 0.4 0.4 ...
   0.4 0.6 0.6 0.6 0.8 0.8 2.0];
 NDP = [1 2 3 4 5 6 11 15 18 20 21 19 16 12 7];
 VAL = [0.0 0.0 0.0 0.0 0.0 50.0 100.0 100.0 100.0 100.0 50.0 0.0 0.0 0.0 0.0];
 


% load 'triangulo.txt'; nodos(:,1)=[];
B = zeros(ND,1);
C = zeros(ND,ND);
for I=1:NE
	K = NL(I,[1:3]);
	XL = X(K);
	YL = Y(K);
	P=zeros(3,1);
	Q=zeros(3,1);
	P(1) = YL(2) - YL(3);
	P(2) = YL(3) - YL(1);
	P(3) = YL(1) - YL(2);
	Q(1) = XL(3) - XL(2);
	Q(2) = XL(1) - XL(3);
	Q(3) = XL(2) - XL(1);
	AREA = 0.5*abs(P(2)*Q(3) - Q(2)*P(3));
	
	CE=(P*P' + Q*Q')/(4*AREA);
	for J=1:3
		IR=NL(I,J);
		IFLAG1=0;
		for K =1 : NP
			if(IR==NDP(K))
				C(IR,IR) = 1;
				B(IR) = VAL(K);
				IFLAG1=1;
			end
		end
		if (IFLAG1 == 0 )
			for L = 1:3
				IC = NL(I,L);
				IFLAG2=0;
				for K=1:NP
					if (IC == NDP(K)),
						B(IR) = B(IR) - CE(J,L)*VAL(K);
						IFLAG2=1;
					end	
				end
				if (IFLAG2 == 0)
				C(IR,IC) = C(IR,IC) + CE(J,L);
				end	
			end	
		end
	end
end
V= C\B;
V=V';
%plot([1:ND]',V');
diary jh.out
[ND,NE,NP]
[[1:ND]' X' Y' V']
diary off