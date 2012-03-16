class CommentsController < ApplicationController
   http_basic_authenticate_with :name => "mygroup", :password => "assessment", :only => :destroy
  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.create(params[:comment])
    redirect_to product_path(@product), notice: 'Your comment has been added.'
  end
  
  def destroy
    @product = Product.find(params[:product_id])
    @comment = @product.comments.find(params[:id])
    @comment.destroy
    redirect_to product_path(@product), notice: 'Comment was successfully removed'
  end
end



