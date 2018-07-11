class AddEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.integer :event_id
      t.integer :minute
      t.integer :second
      t.integer :country_id
      t.float :x_cordinate
      t.float :y_cordinate
      t.integer :period
      t.string :event_type
      t.string :out_come_type
      t.string :qualifier
      t.string :satisfied_event
      t.boolean :is_touch
      t.integer :player_id
      t.float :end_x_cordinate
      t.float :end_y_cordinate
      t.float :goal_mouth_z
      t.float :goal_mouth_y
      t.boolean :is_goal
      t.boolean :is_shoot
      t.integer :related_event_id
      t.integer :reloated_player_id
      t.float :block_x_cordinate
      t.float :block_y_cordinate
      t.string :card_type
    end
  end
end
