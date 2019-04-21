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
    TransplantCenter.create(
      name: 'Saint Louis University Hospital',
      phone_number: '+13145778867',
      area_code: '314',
      city: 'Saint Louis',
      state: 'MO'
    )
    TransplantCenter.create(
      name: 'Barnes Jewish Hospital',
      phone_number: '+118668894376',
      area_code: '314',
      city: 'Saint Louis',
      state: 'MO'
    )
    TransplantCenter.create(
      name: 'Cedars Sinai Hospical',
      phone_number: '+13104232641',
      area_code: '310',
      city: 'Los Angeles',
      state: 'CA'
    )
  end
end
