class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [ :show, :edit, :update, :destroy ]

  def index
    @posts = Post.includes(:user, :comments).order('created_at DESC')
  end

  def create_post
    @post = Post.new
  end

  def show;  end

  def sponsors; end

  def edit
    render :edit
  end

  def create
    @post = Post.new(posts_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      flash[:success] = 'Note item successfully updated!'
      redirect_to post_url(@post, locale: I18n.locale)
    else
      flash.now[:error] = 'Note item update failed'
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path(locale: I18n.locale)
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def posts_params
    params.require(:posts).permit(:title, :body).merge(user_id: current_user.id)
  end

  def post_params
    params.require(:post).permit(:title, :body).merge(user_id: current_user.id)
  end
end
