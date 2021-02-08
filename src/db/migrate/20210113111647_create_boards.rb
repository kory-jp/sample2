class CreateBoards < ActiveRecord::Migration[6.1]
  def change
    create_table :boards do |t|
      t.string :name
      t.string :title
      t.text :body
      t.text :image_data
      t.string :user_id

      t.timestamps
    end
  end
end
