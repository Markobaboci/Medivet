class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @user = current_user

    @clinics = params[:query].present? ? Clinic.search_by_address(params[:query]) : Clinic.all

    filters = []
    filters << "LOWER(species) = :species" if params[:species].present? && params[:species] != 'All'
    filters << "LOWER(care_type) = :care_type" if params[:care_type].present? && params[:care_type] != 'All'

    if filters.any?
      @clinics = @clinics.where(filters.join(" OR "), species: params[:species].downcase, care_type: params[:care_type].downcase)
    end

    # @all_clinics = Clinic.all
  end


end
