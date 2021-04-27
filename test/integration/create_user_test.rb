require 'test_helper'

class CreateUserTest < ActionDispatch::IntegrationTest
  
  test 'get sign up form and create new user' do
    get '/signup'
    assert_response :success
    assert_difference 'User.count', 1 do
      post users_path, params: {user: {name: 'John', email: 'john@gmail.com', password: 'password123'} }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match 'John', response.body
    assert_select 'div.alert-success'
  end
end