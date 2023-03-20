# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'Users do not save without a name' do
    under_test = User.new(email: 'ab@cd.com', password: 'Test123.', liked_articles: [123, 456, 789])
    assert_raises ActiveRecord::NotNullViolation do
      under_test.save
    end
  end

  test 'Users do not save without an email' do
    under_test = User.new(name: 'asdf', password: 'Test123.', liked_articles: [123, 456, 789])
    assert_raises ActiveRecord::NotNullViolation do
      under_test.save
    end
  end

  test 'Users must have a password' do
    under_test = User.new(name: 'asdf', email: 'ab@cd.com', liked_articles: [123, 456, 789])
    flunk 'Requires more thorough validation to fail with the correct error'
    assert_raises ActiveRecord::NotNullViolation do
      under_test.save
    end
  end

  test 'Users can have no liked articles' do
    under_test = User.new(name: 'asdf', email: 'ab@cd.com', password: 'Test123.', liked_articles: [])
    assert under_test.save
  end

  test 'Users can like more than one article' do
    under_test = User.new(name: 'asdf', email: 'ab@cd.com', password: 'Test123.', liked_articles: [123, 456, 789])
    assert under_test.save
  end

  test 'Users that are valid save without error' do
    under_test = User.new(name: 'asdf', email: 'ab@cd.com', password: 'Test123.', liked_articles: [123])
    assert under_test.save
  end
end
