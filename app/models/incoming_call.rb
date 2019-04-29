class IncomingCall < ApplicationRecord
  belongs_to :hotline_number, optional: true
end
