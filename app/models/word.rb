class Word < ApplicationRecord
  has_many :comment_word_joins
  has_many :sub_word_joins


  def subs
    @word = Word.find(self.id)
    @joins = SubWordJoin.where(word: @word)
    @sub_names = []
    @joins.each do |join|
      @sub_names << join.sub_driver.name
    end
    return @sub_names
  end

  def percentage_each_sub
    @joins = SubWordJoin.where(word: @word)
    counts = Hash.new 0
    @sub_names = []
    @joins.each do |join|
      @sub_names << join.sub_driver.name
    end

    @sub_names.each do |sub|
      counts[sub] += 1
    end

    return counts
  end
end
