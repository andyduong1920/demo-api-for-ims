class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :comments

  before_create :generate_token
  
  private
  def time_expire
    (Time.current + 30.days).to_i
  end

  def generate_token
    self.api_token = SecureRandom.urlsafe_base64(nil, false)
    self.expire_at = time_expire
  end
end
