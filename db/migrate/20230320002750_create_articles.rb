# frozen_string_literal: true

class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.integer :likes, default: 0, null: false
    end
  end
end
