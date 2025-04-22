class CreateCourses < ActiveRecord::Migration[7.1]
  def change
    create_table :courses do |t|
      t.string :code
      t.string :title
      t.text :description
      t.string :units
      t.string :semester
      t.string :schedule
      t.string :ccn
      t.string :location
      t.boolean :available

      t.timestamps
    end
  end
end
