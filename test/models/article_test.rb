# frozen_string_literal: true

require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test 'Articles do not save without titles' do
    under_test = Article.new(id: 1, likes: 4)
    assert_raises ActiveRecord::NotNullViolation do
      under_test.save
    end
  end

  test 'Articles gain a default of 0 likes if the data is not present' do
    under_test = Article.new(id: 1, title: 'Test')
    under_test.save
    assert under_test.likes.zero?
  end

  test 'Articles that are valid save without error' do
    under_test = Article.new(id: 1, title: 'Test', likes: 15)
    assert under_test.save
  end
end
