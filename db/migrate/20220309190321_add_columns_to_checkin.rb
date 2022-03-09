class AddColumnsToCheckin < ActiveRecord::Migration[6.1]
  def change
    add_column :checkins, :first_name, :string
    add_column :checkins, :last_name, :string
    add_column :checkins, :email, :string
  end
end
