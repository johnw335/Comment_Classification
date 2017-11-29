class Word < ApplicationRecord
  has_many :comment_word_joins
  has_many :sub_word_joins
end
