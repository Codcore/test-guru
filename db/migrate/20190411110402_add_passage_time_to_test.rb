class AddPassageTimeToTest < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :passage_time, :integer, default: 0
  end
end
