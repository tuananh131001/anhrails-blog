# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_theme

  private

  def set_theme
    @theme = 'night'      
  end
end
