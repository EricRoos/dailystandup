FactoryBot.define do
	factory :user do
		first_name { Faker::Name.first_name }
		last_name { Faker::Name.last_name }
    email { "#{first_name}.#{last_name}@local.com" }
    password { "test123456" }
	end
end