class ShitsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :get_shit, only: [:show, :edit, :update, :destroy]

  def index
    @shits = Shit.last(10).reverse
  end

  def show

  end

  def new
    @shit = Shit.new
  end

  def create
    @shit = current_user.shits.build(shit_params)
    if @shit.save
      flash[:success] = "Dumb Shit Submitted!"
      redirect_to @shit
    else
      render 'new'
    end
  end

  def edit
    if current_user != @shit.user
      flash[:warning] = "You are not authorized to do that!"
      redirect_to root_path
    end
  end

  def update
    if current_user != @shit.user
      flash[:warning] = "YOu are not authorized to do that!"
      redirect_to root_path
    end
    if @shit.update_attributes(shit_params)
      flash[:success] = "Shit updated!"
      redirect_to @shit
    else
      render 'edit'
    end
  end

  private
    def get_shit
      @shit = Shit.find(params[:id])
    end

    def shit_params
      params.require(:shit).permit(:title, :description)
    end

end
