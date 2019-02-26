class AddUserPasswordNotNullContsraint < ActiveRecord::Migration[5.2]
  def up
    change_column_null(:users, :password, false)
  end

  def down
    change_column_null(:users, :password, true)
  end
end
