mother(M,C):- parent(M,C), female(M).

father(F,C):- parent(F,C), male(F).

spouse(X,Y):- married(X,Y); married(Y,X).

child(C,P):- parent(P,C).

son(S,P):- child(S,P), male(S).

daughter(D,P):- child(D,P), female(D).

sibling(X,Y):- child(X,P), child(Y,P), not(X=Y).

brother(B,X):- sibling(B,X), male(B).

sister(S,X):- sibling(S,X), female(S).

uncle(U,X):- brother(U,P), parent(P,X).
uncle(U,X):- married(U,S), sister(S,Y), parent(Y,X).

aunt(A,X):- sister(A,P), parent(P,X).
aunt(A,X):- married(A,B), brother(B, Y), parent(Y,X).

grandparent(GP,GC):- parent(P,GC), parent(GP,P).

grandfather(GF,GC):- grandparent(GF,GC), male(GF).

grandmother(GM,GC):- grandparent(GM,GC), female(GM).

grandchild(GC,GP):- grandparent(GP,GC).

ancestor(A,D):- parent(A,D).
ancestor(A,D):- parent(P,D), ancestor(A,P).

descendant(D,A):- ancestor(A,D).

age(X,Age):- born(X,Born),
             (died(X,Died) -> Age is (Died-Born);
             Age is (2018-Born)).

older(O,Y):- age(O,Age1), age(Y,Age2),
             Age1 > Age2.

younger(Y,O):- older(O,Y).

regentWhenBorn(R,Y):-
  born(Y,Year), reigned(R,Start,End),
  Start < Year, End > Year.

cousin(C1,C2):- parent(P1,C1), parent(P2,C2), sibling(P1,P2).
