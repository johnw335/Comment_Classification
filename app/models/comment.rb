class Comment < ApplicationRecord
  belongs_to :team
  belongs_to :driver
  has_many :comment_sub_joins
  has_many :comment_word_joins
end

def analyse_each_word
  @joins = CommentWordJoin.where(comment: self)
  @words = []
  @joins.each do |join|
    @words << join.word
  end
  @words.each do|word|
    puts word.text
  end
end