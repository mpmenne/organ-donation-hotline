require 'rails_helper'

RSpec.describe SignUpController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
    it 'creates a sign up' do
      expect { post :create, params: { email_adddress: 'g@g.com' } }
        .to change(SignUp, :count).by 1
    end
  end

  it { should permit(:email_address).for(:create, verb: :post) }

  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

end
