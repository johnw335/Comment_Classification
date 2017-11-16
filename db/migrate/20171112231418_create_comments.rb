class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :comment_text
      t.belongs_to :driver
      t.belongs_to :team
      t.boolean :tagged, default: false
      t.timestamps
    end
  end
end
