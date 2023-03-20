# frozen_string_literal: true

module ProductsHelper
  def self.list
    url = Rails.configuration.products_list['source']
    HTTParty.get(url).parsed_response
  end
end
