# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'Creating a new user leads to a sign up page' do
    get signup_path
    assert_response :success
  end

  test 'Failing to create a new user surfaces an error' do
    assert_raises(ActiveRecord::NotNullViolation) do
      post '/users', params: { user: { name: 'test', password: 'test' } }
    end
  end

  test 'The user is prompted to log in after being created' do
    post '/users', params: { user: { name: 'test', email: 'test', password: 'test' } }
    assert_redirected_to login_url
    User.last.destroy
  end

  test 'Liking an article updates the list of articles liked by the user' do
    flunk 'Limitations of model as currently set up - would need a relational model that is not impacted by deletion'
  end
end
