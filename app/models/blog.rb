# frozen_string_literal: true

class Blog < ApplicationRecord
  has_rich_text :content
  validates :title, :tag, presence: true
end
