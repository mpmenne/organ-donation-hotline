require 'rails_helper'

RSpec.describe 'routes for sign_up' do
  it 'GET /sign_up' do
    expect(get('/sign_up'))
      .to route_to(controller: 'sign_up', action: 'new')
  end
  it 'POST /sign_up' do
    expect(post('/sign_up'))
      .to route_to(controller: 'sign_up', action: 'create')
  end
end
