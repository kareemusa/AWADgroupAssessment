class MovieController < ApplicationController

  skip_before_filter :authorize
  def index
    @products = Product.order(:title)
  end

end
