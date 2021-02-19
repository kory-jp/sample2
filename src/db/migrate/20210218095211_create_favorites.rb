class CreateFavorites < ActiveRecord::Migration[6.1]
  def up
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :board_id

      t.timestamps
    end
  end

  def down
    drop_table :favorites
  end
end
