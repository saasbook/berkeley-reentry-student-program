class AddColumnsToCheckin < ActiveRecord::Migration[6.1]
  def change
    add_column :checkins, :reason, :string
  end
end
