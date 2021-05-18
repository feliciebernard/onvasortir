require 'faker'

1.times do |x|
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::GreekPhilosophers.quote,
    email: Faker::Name.first_name+"@yopmail.com")
end

10.times do |x|
  event = Event.create(
    start_date: Faker::Date.forward(days: 42),
    duration: rand(1..10)*5,
    title: Faker::Hipster.sentence(word_count: 3),
    description: Faker::Hipster.paragraph(sentence_count: 3),
    price: rand(1..1000),
    location: Faker::Address.city,
    user: User.all.sample)
end