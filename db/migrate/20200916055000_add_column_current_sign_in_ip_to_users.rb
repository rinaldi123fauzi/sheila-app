class AddColumnCurrentSignInIpToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :current_sign_in_ip, :string
  end
end
