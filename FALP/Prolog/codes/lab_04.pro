domains
	surname, telephone, city, street = symbol.
	home_number, flat_number = integer.
	address = address(city,
			 street,
			 home_number,
			 flat_number).
			
	car_brand, car_color = symbol.
	car_price, car_year = integer.
	about_car = about_car(car_brand,
			     car_color,
			     car_price,
			     car_year).
			    
	bank_name = symbol.
	bank_account, bank_amount = integer.
	dep_info = dep_info(bank_name,
			    bank_account,
			    bank_amount).

predicates
	phone_record(surname, telephone, address).
	car_owner(surname, about_car).
	bank_owner(surname, dep_info).
	info_by_car(car_brand, car_color, surname, city, telephone, bank_name).
	
clauses
	phone_record("Gerasimenko", "85886893800", address("Moscow", "Auf", 17, 33)). 
	phone_record("Kryat", "85886893892", address("Moscow", "Kolokol", 12, 33)). 
	phone_record("Popov", "89932110022", address("Minsk", "Moskovskaya", 94, 11)). 
	phone_record("Blohin", "89265291378", address("Moscow", "Varsh", 52, 9)).
	phone_record("Blohin", "89255223228", address("Moscow", "Varsh", 52, 9)).
	phone_record("Blohin", "89115291378", address("Saratov", "Moskovskaya", 5, 2)).
	car_owner("Paklin",
	about_car("Cooper", "Red", 2000001, 2012)).
	car_owner("Kryat",
	about_car("Mitsubishi", "Grey", 289731, 2006)).
	car_owner("Blohin",
	about_car("Opel", "Grey", 290000, 2007)).
	car_owner("Blohin",
	about_car("Audi", "Red", 2900000, 2015)).
	bank_owner("Kolosov",
	dep_info("Sber", 1, 100000)).
	bank_owner("Kolosov",
	dep_info("VTB", 5, 200000)).
	bank_owner("Popov",
	dep_info("Rocket", 2, 10000000)).
	bank_owner("Blohin",
	dep_info("Gazprom", 4, 400000)).
	
	info_by_car(Car_brand, Car_color, Surname, City, Telephone, Bank_name) :- car_owner(Surname, about_car(Car_brand, Car_color, _, _)), 
	phone_record(Surname, Telephone, address(City, _, _, _)), bank_owner(Surname, dep_info(Bank_name, _, _)).
	
goal
	info_by_car("Audi", "Red", Surname, City, Telephone, Bank_name).
	