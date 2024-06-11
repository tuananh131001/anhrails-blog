class Blog < ApplicationRecord
  validates :title, :content, :tag, presence: true
end
