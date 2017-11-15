class Comment < ApplicationRecord
  belongs_to :team
  belongs_to :driver
  has_many :comment_sub_joins
  has_many :comment_word_joins
end
