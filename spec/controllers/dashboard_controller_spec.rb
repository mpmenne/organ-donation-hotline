require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
  describe '#show' do
    context 'when successfull request' do
      it 'returns a 200' do
        FactoryBot.create(:hotline_number)

        get :show, params: { phone: '3147779998' }

        expect(response).to be_successful
      end
    end
    
    it { should permit(:phone_number).for(:show, verb: :get) }
  end
end
