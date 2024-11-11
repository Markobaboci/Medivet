class Users::RegistrationsController < Devise::RegistrationsController
  def create
    super do |resource|
      resource.role = params[:user][:vet] == '1' ? 'vet' : 'client'
      resource.save
    end
  end
end
