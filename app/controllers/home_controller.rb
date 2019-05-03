class HomeController < ApplicationController
  def index
    @hotlines = HotlineNumber.all
  end
end
