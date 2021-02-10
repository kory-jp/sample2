class AddColumnToBoards < ActiveRecord::Migration[6.1]

  def up
    add_column :boards, :image_data, :text
  end

  def down
    remove_column :boards, :image_data, :text
  end
end
