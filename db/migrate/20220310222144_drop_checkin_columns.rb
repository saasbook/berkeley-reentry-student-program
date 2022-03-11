class DropCheckinColumns < ActiveRecord::Migration[6.1]
  def change
    remove_column :checkins, :first_name
    remove_column :checkins, :last_name
    remove_column :checkins, :email
  end
end
