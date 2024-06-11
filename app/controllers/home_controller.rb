# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @blogs = Blog.all.limit(10)
  end
end
