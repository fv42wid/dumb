class Shits::LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :get_shit

  def create
    @shit.likes.where(user_id: current_user.id).first_or_create
    flash[:success] = "You liked this!"
    redirect_to @shit
  end

  private
    def get_shit
      @shit = Shit.find(params[:shit_id])
    end
end
