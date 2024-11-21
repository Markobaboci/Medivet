class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!

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
      Rails.logger.debug "Clinic update failed: #{@user.errors.full_messages.join(', ')}"
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :role, :description, :phone_number, :address) # Add other permitted fields as needed
  end
end
