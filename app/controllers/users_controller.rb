class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(params.require(:user).permit(:icon, :name, :profile))
      flash[:notice] = "プロフィール情報を更新しました。"
      redirect_to root_path
    else
      render "users/show"
    end
  end
end
