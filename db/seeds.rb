weworks = [
  {name: "Finsbury Pavement", 
   country: "UK", 
   address: "131 Finsbury Pavement",
   rent_per_floor: 18000,
   number_of_floors: 8
  }, 
  {name: "Chelsea HQ", 
   country: "US", 
   address: "29 West 28th Street",
   rent_per_floor: 20000,
   number_of_floors: 20
  }, 
  {name: "Broadway", 
   country: "US", 
   address: "85 Broadway",
   rent_per_floor: 25000,
   number_of_floors: 6
  }
]

weworks.each do |we|
  Building.create(we)
end


companies = [
  "Microsoft",
  "Flatiron",
  "Green Peace",
  "FinFund LLC",
  "Inc'd Comics",
  "Blue Apron",
  "Dog the Bounty Hunter LLC"
]

companies.each do |company|
  Company.create(name: company)
end

titles = [
  "CEO",
  "Engineer",
  "HR specialist",
  "Graphic designer",
  "CFO",
  "COO",
  "Instructor"
]

i = 0
floors = [2,1,5,6,4]

5.times do
  Office.create(building: Building.first, company_id: Company.all.pluck(:id).sample, floor: floors[i])
  i += 1
end

i = 0
floors = [2,7,5,3,4,8,19,20,16]

9.times do
  Office.create(building: Building.second, company_id: Company.all.pluck(:id).sample, floor: floors[i]) 
  i += 1
end

i = 0
floors = [6,2,3,4]

4.times do
  Office.create(building: Building.third, company_id: Company.all.pluck(:id).sample, floor: floors[i]) 
  i += 1
end

100.times do 
  Employee.create(
    name: Faker::Name.name_with_middle,
    title: titles.sample,
    company: Company.all.sample
  )
end

