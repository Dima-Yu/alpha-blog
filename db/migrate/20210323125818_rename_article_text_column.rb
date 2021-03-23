class RenameArticleTextColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :articles, :article_text, :text
  end
end
