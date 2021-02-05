class AddColumnToBoards < ActiveRecord::Migration[6.1]
  def change
    add_column :boards, :image_data, :text
  end
end
