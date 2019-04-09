class AddTypeToBadges < ActiveRecord::Migration[5.2]
  def change
    add_column :badges, :type, :string
  end
end
