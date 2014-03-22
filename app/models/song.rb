class Song < ActiveRecord::Base
  belongs_to :musical
  has_many :set_lists
  has_many :performances, through: :set_lists
end
