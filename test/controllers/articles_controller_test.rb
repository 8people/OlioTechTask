# frozen_string_literal: true

require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  test 'The index is accessible' do
    get articles_path
    assert_response :success
  end

  test 'Loading the index refreshes the data set' do
    Article.destroy_all
    assert Article.count.zero?
    get articles_path
    assert Article.count == 25
  end

  test 'Updates the number of likes a post receives.' do
    Article.new(id: 1, title: 'Hello').save
    assert_difference('Article.find(1).likes') do
      put like_url id: 1
    end
  end
end
