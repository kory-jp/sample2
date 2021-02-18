class AddBirthdayToUser < ActiveRecord::Migration[6.1]

  def up
    add_column :users, :birthday, :date
  end

  def down
    remove_column :users, :birthday, :date
  end

end
