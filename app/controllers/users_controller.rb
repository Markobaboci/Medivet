class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update]

  def show
    # @user is already set by the before_action
    @pets = @user.pets
  end

  def edit
    # @user is already set by the before_action
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'User profile updated successfully.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :name, :role, :description)  # Add other permitted fields as needed
  end
end
