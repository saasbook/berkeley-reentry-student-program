class RevertSidColumnInCheckins < ActiveRecord::Migration[6.1]
  def change
    rename_column :checkins, :sid, :student_id
  end
end
