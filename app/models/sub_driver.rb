class SubDriver < ApplicationRecord
  belongs_to :driver
  has_many :comment_sub_joins
  has_many :sub_word_joins


  def top_five_words
    @sub = SubDriver.find(self.id)
    @sub_word_joins = SubWordJoin.where(sub_driver: @sub)
    @words = []
    @sub_word_joins.each do |join|
      if join.word.ignored == false
        @words << join.word.name
      end
    end
   return count_words(@words).sort_by {|_key, value| value}.reverse.first(5)
  end

  def count_words(words)

    counts = Hash.new 0
    @words = words
    @words.each do |word|
      counts[word] += 1
    end
    return counts
  end

end
