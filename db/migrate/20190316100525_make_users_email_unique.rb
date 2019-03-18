class MakeUsersEmailUnique < ActiveRecord::Migration[5.2]
  def up
    change_table :users do |t|
      add_index :users, :email, unique: true
    end
  end

  def down
    change_table :users do |t|
      remove_index :users, :email
    end
  end
end
