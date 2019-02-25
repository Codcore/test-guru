class AddQuestionBodyNotNullContsraint < ActiveRecord::Migration[5.2]
  def up
    change_column_null(:questions, :body, false)
  end

  def down
    change_column_null(:questions, :body, true)
  end
end
