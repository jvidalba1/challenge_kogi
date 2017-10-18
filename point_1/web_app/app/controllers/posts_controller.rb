class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_user

  before_action :check_owner, except: [:index, :show]

  def index
    @posts = @user.posts
  end

  def show
    @comment = Comment.new
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to user_post_url(current_user, @post), notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to user_post_url(current_user, @post), notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to user_posts_path(current_user), notice: 'Post was successfully destroyed.'
  end

  private

  def check_owner
    unless current_user === @user
      redirect_to user_posts_path(current_user), alert: 'You are not allow to do this action'
    end
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.fetch(:post).permit(:body, :user_id)
  end
end
