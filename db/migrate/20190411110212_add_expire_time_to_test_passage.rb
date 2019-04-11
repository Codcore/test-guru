class AddExpireTimeToTestPassage < ActiveRecord::Migration[5.2]
  def change
    add_column :test_passages, :expire_time, :datetime
  end
end
