class CreateMeasurements < ActiveRecord::Migration[6.1]
  def change
    create_table :measurements do |t|
      t.references :cocktail
      t.references :ingredient
      t.string :amount
    end
  end
end
