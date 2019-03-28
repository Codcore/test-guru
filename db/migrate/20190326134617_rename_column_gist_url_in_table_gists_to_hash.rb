class RenameColumnGistUrlInTableGistsToHash < ActiveRecord::Migration[5.2]
  def change
    rename_column :gists, :gist_url, :hash
  end
end
