%
% Ivan Bratko. Prolog Programming for Artificial Intelligence, 1986
%

% page 4
parent(pam, bob).
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).

% page 8
%
% Suppress the 'Clauses of {fe,}male/1 are not together in the source-file'
% warning messages
:- discontiguous female/1.
:- discontiguous male/1.

female(pam).
male(tom).
male(bob).
female(liz).
female(pat).
female(ann).
male(jim).

% page 9
offspring(Y, X) :-
	parent(X, Y).

% page 11
mother(X, Y) :-
	parent(X, Y),
	female(X).

grandparent(X, Z) :-
	parent(X, Y),
	parent(Y, Z).

% page 130
different( X, Y) :-
	X = Y, !, fail;
	true.

% page 13
sister(X, Y) :-
	parent(Z, X),
	parent(Z, Y),
	female(X),
	different(X, Y).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%
% ex. 1.3, page 14
%
% Translate the following statements into prolog rules:
%
%  (a) Everybody who has a child is happy (introduce a one-argument
%      relation happy).
%
%  (b) For all X, if X has a child who has a sister then X has two children
%      (introduce new relation hastwochildren).
%
happy(X) :-
	parent(X, _),
	write(X), write(' is happy'), nl, false.

hastwochildren(X) :-
	parent(X, Y),
	sister(_, Y),
	write(X), write(' has two children'), nl, false.

%
% ex. 1.4, page 14
%
% Define the relation grandchild using the parent relation.
%
% Hint: It will be similar to the grandparent relation (see Figure 1.3).
%
grandchild(X, Y) :-
	parent(Y, A),
	parent(A, X),
	write(X), write(' is a grandchild for '), write(Y), nl, false.

%
% ex. 1.5, page 14
%
% Define the relation aunt(X, Y) in terms of the relations parent and sister.
% As an aid you can first draw a diagram in the style of Figure 1.3 for the
% aunt relation.
%
aunt(X, Y) :-
	sister(X, A),
	parent(A, Y),
	write(X), write(' is an aunt for '), write(Y), nl, false.
