%% 5.4 a

K = 0.16;
T = 76;
omega0 = 0.7823;
lambda = 0.07;

A = [0, 1, 0, 0, 0;
    -omega0^2, -2*lambda*omega0, 0, 0, 0
    0, 0, 0, 1, 0
    0, 0, 0, -1/T, -K/T
    0, 0, 0, 0, 0];

C = [0, 1, 1, 0, 0];


%% 5.4 b

Ab = A(3:4,3:4);
Cb = C(3:4);

OBb = obs(Ab,Cb)
%latexMatrix(OBb)


%% 5.4 c

Ac = A(3:5,3:5);
Cc = C(3:5);

OBc = obs(Ac,Cc)
%latexMatrix(OBc)

%% 5.4 d

Ad = A(1:4,1:4);
Cd = C(1:4);

OBd = obs(Ad,Cd)
%latexMatrix(OBd)

%% 5.4 e

Ae = A;
Ce = C;

OBe = obs(Ae,Ce)
%latexMatrix(OBe)
