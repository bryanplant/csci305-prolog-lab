% Bryan Plants
% CSCI 305 Prolog Lab 2

%defines a rule that asks if M is the mother of C
mother(M,C):- parent(M,C), female(M).

%defines a rule that asks if F is the Father of C
father(F,C):- parent(F,C), male(F).
%defines a rule that asks if X is married to Y
spouse(X,Y):- married(X,Y); married(Y,X).

%defines a rule that asks if C is the child of P
child(C,P):- parent(P,C).

%defines a rule that asks if S is the son of P
son(S,P):- child(S,P), male(S).

%defines a rule that asks if D is the daughter of P
daughter(D,P):- child(D,P), female(D).

%defines a rule that asks if X and Y are siblings
sibling(X,Y):- child(X,P), child(Y,P), not(X=Y).

%defines a rule that asks if B is a brother of X
brother(B,X):- sibling(B,X), male(B).

%defines a rule that asks if S is a siter of X
sister(S,X):- sibling(S,X), female(S).

%defines a rule that asks if U is an uncle by blood of X
uncle(U,X):- brother(U,P), parent(P,X).
%defines a rule that asks if U is an undle by marriage of X
uncle(U,X):- married(U,S), sister(S,Y), parent(Y,X).

%defines a rule that asks if A is an aunt by blood of X
aunt(A,X):- sister(A,P), parent(P,X).
%defines a rule that asks if A is an aunt by marriage of X
aunt(A,X):- married(A,B), brother(B, Y), parent(Y,X).

%defines a rule that asks if GP is a grandparent of GC
grandparent(GP,GC):- parent(P,GC), parent(GP,P).

%defines a rule that asks if GF is a grandfather of GC
grandfather(GF,GC):- grandparent(GF,GC), male(GF).

%defines a rule that asks if GM is a grandmother of GC
grandmother(GM,GC):- grandparent(GM,GC), female(GM).

%defines a rule that asks if GC is a grandchild of GP
grandchild(GC,GP):- grandparent(GP,GC).

%base case of a rule that asks if A is an ancestor of D
ancestor(A,D):- parent(A,D).
%recursive rule that asks if A is an ancestor of D
ancestor(A,D):- parent(P,D), ancestor(A,P).

%defines a rule that asks if D is an descendant of A
descendant(D,A):- ancestor(A,D).

%defines rule that gives the age of X
age(X,Age):- born(X,Born),
             (died(X,Died) -> Age is (Died-Born);
             Age is (2018-Born)).

%defines a rule that asks if O is older than Y
older(O,Y):- age(O,Age1), age(Y,Age2),
             Age1 > Age2.

%defines a rule that asks if Y is younger than O
younger(Y,O):- older(O,Y).

%defines a rule that asks who was the King or Queen (R) when Y was born
regentWhenBorn(R,Y):-
  born(Y,Year), reigned(R,Start,End),
  Start < Year, End > Year.

%defines a rule that asks if C1 and C2 are cousins
cousin(C1,C2):- parent(P1,C1), parent(P2,C2), sibling(P1,P2).
