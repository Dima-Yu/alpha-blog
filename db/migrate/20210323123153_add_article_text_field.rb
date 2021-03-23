class AddArticleTextField < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :article_text, :string
  end
end
