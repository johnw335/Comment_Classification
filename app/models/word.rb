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

  def percentage_subs_given_driver(driver)
    subs = SubDriver.where(driver: driver)

    driver_joins = []
    subs.each do |sub|
      joins = SubWordJoin.where(word: @word, sub_driver: sub)
      if joins.count > 0
         joins.each do |join|
          driver_joins << join.sub_driver.name
         end

      end
    end

    counts = Hash.new 0
    driver_joins.each do |sub|
      counts[sub] += 1
    end
    @sum = counts.values.map.reduce(:+).to_f
    a_new_hash = counts.inject({}) { |h, (k, v)| h[k] = (v / @sum)*100; h }

    return a_new_hash.sort_by {|_key, value| value}.reverse.first(3)

  end

  def word_exists_in_db
    if @word = Word.find(self.id)
      true
    end
  end

  def word_by_driver_and_sub(driver)
    @word = Word.find(self.id)
    driver_sub_hash = Hash.new

    sub_array = []
    sub_counts = Hash.new 0
    @subs = SubDriver.where(driver: driver)
    @subs.each do |sub|
      @joins = SubWordJoin.where(word: @word, sub_driver: sub )
      @joins.each do |join|
        sub_array << join.sub_driver.name
      end
    end

    sub_array.each do |sub|
      sub_counts[sub] += 1
    end
    @sum = sub_counts.values.map.reduce(:+).to_f
    sub_counts = sub_counts.sort_by {|_key, value| value}.reverse.first(5)
    return sub_counts, @sum
  end

  def percentage_driver_when_general
    @word = Word.find(self.id)
    @general = Driver.find_by(name: 'General')
    @drivers_list = Driver.all
    @drivers_list = @drivers_list - [@general]


    @joins = SubWordJoin.where(word: @word)
    counts = Hash.new 0
    @sub_names = []
    @joins.each do |join|
      @sub_names << join.sub_driver
    end

    @sub_names.each do |sub|
      counts[sub] += 1
    end
    @sum = counts.values.map.reduce(:+).to_f
    a_new_hash = counts.inject({}) { |h, (k, v)| h[k] = (v / @sum)*100; h }

    drivers_list = []
    subs_hash = a_new_hash.sort_by {|_key, value| value}.reverse
    subs_hash.each do |sub|
      drivers_list << sub[0].driver.name
    end

    counts_2 = Hash.new 0
    drivers_list.each do |sub|
      counts_2[sub] += 1
    end

    @sum = counts_2.values.map.reduce(:+).to_f
    a_new_hash = counts_2.inject({}) { |h, (k, v)| h[k] = (v / @sum)*100; h }
    puts "**********************"
    puts a_new_hash

    return a_new_hash.sort_by {|_key, value| value}.reverse.first(3)

  end


end
