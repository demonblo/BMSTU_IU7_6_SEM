domains
	list = integer*.

predicates
	list_Len(list, integer).
	list_Len(list, integer, integer).
	list_Sum(list, integer).
	list_Sum(list, integer, integer).
	sum_Odd(list, integer).
	sum_Odd(list, integer, integer).
	
clauses
	list_Len(List, Len) :- list_Len(List, 0, Len).
	list_Len([], Len, Len).
	list_Len([_|T], Cur_Len, Len) :-
		New_Len = Cur_Len + 1,
		list_Len(T, New_Len, Len).
		
	list_Sum(List, Sum) :- list_Sum(List, 0, Sum).
	list_Sum([], Sum, Sum).
	list_Sum([H|T], Cur_Sum, Sum) :-
		New_Sum = Cur_Sum + H,
		list_Sum(T, New_Sum, Sum).
		
	sum_Odd(List, Sum) :- sum_Odd(List, 0, Sum).
	sum_Odd([], Sum, Sum).
	sum_Odd([_], Sum, Sum).
	sum_Odd([_|[H|T]], Cur_Sum, Sum) :-
		New_Sum = Cur_Sum + H,
		sum_Odd(T, New_Sum, Sum).
		
goal
	%list_Len([0, 2, 2, 8], Len).
	%list_Sum([1, 3, 3, 7, 10], Sum).
	%sum_Odd([2, 0, 2, 0], Sum).
	sum_Odd([0, 12, 10, 11, 14], Sum).