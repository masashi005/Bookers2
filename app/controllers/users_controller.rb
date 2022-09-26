class UsersController < ApplicationController
  def index
    @book = Book.new
    @users = User.all
    @user = current_user
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = Book.where(user_id: params[:id])
  end

  def edit
    @user = User.find(params[:id])

    if @user == current_user
       render :layout => 'home_layout'
    else
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:notice] = "successfully update"
      redirect_to user_path(current_user.id)
    else
      render :edit, :layout => 'home_layout'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image,:introduction)
  end


end
