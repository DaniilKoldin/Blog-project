class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.post_id = @post.id

    if @comment.save
      redirect_to post_path(@post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_url(@post, locale: I18n.locale)
  end

  private
  def comments_params
    params.require(:comments).permit(:user, :body).merge(user_id: current_user.id)
  end

  def comment_params
    params.require(:comment).permit(:title, :body).merge(user_id: current_user.id)
  end
end
