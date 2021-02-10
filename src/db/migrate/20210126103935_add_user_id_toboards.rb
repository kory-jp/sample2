class AddUserIdToboards < ActiveRecord::Migration[6.1]

  def up
    add_reference :boards, :user, foreign_key: true
  end

  def down
    remove_column :boards, :user, foreign_key: true
  end
  
end
