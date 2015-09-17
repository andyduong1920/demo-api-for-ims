class AddApiTokenAndExpireAtToUsers < ActiveRecord::Migration
  def change
    add_column :users, :api_token, :string
    add_column :users, :expire_at, :integer
  end
end
