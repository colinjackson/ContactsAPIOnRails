class FavoritesController < ApplicationController
  def index
    user = User.find(params[:id])
    render json: user.favorites
  end

  def update
    p fav_item
    updating_item = fav_item
    updating_item.favorite = !updating_item.favorite
    if updating_item.save
      render json: updating_item
    else
      render( {
        json: updating_item.errors.full_messages, status: :unprocessable_entity
      })
    end
  end

  private
  def fav_item
    params[:type].constantize.find(params[:fav_id])
  end
end
