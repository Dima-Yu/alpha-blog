class UpdateAllDefaultAuthor < ActiveRecord::Migration[6.0]
  def change
    Article.all.each do |article|
      article.update_attributes! author: 'John Doe'
    end
  end
end
