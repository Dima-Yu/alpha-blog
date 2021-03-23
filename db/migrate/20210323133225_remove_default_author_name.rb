class RemoveDefaultAuthorName < ActiveRecord::Migration[6.0]
  def change
    change_column_default :articles, :author, nil
  end
end
