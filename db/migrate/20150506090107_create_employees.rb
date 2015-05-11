class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :position
      t.string :bio
      t.string :twitter
      t.string :linkedIn

      t.timestamps
    end
  end
end
