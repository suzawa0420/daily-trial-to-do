class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]



  def edit
    @profile = current_user.prepare_profile
  end

  def update
    @profile = current_user.prepare_profile
    @profile.assign_attributes(profile_params)

    if @profile.save
      redirect_to root_path, notice: "プロフィール更新"
    else
      flash.now[:error] = "更新できませんでした"
      render :edit
    end
  end


  private
  def profile_params
    params.require(:profile).permit(:nickname, :avatar)
  end

end