require 'rails_helper'

RSpec.describe HotlineNumber, type: :model do
  it { should belong_to(:transplant_center) }
  it { should have_many(:incoming_calls) }
  it { should have_db_column(:phone_number) }
  it { should have_db_column(:transplant_center_id) }
end
