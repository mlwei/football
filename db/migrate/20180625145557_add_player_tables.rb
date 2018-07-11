class AddPlayerTables < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.integer :number
      t.integer :country_id
      t.string :name
      t.string :position
      t.string :height
      t.string :weight
      t.string :age
    end
    add_index :players , :number
    add_index :players , :country_id
    create_table :matches do |t|
      t.integer :weather_code
      t.string :stadium
      t.string :ht_score
      t.string :ft_score
      t.string :result
    end
  end
end
