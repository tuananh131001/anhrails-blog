# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Blog, type: :model do
  let(:blog) { build(:blog) }

  it 'is valid with attributes' do
    expect(blog).to be_valid
  end

  context 'when attributes are not present' do
    let(:blog) { build(:blog, title: nil) }

    it 'is invalid without attributes' do
      expect(blog).not_to be_valid
    end
  end
end
