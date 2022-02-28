class CreateAppointmentInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :appointment_infos do |t|
      t.datetime :time
      t.string :location
      t.references :staff, null: false, foreign_key: true

      t.timestamps
    end
  end
end
