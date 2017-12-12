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

  def subs_as_objects
    @word = Word.find(self.id)
    @joins = SubWordJoin.where(word: @word)
    @subs = []
    @joins.each do |join|
      @subs << join.sub_driver
    end
    return @subs
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
    @sum = counts.values.map.reduce(:+).to_f
    puts @sum
    a_new_hash = counts.inject({}) { |h, (k, v)| h[k] = (v / @sum)*100; h }

    # return counts
    return a_new_hash.sort_by {|_key, value| value}.reverse
  end

  def word_by_driver_and_sub(driver)
    @word = Word.find(self.id)
    driver_sub_hash = Hash.new

    driver_hash = Hash.new
    @subs = SubDriver.where(driver: driver)
    @subs.each do |sub|
      @joins = SubWordJoin.where(word: @word, sub_driver: sub )
      @joins.each do |join|
        puts "************"
        puts join.sub_driver.name
        puts join.sub_driver.driver.name
      end
    end
  end
end
