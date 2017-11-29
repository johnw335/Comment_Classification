class SubDriver < ApplicationRecord
  belongs_to :driver
  has_many :comment_sub_joins
  has_many :sub_word_joins
end
