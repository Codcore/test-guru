class AddAuthoredTestsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :authored_tests, :integer
  end
end
