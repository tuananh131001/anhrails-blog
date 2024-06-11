# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Blog, type: :model do
  it 'is valid with attributes' do
    blog = Blog.new(title: 'title', content: 'content', tag: 'tag')
    expect(blog).to be_valid
  end

  it 'is invalid without attributes' do
    blog = Blog.new
    expect(blog).not_to be_valid
  end
end
