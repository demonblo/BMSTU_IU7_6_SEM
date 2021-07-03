predicates
	factorial(integer, integer).
	factorial(integer, integer, integer).
	
clauses
	%error!
	factorial(N, -1) :- N < 0, !.
	
	%Factorial of 0
	factorial(0, 1) :- !.
	
	%Beginning
	factorial(N, Res) :- factorial(N, 1, Res). 
	
	%End
	factorial(1, Res, Res) :- !.
	
	%Algorithm
	factorial(N, Cur, Res) :-
		New_N = N - 1,
		New_Mult = Cur * N,
		factorial(New_N, New_Mult, Res).
	
goal
	%factorial(-5, Fac).
	%factorial(0, Fac).
	factorial(4, Fac).