class RenameSidInUsersTable < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :sid, :student_id
  end
end
