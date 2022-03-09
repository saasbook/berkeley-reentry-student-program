class FixCheckinIdName < ActiveRecord::Migration[6.1]
  def change
    rename_column :checkins, :student_id, :sid
  end
end
