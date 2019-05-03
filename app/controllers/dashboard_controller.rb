class DashboardController < ApplicationController

  def show
    @hotline = HotlineNumber.find_by(phone_number: "+#{dash_params[:phone_number]}")
    render 'show'
  end

  def dash_params
    params.permit(:phone_number)
  end
end
