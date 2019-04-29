class AddAddressToTransplantCenter < ActiveRecord::Migration[5.2]
  def change
    add_column :transplant_centers, :address, :string
  end
end
