class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @user = current_user

    if params[:query].present?
      @clinics = Clinic.search_by_address(params[:query])
    else
      @clinics = Clinic.all
    end
    @all_clinics = Clinic.all
  end
end
