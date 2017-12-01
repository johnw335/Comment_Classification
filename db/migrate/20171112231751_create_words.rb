class CreateWords < ActiveRecord::Migration[5.0]
  def change
    create_table :words do |t|
      t.string :name
      t.boolean :ignored, default: false
      t.timestamps
    end
  end
end
