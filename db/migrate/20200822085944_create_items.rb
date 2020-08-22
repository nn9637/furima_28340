class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,             null: false     
      t.text :ntroduction,        null: false
      t.integer :price,           null: false
      t.integer :prefecture_code, null: false
      t.integer :condition,       null: false
      t.integer :postage_payer,   null: false
      t.integer :preparation_day, null: false
      t.integer :category,        null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end