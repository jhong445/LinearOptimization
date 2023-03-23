%% Formulation
% Column vector for coefficients 
f= [4; 3; 10; 9; 9; 6; 13; 7; 12; 9; 16; 6];

%Inequality matrix
A= [1 1 1 1 0 0 0 0 0 0 0 0; 0 0 0 0 1 1 1 1 0 0 0 0; 
    0 0 0 0 0 0 0 0 1 1 1 1; -1 0 0 0 -1 0 0 0 -1 0 0 0; 
    0 -1 0 0 0 -1 0 0 0 -1 0 0; 0 0 -1 0 0 0 -1 0 0 0 -1 0; 
    0 0 0 -1 0 0 0 -1 0 0 0 -1;]; 

%Column vector for constraints (negative for demand constraints)
b= [30; 55; 40; -40; -25; -30; -30];

%Lower Bound of terms
lb= [0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0];

%Upper bound of terms
ub= [inf; inf; inf; inf; inf; inf; inf; inf; inf; inf; inf; inf];

%% Start with the default options
options = optimoptions('linprog');
%% Modify options setting
options = optimoptions(options,'Display', 'off');
options = optimoptions(options,'Algorithm', 'dual-simplex');
[x,fval,exitflag,output,lambda] = linprog(f,A,b,[],[],lb,ub,[],options);
