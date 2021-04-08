class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update show destroy]
  before_action :require_user, except: %i[index show]
  before_action :require_same_user, only: %i[edit update destroy]

  def index
    @pagy, @users = pagy(User.all, items: 8)
  end

  def new
    @user = User.new
  end

  def edit; end

  def show
    @articles = @user.articles
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User #{@user.name} was created successfully."
      redirect_to articles_path
      session[:user_id] = @user.id
    else
      render 'new'
    end
  end

  def update
    if @user.update(user_params)
      flash[:notice] = 'Your info was updated'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil
    flash[:notice] = "Account #{@user.name} and all associated articles was deleted"
    redirect_to root_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def require_same_user
    if current_user != @user
      flash[:alert] = 'You can edit only Your own profile.'
      redirect_to @user
    end
  end
end
