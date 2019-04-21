class CreateIncomingCalls < ActiveRecord::Migration[5.2]
  def change
    create_table :incoming_calls do |t|
      t.string :call_sid
      t.string :called
      t.string :call_status
      t.string :from
      t.string :from_number
      t.string :from_city
      t.string :from_state

      t.timestamps
    end
  end
end
