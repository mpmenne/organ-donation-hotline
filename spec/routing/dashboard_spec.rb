require 'rails_helper'

RSpec.describe 'routes for dashboard' do
  it 'GET /api/v1/:phone_number' do
    expect(get('/dashboard/3144779999'))
      .to route_to(controller: 'dashboard', action: 'show', phone_number: '3144779999')
  end
end
