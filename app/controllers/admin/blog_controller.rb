class Admin::BlogController < ApplicationController
  def new
    @blog = Blog.new
  end

  def index
    @blogs = Blog.all.limit(10)
  end

  def create
    @blog = Blog.new(params[:blog])
    if @blog.save
      redirect_to @blog
    else
      render "new"
    end
  end
end