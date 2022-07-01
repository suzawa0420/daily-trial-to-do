class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]



  def edit
  end

  def update
  end


  private
  def profile_params
    params.require(:profile).permit(:nickname, :avatar)
  end

end