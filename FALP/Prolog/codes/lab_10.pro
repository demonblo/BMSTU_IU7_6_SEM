domains
	list = integer*.

predicates
	is_Bigger_Than(list, integer, list).
	create_From_Odd(list, list).
	delete_Cur_Elem(list, integer, list).
	create_Set(list, list).
	
clauses
	is_Bigger_Than([], _, []).
	is_Bigger_Than([H|T], Min, [H|Res_T]) :-
		H > Min,
		is_Bigger_Than(T, Min, Res_T).
	is_Bigger_Than([H|T], Min, Res_T) :-
		H <= Min,
		is_Bigger_Than(T, Min, Res_T).
		
	create_From_Odd([], []).
	create_From_Odd([_], []).
	create_From_Odd([_|[H|T]], [H|Res_T]) :-
		create_From_Odd(T, Res_t). 
		
	delete_Cur_Elem([], _, []).
	delete_Cur_Elem([H|T], Cur_El, [H|Res_T]) :-
		H <> Cur_El,
		delete_Cur_Elem(T, Cur_El, Res_T).
	delete_Cur_Elem([Cur_El|T], Cur_El, Res_T) :-
		delete_Cur_Elem(T, Cur_El, Res_T).
		
	create_Set([], []).
	create_Set([H|T], [H|Res_T]) :-
		delete_Cur_Elem(T, H, Temp_T),
		create_Set(Temp_T, Res_T).
		
goal
	%1.
	%is_Bigger_Than([1, 2, 3, 7, 7, 10], 2, Res).
	
	%2.
	%create_From_Odd([1, 2, 3, 4, 5], Res).
	
	%3.
	%delete_Cur_Elem([1, 2, 5, 6, 13], 2, Res).
	%delete_Cur_Elem([1, 2, 5, 6, 13], 3, Res).
	%delete_Cur_Elem([1, 2, 5, 2, 13, 2], 2, Res).
	
	%4.
	%create_Set([1, 13, 1, 1, 7, 2, 2], Res).
	%create_Set([2, 1, 1, 1, 1], Res).
	create_Set([1, 1, 1, 1, 1, 1, 1, 1], Res).