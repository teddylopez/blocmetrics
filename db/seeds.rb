  require 'faker'

 # Create a test user
 test_user = User.new(
   username:     'test',
   email:    'test@blocmetrics.com',
   password: 'password',
 )
 test_user.skip_confirmation!
 test_user.save!

 # Create registered applications
 5.times do
   RegisteredApplication.create!(
     user: test_user,
     name: Faker::App.name,
     url:  Faker::Internet.domain_name
   )
 end
 apps = RegisteredApplication.all

20.times do
	Event.create!(
		name: Faker::Lorem.sentence,
		registered_application: RegisteredApplication.first
		)
end

 puts "Seed finished"
 puts "#{RegisteredApplication.count} apps created"
 puts "#{Event.count} events created"
