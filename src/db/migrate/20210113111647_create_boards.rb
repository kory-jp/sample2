class CreateBoards < ActiveRecord::Migration[6.1]

  def up
    create_table :boards do |t|
      t.string :name
      t.string :title
      t.text :body
      t.string :user_id

      t.timestamps
    end
  end

  def down
    drop_table :boards
  end
  
end
