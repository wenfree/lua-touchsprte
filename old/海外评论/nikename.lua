require("tsp")
usa_xin = {
	'Smith',
	'Johnson',
	'Williams',
	'Jones',
	'Brown',
	'Davis',
	'Miller',
	'Wilson',
	'Moore',
	'Taylor',
	'Anderson',
	'Thomas',
	'Jackson',
	'White',
	'Harris',
	'Martin',
	'Thompson',
	'Garcia',
	'Martinez',
	'Robinson',
	'Clark',
	'Rodrigue',
	'Lewis',
	'Lee',
	'Walker',
	'Hall',
	'Allen',
	'Young',
	'Hernande',
	'King',
	'Wright',
	'Lopez',
	'Hill',
	'Scott',
	'Green',
	'Adams',
	'Baker',
	'Gonzalez',
	'Nelson',
	'Carter',
	'Mitchell',
	'Perez',
	'Roberts',
	'Turner',
	'Phillips',
	'Campbell',
	'Parker',
	'Evans',
	'Edwards',
	'Collins',
}
usa_name = {
	'Emma',
	'Isabella',
	'Emily',
	'Madison',
	'Ava',
	'Olivia',
	'Sophia',
	'Abigail',
	'Elizabeth',
	'Chloe',
	'Samantha',
	'Addison',
	'Natalie',
	'Mia',
	'Alexis',
	'Alyssa',
	'Hannah',
	'Ashley',
	'Ella',
	'Sarah',
	'Grace',
	'Taylor',
	'Brianna',
	'Lily',
	'Anna',
	'Victoria',
	'Kayla',
	'Lillian',
	'Lauren',
	'Kaylee',
	'Allison',
	'Savannah',
	'Nevaeh',
	'Gabriella',
	'Sofia',
	'Makayla',
	'Avery',
	'Riley',
	'Julia',
	'Leah',
	'Audrey',
	'Jasmine',
	'Audrey',
	'Katherine',
	'Morgan',
	'Brooklyn',
	'Destiny',
	'Sydney',
	'Alexa',
	'Kylie',
	'Brooke',
	'Kaitlyn',
	'Evelyn',
	'Madeline',
	'Kimberly',
	'Zoe',
	'Jessica',
	'Peyton',
	'Alexandra',
	'Madelyn',
	'Maria',
	'Mackenzie',
	'Arianna',
	'Jocelyn',
	'Amelia',
	'Angelina',
	'Trinity',
	'Sophie',
	'Rachel',
	'Vanessa',
	'Aaliyah',
	'Mariah',
	'Gabrielle',
	'Katelyn',
	'Ariana',
	'Bailey',
	'Camila',
	'Jennifer',
	'Melanie',
	'Gianna',
	'Charlotte',
	'Paige',
	'Autumn',
	'Payton',
	'Faith',
	'Sara',
	'Isabelle',
	'Caroline',
	'Isabel',
	'Mary',
	'Zoey',
	'Gracie',
	'Megan',
	'Hailey',
	'Genesis',
}

function EnglishName()
	local k  = math.random(1,100)

	if k > 50 then
		return usa_xin[math.random(1,#usa_xin)]..usa_name[math.random(1,#usa_name)]..myRand(4,math.random(8,10))
	else
		return myRand(4,math.random(4,5))..usa_xin[math.random(1,#usa_xin)]..usa_name[math.random(1,#usa_name)]..myRand(4,math.random(2,3))
	end
end



























	