class RevertSidInUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :student_id, :sid
  end
end
