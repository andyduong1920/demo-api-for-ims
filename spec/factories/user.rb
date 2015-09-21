FactoryGirl.define do
	factory :user do
    email { FFaker::Internet.email }
		password { FFaker::Internet.password(8) }

		# after(:build) do |user|
		# 	user.posts << FactoryGirl.build(:post, user: user)
		# end
	end	
end