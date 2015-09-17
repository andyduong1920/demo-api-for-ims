class Comment < ActiveRecord::Base
  belongs_to :post
  validates :post, :content, presence: true
end
