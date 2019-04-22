class CreateTransplantCenters < ActiveRecord::Migration[5.2]
  def change
    create_table :transplant_centers do |t|
      t.string :name
      t.string :phone_number
      t.string :area_code
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
