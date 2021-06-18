class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :creator
      t.integer :hours
      t.string :category

      t.timestamps
    end
  end
end
