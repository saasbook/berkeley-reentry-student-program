class CreateAdvisors < ActiveRecord::Migration[6.1]
  def change
    create_table :advisors do |t|
      t.string :name
      t.text :description
      t.string :calendar
      t.boolean :active

      t.timestamps
    end
  end
end
