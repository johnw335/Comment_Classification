class SubDriver < ApplicationRecord
  belongs_to :driver
  has_many :comment_sub_joins
end
