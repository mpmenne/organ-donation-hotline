class CreateHotlineNumbers < ActiveRecord::Migration[5.2]
  def change
    create_table :hotline_numbers do |t|
      t.string :phone_number
      t.references :transplant_center, foreign_key: true

      t.timestamps
    end
    change_table :incoming_calls do |t|
      t.references :hotline_number, foreign_key: true
      t.datetime :call_time
    end
  end
end
