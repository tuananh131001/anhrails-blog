# frozen_string_literal: true

class BlogsController < ApplicationController
  def index
    @blogs = Blog.limit(10)
  end
end
