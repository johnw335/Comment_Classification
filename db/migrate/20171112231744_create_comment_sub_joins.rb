class CreateCommentSubJoins < ActiveRecord::Migration[5.0]
  def change
    create_table :comment_sub_joins do |t|
      t.belongs_to :sub_driver
      t.belongs_to :comment
      t.timestamps
    end
  end
end
