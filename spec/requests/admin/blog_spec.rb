# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Admin::Blogs', type: :request do
  before { host! 'api.example.com' }

  describe 'POST /blogs' do
    subject { post '/admin/blogs', params: { blog: { title: 'My Widget', content: '123', tag: '123' } } }

    context 'when creating a blog' do
      it 'returns a blog' do
        subject
        expect(response).to have_http_status(:found)
      end
    end
  end
end
