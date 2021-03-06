password = Faker::Internet.password(6)

5.times do
   User.create!(
     email: Faker::Internet.email,
     password: password,
     password_confirmation: password,
     confirmed_at: Faker::Date.backward(360)
     )
 end

testuser = User.create!(
     email: "you@me.com",
     password: "ffffff",
     password_confirmation: "ffffff",
     confirmed_at: Faker::Date.backward(360)
     )
     testuser.skip_confirmation!
     testuser.save!

 users = User.all

 50.times do
   registered_application = RegisteredApplication.create!(
     user: users.sample,
     name: Faker::Beer.name,
     url: Faker::Internet.url,
     )
    registered_application.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
 end
 registered_applications = RegisteredApplication.all


 500.times do
   event = Event.create!(
   registered_application: registered_applications.sample,
   name: Faker::StarWars.planet
   )
   event.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
 end

 events = Event.all

  puts "Seed finished"
  puts "#{User.count} users created"
  puts "#{RegisteredApplication.count} registered applications created"
  puts "#{Event.count} events created"
