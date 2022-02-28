class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      # t.references :student, null: false, foreign_key: true
      t.references :student, references: :students, null: false
      t.references :appointment_info, null: false, foreign_key: true

      t.timestamps
    end

    rename_column :appointments, :student_id, :student
    add_foreign_key :appointments, :students, column: 'student', primary_key: 'sid'
  end
end
