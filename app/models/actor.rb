class Actor < ActiveRecord::Base
  has_many :casts
  has_many :set_lists, through: :casts
end
