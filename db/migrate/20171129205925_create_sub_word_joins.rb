class CreateSubWordJoins < ActiveRecord::Migration[5.0]
  def change
    create_table :sub_word_joins do |t|
      t.belongs_to :word
      t.belongs_to :sub_driver
      t.timestamps
    end
  end
end
