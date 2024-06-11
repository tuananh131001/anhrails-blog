# frozen_string_literal: true

class Blog < ApplicationRecord
  validates :title, :content, :tag, presence: true
end
