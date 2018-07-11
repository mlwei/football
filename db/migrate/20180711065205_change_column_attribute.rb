class ChangeColumnAttribute < ActiveRecord::Migration[5.0]
  def change
    change_column :events , :qualifier , :text
  end
end
