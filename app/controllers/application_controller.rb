# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_default_theme

  private

  def set_default_theme
    cookies.delete(:theme)
    cookies[:theme] = 'night'
  end
end
