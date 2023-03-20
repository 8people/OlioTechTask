# frozen_string_literal: true

require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  test 'The index is accessible' do
    get articles_path
    assert_response :success
  end

  test 'Updates the number of likes a post receives.' do
    Article.new(id: 1, title: 'Hello').save
    assert_difference('Article.find(1).likes') do
      put like_url id: 1
    end
  end
end
