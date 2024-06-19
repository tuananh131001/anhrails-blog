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

  describe 'GET /blogs' do
    subject { get '/admin/blogs', params: {} }

    context 'when get all blogs' do
      it 'returns blogs' do
        subject
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'Delete /blog' do
    subject { delete "/admin/blogs/#{blog.id}", params: {} }

    let!(:blog) { create(:blog) }

    context 'when get all blogs' do
      it 'deletes blogs' do
        expect { subject }.to change(Blog, :count).from(1).to(0)
      end
    end
  end
end
