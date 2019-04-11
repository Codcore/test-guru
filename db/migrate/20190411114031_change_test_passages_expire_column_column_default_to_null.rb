class ChangeTestPassagesExpireColumnColumnDefaultToNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :test_passages, :expire_time, true
  end
end
