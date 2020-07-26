class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    redirect_to "/goods_items/#{comment.goods_item.id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, goods_item_id: params[:goods_item_id])
  end
end