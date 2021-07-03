domains
	mom, dad = symbol.
	
predicates
	mom_Child(mom, symbol).
	dad_Child(dad, symbol).
	grandmom(mom, symbol).
	granddad(dad, symbol).
	grandpar(mom, dad, symbol).

clauses
	mom_Child("Jane", "Jade").
	mom_Child("Clare", "Jane").
	mom_child("Lora", "Clare").
	mom_Child("Anny", "Kate").
	mom_Child("Anna", "Anny").
	mom_Child("Anna", "John").
	mom_Child("Roxy", "Andrew").
	mom_Child("Nancy", "Christian").
	mom_Child("Lisa", "Roxy").
	
	dad_Child("John", "Jade").
	dad_Child("Clark", "John").
	dad_Child("Clark", "Anny").
	dad_Child("Tom", "Kate").
	dad_Child("Andrew", "Jane").
	dad_Child("Christian", "Andrew").
	dad_Child("Morris", "Christian").
	dad_Child("Max", "Roxy").
	
	grandmom(Old, Young) :- mom_child(Old, Temp), mom_Child(Temp, Young).
	grandmom(Old, Young) :- mom_child(Old, Temp), dad_Child(Temp, Young).
	
	granddad(Old, Young) :- dad_child(Old, Temp), mom_Child(Temp, Young).
	granddad(Old, Young) :- dad_child(Old, Temp), dad_Child(Temp, Young).
	
	grandpar(Grandmom, Granddad, Young) :- grandmom(Grandmom, Young), granddad(Granddad, Young).
	
goal
	%grandmom(Old, "Jade").
	%granddad(Old, "Andrew").
	grandpar(Grandmom, Granddad, "Andrew").