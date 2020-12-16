class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def update
    @user = User.find(current_user.id)
    if @user.update!(user_params)
      redirect_to user_path(@user)
    else
      render "edit"
    end
  end

  def edit
    @user = User.find(current_user.id)
  end

  def withdraw
    @user = User.find(current_customer.id)
    @user.update(is_deleted: true)
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :last_name_kana, :first_name_kana, :user_name, :gender, :profile_image)
  end

end
