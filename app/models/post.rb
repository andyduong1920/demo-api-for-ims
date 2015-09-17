class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  
  validates :user, :title, :content, presence: true
end
