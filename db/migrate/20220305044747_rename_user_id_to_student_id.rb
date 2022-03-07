class RenameUserIdToStudentId < ActiveRecord::Migration[6.1]
  def change
    rename_column :checkin_records, :user_id, :student_id
  end
end
