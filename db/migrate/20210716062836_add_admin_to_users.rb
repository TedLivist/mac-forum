class AddAdminToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :adminn, :boolean, default: false
  end
end
