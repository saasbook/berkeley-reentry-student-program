class CreateCheckinRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :checkin_records do |t|
      t.datetime :time
      t.bigint "student_id", null: false
      t.string "first_name", null:false
      t.string "last_name", null:false
      t.string "email", null:false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
