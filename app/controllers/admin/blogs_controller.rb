# frozen_string_literal: true

module Admin
  class BlogsController < ApplicationController
    before_action :set_blog, only: %i[show edit update destroy]
    before_action :set_light_theme, only: %i[new create edit]

    def index
      @blogs = Blog.all.limit(10)
    end

    def show; end

    def new
      @blog = Blog.new
    end

    def create
      @blog = Blog.new(blog_params)
      if @blog.save
        redirect_to [:admin, @blog], notice: 'Blog successfully created.'
      else
        flash.now[:alert] = 'Blog creation failed.'
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @blog.update(blog_params)
        redirect_to admin_blogs_path, notice: 'Blog successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def edit; end

    def destroy
      @blog.destroy
      flash[:notice] = 'Blog successfully deleted.'
      redirect_to admin_blogs_path
    end

    private

    def set_blog
      @blog = Blog.find_by(id: params[:id])
      unless @blog
        flash.now[:alert] = 'Cannot find the blog.'
        redirect_to admin_blogs_path
      end
    end

    def blog_params
      params.require(:blog).permit(:title, :content, :tag)
    end

    def set_light_theme
      cookies.delete(:theme)
      cookies[:theme] = 'light'
    end
  end
end
