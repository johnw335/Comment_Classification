class CreateSubDrivers < ActiveRecord::Migration[5.0]
  def change
    create_table :sub_drivers do |t|

      t.timestamps
    end
  end
end
