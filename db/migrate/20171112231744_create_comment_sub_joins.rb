class CreateCommentSubJoins < ActiveRecord::Migration[5.0]
  def change
    create_table :comment_sub_joins do |t|

      t.timestamps
    end
  end
end
