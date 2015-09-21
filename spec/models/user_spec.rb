require 'rails_helper'

describe User do
	before do
		@error_blank_field = "can't be blank"
		@error_invalid = "is invalid"
	end

	it "is valid with email and password" do
		user = build(:user)
		expect(user).to be_valid
	end

	it "is invalid without email" do
		user = build(:user, email: nil)
		user.valid?
		expect(user.errors[:email]).to include @error_blank_field
	end

	it "is invalid without password" do
		user = build(:user, password: nil)
		user.valid?
		expect(user.errors[:password]).to include @error_blank_field
	end

	it "is invalid without email and password" do
		user = build(:user, email: nil, password: nil)
		user.valid?
		expect(user.errors[:email]).to include @error_blank_field
		expect(user.errors[:password]).to include @error_blank_field
	end

	it "is invalid with wrong email (foobar.com)" do
		user = build(:user, email: "foobar.com")
		user.valid?
		expect(user.errors[:email]).to include @error_invalid
	end

	it "is invalid with wrong email (foo@bar.)" do
		user = build(:user, email: "foo@bar.")
		user.valid?
		expect(user.errors[:email]).to include @error_invalid
	end

	it "is invalid with wrong email (foo@bar.1)" do
		user = build(:user, email: "foo@bar.1")
		user.valid?
		expect(user.errors[:email]).to include @error_invalid
	end

	it "is invalid with wrong email (foo@bar..com)" do
		user = build(:user, email: "foo@bar..com")
		user.valid?
		expect(user.errors[:email]).to include @error_invalid
	end

	it "is invalid with wrong email (more than 255 characters)" do
		too_long_name = "a" * 256
		user = build(:user, email: "#{too_long_name}@bar..com")
		user.valid?
		expect(user.errors[:email]).to include @error_invalid
	end

	it "is invalid with blank email" do
		user = build(:user, email: "")
		user.valid?
		expect(user.errors[:email]).to include @error_invalid
	end

	it "is invalid with a duplicate password" do
		timestamp = Time.now.to_i
		email = "foo.duplicate#{timestamp}@bar.com"
		first_user = build(:user, email: email)
		first_user.save!

		second_user = build(:user, email: email)
		second_user.valid?
		expect(second_user.errors[:email]).to include("has already been taken")
	end

	it "is invalid with blank password" do
		user = build(:user, password: "")
		user.valid?
		expect(user.errors[:password]).to include @error_blank_field
	end

	it "is invalid with too short password" do
		user = build(:user, password: "123")
		user.valid?
		expect(user.errors[:password]).to include("is too short (minimum is 8 characters)")
	end
end