class AddUserToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :user_kk, index: true
  end
end
