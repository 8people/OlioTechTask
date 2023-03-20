# frozen_string_literal: true

module ProductsHelper
  def self.list
    url = Rails.configuration.products_list['source']
    HTTParty.get(url, format: :json).parsed_response
  end
end
