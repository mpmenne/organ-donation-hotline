class SignUpController < ApplicationController
  def new
    @sign_up = SignUp.new
  end

  def create
    @sign_up = SignUp.new(sign_up_params)
    @sign_up.save!
  end

  private

  def sign_up_params
    params.permit(:email_address)
  end
end
