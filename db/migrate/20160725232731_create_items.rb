class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.decimal :price, precision: 9, scale: 2
      t.references :category, foreign_key: true
      t.references :celebrity, foreign_key: true

      t.timestamps null: false
    end
  end
end
