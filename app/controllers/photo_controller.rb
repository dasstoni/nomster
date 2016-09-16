class PhotoController < ApplicationController
  before_action :authenticate_user!

  def create
    @place = Place.find(params[:place_id])
    if @place.user != current_user
      return render text: 'Not Allowed', status: :forbidden
    else
      @place.photos.create(photo_params.merge(user: current_user))
      redirect_to place_path(@place)
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:picture, :caption)
  end

end
