require 'test_helper'

class CreateArticleTest < ActionDispatch::IntegrationTest

  # setup do
  #   @user = User.create(name: 'johndoe', email: 'johndoe@mail.com',
  #                             password: 'password')
  #   sign_in_as(@user)
  # end

  test 'get new article form and create article' do
    @user = User.create(name: 'johndoe', email: 'johndoe@mail.com',
                              password: 'password')
    sign_in_as(@user)
    get '/articles/new'
    assert_response :success
    assert_difference 'Article.count', 1 do
      post articles_path, params: { article: { title: 'Test article', description: 'Test article description', text: 'Test article description text' } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match 'Test article', response.body
  end

  # test 'get edit article form and update article' do
  #   @user = User.create(name: 'johndoe', email: 'johndoe@mail.com',
  #                             password: 'password')
  #   sign_in_as(@user)
  #   @article = Article.create( title: 'Test article', description: 'Test article description', text: 'Test article description text', id: 1, user_id: @user.id )
  #   @article.save
  #   get edit_article_path(@article)
  #   assert_response :success
  #   @article.update(title: 'Updated title')
  #   # byebug
  #   post article_path(@article), params: { article: { title: @article.title, description: @article.description, text: @article.text } }
  #   assert_response :redirect
  #   follow_redirect!
  #   assert_response :success
  #   assert_match 'Article updated', response.body
  #   assert_select 'div.alert-success'
  # end

end