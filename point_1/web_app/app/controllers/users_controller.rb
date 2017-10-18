class UsersController < ApplicationController
  # skip_before_filter :verify_authenticity_token
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy, :follow]

  def follow
    if current_user.following?(@user)
      current_user.stop_following(@user)
      redirect_to user_posts_path(@user), notice: "Unfollowed"
    else
      current_user.follow(@user)
      redirect_to user_posts_path(@user), notice: "Following"
    end
  end

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end
  
  # GET /users/:id
  # GET /users/:id.json
  def show
    respond_to do |format|
      format.html
      format.json { render json: @user }
     end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.fetch(:user).permit(:email, :password, :password_confirmation)
    end
end
