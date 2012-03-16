class AdminController < ApplicationController
  def index
    @total_products = Product.count
  end
end
