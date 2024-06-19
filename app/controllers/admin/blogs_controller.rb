# frozen_string_literal: true

module Admin
  class BlogsController < ApplicationController
    before_action :set_light_theme, only: [:new]

    def index
      @blogs = Blog.limit(10)
    end

    def show
      @blog = Blog.find(params[:id])
    end

    def new
      @blog = Blog.new
    end

    def create
      @blog = Blog.new(blog_params)
      if @blog.save
        redirect_to [:admin, @blog], notice: 'Blog was successfully created.'
      else
        flash.now[:error] = 'Could not save blog'
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @blog.update(blog_params)
        redirect_to blogs_path, notice: 'Blog was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @blog = Blog.find(params[:id])
      flash.now[:notice] = 'You has succesfully deleted the blog'
      @blog.destroy
    end

    private
    def blog_params
      params.require(:blog).permit(:title, :content, :tag)
    end

    def set_light_theme
      cookies.delete(:theme)
      cookies[:theme] = 'light'
    end
  end
end
