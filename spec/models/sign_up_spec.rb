require 'rails_helper'

RSpec.describe SignUp, type: :model do
  it { should have_db_column(:email_address) }
end
