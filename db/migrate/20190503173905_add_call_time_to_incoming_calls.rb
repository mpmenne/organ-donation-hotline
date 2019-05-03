class AddCallTimeToIncomingCalls < ActiveRecord::Migration[5.2]
  def change
    add_column :incoming_calls, :call_time, :datetime
  end
end
