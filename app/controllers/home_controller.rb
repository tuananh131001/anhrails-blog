# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @blogs = Blog.limit(10)
  end
end
