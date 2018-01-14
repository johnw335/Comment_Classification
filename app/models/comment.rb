class Comment < ApplicationRecord
  belongs_to :team
  belongs_to :driver
  has_many :comment_sub_joins
  has_many :comment_word_joins


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

  def all_words
    comment = Comment.find(self.id)
    @words_array = comment.comment_text.to_s.split(/\W+/)
    @word_array_objects = []


    @words_array.each do |word|
      if Word.find_by(name: word)
        word_object = Word.find_by(name: word)
        @word_array_objects << word_object
      end
    end

    return @word_array_objects
  end

  def predict_sentence(driver)
    comment = Comment.find(self.id)
    total_subs_with_percents = []
    comment.all_words.each do |word|
      if word.word_exists_in_db == true && word.ignored == false
        total_subs_with_percents << word.percentage_subs_given_driver(driver)
      end
    end

    counts = Hash.new 0
    total_subs_with_percents.flatten(1).each do |sub|
      counts[sub[0]] += sub[1]
    end
    @sum = counts.values.map.reduce(:+).to_f
    a_new_hash = counts.inject({}) { |h, (k, v)| h[k] = (v / @sum)*100; h }
    return a_new_hash.sort_by {|_key, value| value}.reverse.first(3)
  end

  def all_words_new
    comment = self
    @words_array = comment.comment_text.to_s.split(/\W+/)
    @word_array_objects = []


    @words_array.each do |word|
      if Word.find_by(name: word)
        word_object = Word.find_by(name: word)
        @word_array_objects << word_object
      end
    end

    return @word_array_objects
  end


  def predict_new(driver)
    comment = self
    total_subs_with_percents = []
    comment.all_words_new.each do |word|
      if word.word_exists_in_db == true && word.ignored == false
        total_subs_with_percents << word.percentage_subs_given_driver(driver)
      end
    end

    counts = Hash.new 0
    total_subs_with_percents.flatten(1).each do |sub|
      counts[sub[0]] += sub[1]
    end
    @sum = counts.values.map.reduce(:+).to_f
    a_new_hash = counts.inject({}) { |h, (k, v)| h[k] = (v / @sum)*100; h }
    return a_new_hash.sort_by {|_key, value| value}.reverse.first(3)
  end

end