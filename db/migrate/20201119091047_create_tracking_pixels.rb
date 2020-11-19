class CreateTrackingPixels < ActiveRecord::Migration[5.2]
  def change
    create_table :tracking_pixels do |t|
      t.string :name
      t.integer :provider_id
      t.boolean :converted, :default => false

      t.timestamps
    end
    add_index :tracking_pixels, :provider_id
  end
end
