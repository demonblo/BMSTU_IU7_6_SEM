/*****************************************************************************

		Copyright (c) My Company

 Project:  TESTGOAL
 FileName: TESTGOAL.PRO
 Purpose: No description
 Written by: Visual Prolog
 Comments:
******************************************************************************/
domains
	id = integer.
	fname, lname = symbol.
	univ = symbol.
	
predicates
	student(id, fname, lname).
	studying(id, univ).
	students_from_univ(fname, lname, univ).	
clauses
	student(1, "Dmitry", "Blokhin").
	student(2, "Vasiliy", "Filippov").
	student(3, "Denis", "Kolosov").
	student(4, "Maksim", "Kolosov").
	studying(1, bmstu).
	studying(2, spbsu).
	studying(3, msu).
	studying(2, bmstu).
	studying(3, hse).
	students_from_univ(Fname, Lname, Univ) :- studying(Id, Univ), student(Id, Fname, Lname).
	
goal
	%Find all Unersities of student by his id
	%studying(1, Univ).
	%studying(2, Univ).
	%studying(3, Univ).
	
	%Find all students with current lname
	%student(Id, Fname, "Kolosov").
	%student(Id, Fname, "Blokhin").
	%student(Id, Fname, "Filippov").
	%student(Id, Fname, "Kryat").
	
	%Find all students(id) from one univ
	%studying(Id, bmstu).
	%studying(Id, spbsu).
	%studying(Id, msu).
	%studying(Id, hse).
	
	%Fine all students(name) from one univ
	students_from_univ(Fname, Lname, bmstu).
	%students_from_univ(Fname, Lname, spbsu).
	%students_from_univ(Fname, Lname, hse).
	%students_from_univ(Fname, Lname, itmo).