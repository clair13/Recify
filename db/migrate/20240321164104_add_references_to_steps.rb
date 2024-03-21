class AddReferencesToSteps < ActiveRecord::Migration[7.0]
  def change
    add_reference :steps, :recipe, null: false, foreign_key: true
  end
end
