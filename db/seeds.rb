# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


5.times do 
    username = "#{Faker::Name.first_name}.#{Faker::Name.last_name}"
    User.create(username: username, rating: 1)
end

10.times do
    address = "#{rand(1..500)} #{["Broadway", "Park", "Main", "Oak", "Pine"].sample}, New York, NY"
    capacity = rand(1..3)
    name = "#{Faker::Restaurant.name}'s #{Faker::Restaurant.type}"
    price = rand(0..10)
    rating = rand(1..5)
    Location.create(address: address, capacity: capacity, name: name, price: price, rating: rating)
end

20.times do
    location = rand(1..10)
    user = rand(1..5)
    ur = rand(1..5)
    lr = rand(1..5)
    complete = [true, false].sample
    
    Duty.create(location_id: location, user_id: user, users_rating: ur, locations_rating: lr, complete: complete)
end