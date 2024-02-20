class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :description
      t.integer :preparation_time
      t.string :difficulty_level
      t.integer :portion

      t.timestamps
    end
  end
end
