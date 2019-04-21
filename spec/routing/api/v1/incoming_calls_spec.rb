require 'rails_helper'

RSpec.describe 'routes for incoming calls' do
  it 'POST /api/v1/incoming_calls' do
    expect(post('/api/v1/incoming_calls'))
      .to route_to('api/v1/incoming_calls#create')
  end
end
