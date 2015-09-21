require 'rails_helper'

describe Post do
	before do
		@error_blank_field = "can't be blank"
	end

	it "is valid with title, content and associstion for user" do
		expect(build(:post)).to be_valid
	end

	it "is invalid without title" do
		post = build(:post, title: nil)
		post.valid?
		expect(post.errors[:title]).to include @error_blank_field
	end

	it "is invalid without content" do
		post = build(:post, content: nil)
		post.valid?
		expect(post.errors[:content]).to include @error_blank_field
	end

	it "is invalid without user" do
		post = build(:post, user: nil)
		post.valid?
		expect(post.errors[:user]).to include @error_blank_field
	end

	it "is invalid with blank title" do
		post = build(:post, title: "")
		post.valid?
		expect(post.errors[:title]).to include @error_blank_field
	end

	it "is invalid with blank content" do
		post = build(:post, content: "")
		post.valid?
		expect(post.errors[:content]).to include @error_blank_field
	end

	it "is invalid with blank user_id" do
		post = build(:post, user_id: "")
		post.valid?
		expect(post.errors[:user]).to include @error_blank_field
	end

	it "is invalid with wrong user_id" do
		post = build(:post, user_id: "this is wrong user_id")
		post.valid?
		expect(post.errors[:user]).to include @error_blank_field
	end
end