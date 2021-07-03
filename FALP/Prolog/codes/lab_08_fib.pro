predicates
	fibon(integer, integer). %For const
	fibon(integer, integer, integer, integer, integer). %Numb, Current, Prev_Prev_Res, PrevRes_, Res
	sign(integer, integer).
	
clauses
	%First two const
	fibon(0, 0) :- !.
	fibon(1, 1) :- !.
	
	%Beginning
	fibon(N, Res) :-
		N <0,    %For Negative Fib
		NN = N * -1,
		fibon(NN, Cur_Res),
		sign(NN, Sign),
		Res = Cur_Res * Sign, !.
	fibon(N, Res) :- fibon(N, 2, 0, 1, Res). %For Positive Fib
	
	%End
	fibon(N, N, Prev_Prev_Res, Prev_Res, Res) :- Res = Prev_Res + Prev_Prev_Res, !.
	
	%Algorithm
	fibon(N, Cur, Prev_Prev_Res, Prev_Res, Res) :- 
		New_Cur = Cur + 1,
		Cur_Res = Prev_Prev_Res + Prev_Res,
		fibon(N, New_Cur, Prev_res, Cur_Res, Res).
		
	sign(N, 1) :- (N mod 2) = 1, !.
	sign(_, -1).
	
goal
	%fibon(-7, Res). %Res = 13
	%fibon(-6, Res). %Res = -8
	%fibon(-2, Res). %Res = -1
	%fibon(2, Res). %Res = 1
	%fibon(3, Res). %Res = 2
	%fibon(7, Res). %Res = 13
	fibon(8, Res). %Res = 21