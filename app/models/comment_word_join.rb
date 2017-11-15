class CommentWordJoin < ApplicationRecord
  belongs_to :comment
  belongs_to :word
end
