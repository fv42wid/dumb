class ShitsController < ApplicationController

  def index
    @shits = Shit.last(10)
  end

end
