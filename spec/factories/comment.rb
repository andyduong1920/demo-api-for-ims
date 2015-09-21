FactoryGirl.define do
	factory :comment do
		association :post
		association :user
		content { FFaker::Lorem.sentence(3) }
	end	
end