class SetList < ActiveRecord::Base
  belongs_to :song
  belongs_to :performance
  has_many :casts
  has_many :actors, through: :casts
end
