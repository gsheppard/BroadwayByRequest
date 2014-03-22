class Performance < ActiveRecord::Base
  has_many :set_lists
  has_many :songs, through: :set_lists
end

