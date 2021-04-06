class ChangeDefaultAuthorName < ActiveRecord::Migration[6.0]
  def change
    change_column_default :articles, :author, 'John Doe'
  end
end
