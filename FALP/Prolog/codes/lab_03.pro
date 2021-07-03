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
	car_by_number(telephone, surname, car_brand, car_price).
	car_brand_by_number(telephone, car_brand).
	info_by_surname_city(surname, city, street, bank_name, telephone).
	
clauses
	phone_record("Gerasimenko", "85886893800", address("Moscow", "Auf", 17, 33)). 
	phone_record("Kryat", "85886893892", address("Moscow", "Kolokol", 12, 33)). 
	phone_record("Popov", "89932110022", address("Minsk", "Moskovskaya", 94, 11)). 
	phone_record("Blohin", "89265291378", address("Moscow", "Varsh", 52, 9)).
	phone_record("Blohin", "89115291378", address("Saratov", "Moskovskaya", 5, 9)).
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
	
	car_by_number(Phone_num, Surname, Car_brand, Car_price):-
	phone_record(Surname, Phone_num,_),
	car_owner(Surname, about_car(Car_brand, _, Car_price, _)).
	
	car_brand_by_number(Phone_num, Car_brand):-
	car_by_number(Phone_num, _, Car_brand, _).
	
	info_by_surname_city(Surname, City, Street, Bank, Phone_num):-
	phone_record(Surname, Phone_num, address(City, Street, _, _)),
	bank_owner(Surname, dep_info(Bank, _, _)).
	
goal
	%car_by_number("89265291378", Surname, Car_brand, Car_price).
	%car_brand_by_number("85886893892", Car_brand).
	info_by_surname_city("Blohin", "Saratov", Street, Bank, Phone_num).
	
	
	
	
	
	
	
	
	
			