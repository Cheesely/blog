class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "Account created successfully"
      redirect_to new_user_session_path
    else
      flash[:alert] = "Account was not created"
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path, status: :see_other
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
