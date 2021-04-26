module CategoryHelper
  def category_list
    @categories = Category.order('name ASC')
  end
end