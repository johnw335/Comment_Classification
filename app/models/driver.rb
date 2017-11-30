class Driver < ApplicationRecord
  has_many :comments
  has_many :sub_drivers

  def list_subs
    @sub = SubDriver.where(driver: self)
    @sub_list =[]
    @sub_count = 0
    @sub.each do |i|
      @sub_list << i.name
      @sub_count += CommentSubJoin.where(sub_driver: i).count
    end
    puts @sub_count
    return @sub_list
  end

end
