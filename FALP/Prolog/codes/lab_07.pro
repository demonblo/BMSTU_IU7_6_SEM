predicates
	find_max_two(integer, integer, integer).
	find_max_two_sec(integer, integer, integer).
	
	find_max_three(integer, integer, integer, integer).
	find_max_three_sec(integer, integer, integer, integer).
	
clauses
	find_max_two(First, Second, First) :- First >= Second, !.
	find_max_two(_, Second, Second).
	
	find_max_two_sec(First, Second, First) :- First >= Second.
	find_max_two_sec(First, Second, Second) :- Second > First.
	
	find_max_three(First, Second, Third, First) :- First >= Second, First >= Third, !.
	find_max_three(_, Second, Third, Max) :- find_max_two(Second, Third, Max).
	
	find_max_three_sec(First, Second, Third, Max) :- find_max_two_sec(First, Second, Temp), find_max_two_sec(Temp, Third, Max).
	
goal
	%1.
	%a.
	%find_max_two_sec(2, 3, Max).
	%find_max_two_sec(3, 2, Max).
	
	%b.
	%find_max_two(2, 3, Max).
	%find_max_two(3, 2, Max).
	
	%2.
	%a.
	%find_max_three_sec(2, 5, 9, Max).
	%find_max_three_sec(7, 6, 5, Max).
	%find_max_three_sec(2, 8, 4, Max).
	
	%b
	%find_max_three(1, 2, 3, Max).
	%find_max_three(3, 2, 1, Max).
	find_max_three(2, 8, 2, Max).