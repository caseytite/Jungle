class Admin::DashboardController < ApplicationController

  
  http_basic_authenticate_with :name => ENV["HTTP_BASIC_USER"], :password => ENV["HTTP_BASIC_PASSWORD"]
  # before_filter :authorize

  def show
    @products = Product.all
    @categories = Category.all
  end
end
