FactoryGirl.define do
	factory :user do
		sequence(:email) { |n| "BinhCQ#{n}@asiantech.vn"}
		password "12345678"
	end	
end