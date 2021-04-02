class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  
  def index 
    @users = User.paginate(page: params[:page], per_page: 1)
  end

  def new
    @user = User.new
  end

  def edit
  end

  def show
    @articles = @user.articles
  end

  def create 
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User #{@user.name} was created successfully."
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Your info was updated"
      redirect_to @user
    else
      render "edit"
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end