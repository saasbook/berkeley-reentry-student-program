class CreateScholarships < ActiveRecord::Migration[6.1]
  def change
    create_table :scholarships do |t|
      t.string :name
      t.text :description
      t.string :status_text
      t.string :application_url
      t.timestamps
    end
  end
end