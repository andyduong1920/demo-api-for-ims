FactoryGirl.define do
	factory :post do
		association :user
    title { FFaker::Food.vegetable }
		content { FFaker::Lorem.sentence(3) }
	end	
end