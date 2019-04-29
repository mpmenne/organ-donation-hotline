require 'rails_helper'

RSpec.describe TransplantCenter, type: :model do
  it { should have_db_column(:name) }
  it { should have_db_column(:phone_number) }
  it { should have_db_column(:area_code) }
  it { should have_db_column(:city) }
  it { should have_db_column(:state) }
  it { should have_db_column(:address) }
end
