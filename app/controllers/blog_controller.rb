class BlogController < ApplicationController
  def index
    @blogs = Blog.all.limit(10)
  end
end