class AddTestTitleNotNullContsraint < ActiveRecord::Migration[5.2]
  def up
    change_column_null(:tests, :title, false)
  end

  def down
    change_column_null(:tests, :title, true)
  end
end
