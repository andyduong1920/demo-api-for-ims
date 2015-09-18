require 'rails_helper'

describe User do
	it "is valid with email and password" do
		user = User.new(email: "foo@bar.com", password: "1234567890")
		expect(user).to be_valid
	end

	it "is invalid without email" do
		user = User.new(email: nil)
		user.valid?
		expect(user.errors[:email]).to include("can't be blank")
	end

	it "is invalid without password" do
		user = User.new(password: nil)
		user.valid?
		expect(user.errors[:password]).to include("can't be blank")
	end

	it "is invalid without email and password" do
		user = User.new(email: nil, password: nil)
		user.valid?
		expect(user.errors[:email]).to include("can't be blank")
		expect(user.errors[:password]).to include("can't be blank")
	end

	it "is invalid with wrong email (foobar.com)" do
		user = User.new(email: "foobar.com", password: "1234567890")
		user.valid?
		expect(user.errors[:email]).to include("is invalid")
	end

	it "is invalid with wrong email (foo@bar.)" do
		user = User.new(email: "foo@bar.", password: "1234567890")
		user.valid?
		expect(user.errors[:email]).to include("is invalid")
	end

	it "is invalid with wrong email (foo@bar.1)" do
		user = User.new(email: "foo@bar.1", password: "1234567890")
		user.valid?
		expect(user.errors[:email]).to include("is invalid")
	end

	it "is invalid with wrong email (foo@bar..com)" do
		user = User.new(email: "foo@bar..com", password: "1234567890")
		user.valid?
		expect(user.errors[:email]).to include("is invalid")
	end

	it "is invalid with wrong email (more than 255 characters)" do
		too_long_name = "a" * 256
		user = User.new(email: "#{too_long_name}@bar..com", password: "1234567890")
		user.valid?
		expect(user.errors[:email]).to include("is invalid")
	end

	it "is invalid with blank email" do
		user = User.new(email: "", password: "1234567890")
		user.valid?
		expect(user.errors[:email]).to include("is invalid")
	end

	it "is invalid with a duplicate password" do
		email = "foo.duplicate1@bar.com"
		User.create!(email: email, password: "1234567890")
		user = User.new(email: email, password: "1234567890")
		user.valid?
		expect(user.errors[:email]).to include("has already been taken")
	end

	it "is invalid with blank password" do
		user = User.new(email: "foo@bar.com", password: "")
		user.valid?
		expect(user.errors[:password]).to include("can't be blank")
	end

	it "is invalid with too short password" do
		user = User.new(email: "foo@bar.com", password: "123")
		user.valid?
		expect(user.errors[:password]).to include("is too short (minimum is 8 characters)")
	end
	
end