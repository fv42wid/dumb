class ShitsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :get_shit, only: [:show, :edit, :update, :destroy]

  def index
    @shits = Shit.last(10)
  end

  def show

  end

  def new
    @shit = Shit.new
  end

  def create
    @shit = current_user.shits.build(issue_params)
    if @shit.save
      flash[:success] = "Dumb Shit Submitted!"
      redirect_to @shit
    else
      render 'new'
    end
  end

  private
    def get_shit
      @shit = Shit.find(params[:id])
    end

    def issue_params
      params.require(:shit).permit(:title, :description)
    end

end
