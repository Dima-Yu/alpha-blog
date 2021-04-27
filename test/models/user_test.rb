require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'John Doe', email: 'example@gmail.com', password: 'password123')
  end

  test 'user name should be valid' do
    assert @user.valid?
  end

  test 'user name should be present' do
    @user.name = ' '
    assert_not @user.valid?
  end

  test 'user name should be unique' do
    @user.save
    @user2 = User.new(name: 'John Doe', email: 'clone@gmail.com', password: 'password123')
    assert_not @user2.valid?
  end

  test 'user name should be not too short' do
    @user.name = 'ra'
    assert_not @user.valid?
  end

  test 'user name should be not too long' do
    @user.name = 'a' * 26
    assert_not @user.valid?
  end

  test 'email should be right format' do
    @user.email = 'wrong.email@com'
    assert_not @user.valid?
  end

  test 'email should be present' do
    @user.email = ' '
    assert_not @user.valid?
  end

  test 'email should be unique' do
    @user.save
    @user2 = User.new(name: 'John Doe', email: 'example@gmail.com', password: 'password123')
    assert_not @user2.valid?
  end
end