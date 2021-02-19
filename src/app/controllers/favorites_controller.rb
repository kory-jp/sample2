class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.build(board_id: params[:board_id])
    favorite.save
    redirect_to boards_path
  end

  def destroy
    favorite = Favorite.find_by(board_id: params[:board_id], user_id: current_user.id)
    favorite.destroy
    redirect_to boards_path
  end
end
