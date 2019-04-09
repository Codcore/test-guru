class CreateJoinTableUsersBadges < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :badges do |t|
    end
  end
end
