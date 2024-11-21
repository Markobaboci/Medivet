class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @clinics = params[:query].present? ? Clinic.search_by_address(params[:query]) : Clinic.all

    # Filter by species if not "All"
    if params[:species].present? && !Array(params[:species]).include?('All')
      species_filters = Array(params[:species]).map(&:downcase)
      @clinics = @clinics.where('species @> ARRAY[?]::varchar[]', species_filters)
    end

    # Filter by care type if not "All"
    if params[:care_type].present? && !Array(params[:care_type]).include?('All')
      care_type_filters = Array(params[:care_type]).map(&:downcase)
      @clinics = @clinics.where('care_type @> ARRAY[?]::varchar[]', care_type_filters)
    end
  end

end
