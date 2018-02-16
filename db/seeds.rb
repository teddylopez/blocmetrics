require 'faker'

# Create a test user
test_user = User.new(
 username:     'test',
 email:    'test@blocmetrics.com',
 password: 'password',
)
test_user.save!

# Create registered applications
5.times do
 RegisteredApp.create!(
   user: test_user,
   name: Faker::App.name,
   url:  Faker::Internet.domain_name
 )
end
apps = RegisteredApp.all

20.times do
Event.create!(
  name: Faker::Lorem.sentence,
  registered_app: RegisteredApp.first
  )
end

puts "Seed finished"
puts "#{RegisteredApp.count} apps created"
puts "#{Event.count} events created"
