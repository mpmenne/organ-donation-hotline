class HotlineNumber < ApplicationRecord
  belongs_to :transplant_center
  has_many :incoming_calls
end
