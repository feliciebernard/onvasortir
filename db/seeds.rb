require 'faker'

20.times do |x|
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::GreekPhilosophers.quote,
    email: Faker::Name.first_name+"@yopmail.com")
end