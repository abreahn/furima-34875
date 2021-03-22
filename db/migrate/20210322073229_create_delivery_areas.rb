class CreateDeliveryAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_areas do |t|

      t.timestamps
    end
  end
end
