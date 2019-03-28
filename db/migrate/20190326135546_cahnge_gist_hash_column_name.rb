class CahngeGistHashColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :gists, :hash, :url
  end
end
