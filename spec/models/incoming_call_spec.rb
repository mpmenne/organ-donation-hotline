require 'rails_helper'

RSpec.describe IncomingCall, type: :model do
  it { should have_db_column :call_sid }
  it { should have_db_column :called }
  it { should have_db_column :call_status }
  it { should have_db_column :from }
  it { should have_db_column :from_number }
  it { should have_db_column :from_city }
  it { should have_db_column :from_state }
end
