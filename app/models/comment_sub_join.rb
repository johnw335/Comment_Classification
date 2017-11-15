class CommentSubJoin < ApplicationRecord
  belongs_to :sub_driver
  belongs_to :comment
end
