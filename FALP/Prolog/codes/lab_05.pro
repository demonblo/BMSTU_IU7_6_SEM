domains
	surname, telephone, city, street = symbol.
	home_number, flat_number = integer.
	address = address(city,
			 street,
			 home_number,
			 flat_number).
			
	brand, color, name = symbol.
	cost, size, year = integer.
			    
	bank_name = symbol.
	bank_account, bank_amount = integer.
	dep_info = dep_info(bank_name,
			    bank_account,
			    bank_amount).
			    
	property = building(cost, size, name);
		   land(cost, size, name);
		   water_transport(cost, brand, color);
		   car(brand, color, cost, year).
		   

predicates
	phone_record(surname, telephone, address).
	bank_owner(surname, dep_info).
	owning(surname, property).
	owning_nc(surname, symbol, symbol, cost).
	owning_cost(surname, symbol, cost).
	total_cost(surname, cost).
	
clauses
	phone_record("Gerasimenko", "85886893800", address("Moscow", "Auf", 17, 33)). 
	phone_record("Kryat", "85886893892", address("Moscow", "Kolokol", 12, 33)). 
	phone_record("Popov", "89932110022", address("Minsk", "Moskovskaya", 94, 11)). 
	phone_record("Blohin", "89265291378", address("Moscow", "Varsh", 52, 9)).
	phone_record("Blohin", "89255223228", address("Moscow", "Varsh", 52, 9)).
	phone_record("Blohin", "89115291378", address("Saratov", "Moskovskaya", 5, 2)).
	
	owning("Paklin", car("Cooper", "Red", 2000001, 2012)).
	owning("Kryat", car("Mitsubishi", "Grey", 289731, 2006)).
	owning("Blohin", car("Opel", "Grey", 290000, 2007)).
	owning("Blohin", car("Audi", "Red", 2900000, 2015)).
	owning("Paklin", water_transport(15000000, "Van Der Valk", "White")).
	owning("Kryat", land(10000000, 1000, "Dacha")).
	owning("Blohin", building(60000000, 273, "Townhouse")).
	owning("Blohin", land(3500000, 500, "Dacha")).
	
	bank_owner("Kolosov",
	dep_info("Sber", 1, 100000)).
	bank_owner("Kolosov",
	dep_info("VTB", 5, 200000)).
	bank_owner("Popov",
	dep_info("Rocket", 2, 10000000)).
	bank_owner("Blohin",
	dep_info("Gazprom", 4, 400000)).
	
	%Name and Cost of property by Surname
	owning_nc(Surname, building, Name, Cost) :- owning(Surname, building(Cost, _, Name)).
	owning_nc(Surname, land, Name, Cost) :- owning(Surname, land(Cost, _, Name)).
	owning_nc(Surname, water_transport, Name, Cost) :- owning(Surname, water_transport(Cost, Name, _)).
	owning_nc(Surname, car, Name, Cost) :- owning(Surname, car(Name, _, Cost, _)).
	
	%Cost of property by Surname or 0
	owning_cost(Surname, building, Cost) :- owning(Surname, building(Cost, _, _)), !.
	owning_cost(Surname, land, Cost) :- owning(Surname, land(Cost, _, _)), !.
	owning_cost(Surname, water_transport, Cost) :- owning(Surname, water_transport(Cost, _, _)), !.
	owning_cost(Surname, car, Cost) :- owning(Surname, car(_, _, Cost, _)), !.
	owning_cost(_, _, 0).
	
	%Total cost of all property
	total_cost(Surname, Total) :-
		owning_cost(Surname, bulding, Cost1),
		owning_cost(Surname, land, Cost2),
		owning_cost(Surname, water_transport, Cost3),
		owning_cost(Surname, car, Cost4),
		Total = Cost1 + Cost2 + Cost3 + Cost4.
		
	
goal
	%1. Name of all property by Surname
	%owning_nc("Blohin", Property, Name, _).
	
	%2. Name and Cost of all property by Surname
	%owning_nc("Blohin", Property, Name, Cost).
	
	%Total cost of all property by Surname
	total_cost("Paklin", Total).
	