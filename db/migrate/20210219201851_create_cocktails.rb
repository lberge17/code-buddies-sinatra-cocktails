class CreateCocktails < ActiveRecord::Migration[6.1]
  def change
    create_table :cocktails do |t|
      t.references :user
      t.string :name
      t.string :glass
      t.text :instructions
      t.boolean :alcoholic
      t.string :image_url
    end
  end
end
