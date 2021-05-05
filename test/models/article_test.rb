require 'test_helper'

class ArticleTest < ActiveSupport::TestCase

  def setup
    @article = Article.new(title: 'Test article', description: 'Test article description', text: 'Test article description text')
  end

  test 'article should be valid' do
    @article.valid?
  end

  test 'title should present' do
    @article.title = ' '
    assert_not @article.valid?
  end
 
  test 'title should not be too short' do
    @article.title = 'Title'
    assert_not @article.valid?
  end
  
  test 'title should not be too long' do
    @article.title = 'a' * 51
    assert_not @article.valid?
  end

  test 'description should present' do
    @article.description = ' '
    assert_not @article.valid?
  end

  test 'description should not be too short' do
    @article.description = 'description'
    assert_not @article.valid?
  end
  
  test 'description should not be too long' do
    @article.description = 'a' * 201
    assert_not @article.valid?
  end

  test 'text should present' do
    @article.text = ' '
    assert_not @article.valid?
  end

  test 'text should not be too short' do
    @article.text = 'text'
    assert_not @article.valid?
  end
  
  test 'text should not be too long' do
    @article.text = 'a' * 1351
    assert_not @article.valid?
  end
end