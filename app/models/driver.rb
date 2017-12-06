class Driver < ApplicationRecord
  has_many :comments
  has_many :sub_drivers

  def list_subs
    @sub = SubDriver.where(driver: self)
    @sub_list =[]
    @sub_count = 0
    @sub.each do |i|
      @sub_count += CommentSubJoin.where(sub_driver: i).count
    end

    @sub.each do |i|
      @each_sub = []
      @each_sub << i.name
      @each_sub_count =CommentSubJoin.where(sub_driver: i).count
      @each_sub << @each_sub_count.to_f / @sub_count.to_f
      @sub_list << @each_sub
    end
    @sub_sorted = @sub_list.sort_by {|_key, value| value}.reverse.first(5)
    # puts @sub_count
    return @sub_sorted, @sub_count
  end

end
