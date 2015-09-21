require 'rails_helper'

describe Comment do
	before do
		@error_blank_field = "can't be blank"
	end

	it "is valid with content" do
		expect(build(:comment)).to be_valid
	end

	it "is invalid without content" do
		comment = build(:comment, content: nil)
		comment.valid?
		expect(comment.errors[:content]).to include @error_blank_field
	end

	it "is invalid with blank content" do
		comment = build(:comment, content: "")
		comment.valid?
		expect(comment.errors[:content]).to include @error_blank_field
	end

	it "is invalid without post" do
		comment = build(:comment, post: nil)
		comment.valid?
		expect(comment.errors[:post]).to include @error_blank_field
	end

	it "is invalid without post_id" do
		comment = build(:comment, post_id: nil)
		comment.valid?
		expect(comment.errors[:post]).to include @error_blank_field
	end

	it "is invalid with wrong post_id" do
		comment = build(:comment, post_id: "this is wrong post_id")
		comment.valid?
		expect(comment.errors[:post]).to include @error_blank_field
	end

	it "is invalid without user" do
		comment = build(:comment, user: nil)
		comment.valid?
		expect(comment.errors[:user]).to include @error_blank_field
	end

	it "is invalid without user_id" do
		comment = build(:comment, user_id: nil)
		comment.valid?
		expect(comment.errors[:user]).to include @error_blank_field
	end

	it "is invalid with wrong user_id" do
		comment = build(:comment, user_id: "this is wrong user_id")
		comment.valid?
		expect(comment.errors[:user]).to include @error_blank_field
	end
end
