# frozen_string_literal: true

class User < ApplicationRecord
  before_save { self.email = email&.downcase }
  before_save { self.name = name&.downcase }
  has_secure_password
end
