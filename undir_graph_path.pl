%
% Find Maximum Weighted Path in a Weighted Undirected Graph
%
%    based on http://stackoverflow.com/a/21196849
%

:- style_check(-singleton).

% directed graph
%adjacent(X, Y, CostXY, graph(Nodes, Edges)) :-
%	member(e(X, Y, CostXY), Edges).

% undirected graph
adjacent(X, Y, CostXY, graph(Nodes, Edges)) :-
	member(e(X, Y, CostXY), Edges);
	member(e(Y, X, CostXY), Edges).

path(A, Z, Graph, Cost) :-
	walk(A, Z, 0, Graph, [], Cost).

walk(A, Z, Cost1, Graph, V, Cost) :-
	adjacent(A, X, CostAX, Graph),
	not(member(X, V)),
	Cost2 is Cost1 + CostAX,
	(
		Z = X, Cost is Cost2;
		walk(X, Z, Cost2, Graph, [A | V], Cost)
	).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mypath(A, B, Cost) :-
	path(A, B,
		graph(
			[a, b, c],
			[e(a, b, 1), e(b, c, 1)]
		),
		Cost).

mypathmax(Result) :-
	findall(Cost, mypath(_, _, Cost), List),
	max_list(List, Result).

% ?- [mygraph].
% true.
%
% ?- mypathmax(R).
% R = 2.
