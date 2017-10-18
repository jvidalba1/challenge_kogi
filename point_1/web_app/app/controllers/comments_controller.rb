class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post
  before_action :set_comment, except: [:create]
  before_action :set_user

  before_action :check_owner, except: [:create]

  def create
    @comment = @post.comments.new comment_params
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to user_post_url(@user, @post), notice: "You comment was successfully created."
    else
      redirect_to user_post_url(@user, @post), notice: "You comment was not successfully created"
    end
  end

  def edit

  end

  def update
    if @comment.update(comment_params)
      redirect_to user_post_url(@user, @post), notice: 'Commnt was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to user_post_url(@user, @post), notice: "You comment was successfully deleted."
  end

  private

  def check_owner
    unless current_user === @comment.user
      redirect_to user_posts_path(current_user), alert: 'You are not allow to do this action'
    end
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_post 
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
