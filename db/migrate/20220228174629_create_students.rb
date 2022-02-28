class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students, id: false do |t|
      t.primary_key :sid
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
