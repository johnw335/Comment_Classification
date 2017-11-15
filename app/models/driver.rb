class Driver < ApplicationRecord
  has_many :comments
  has_many :sub_drivers
end
