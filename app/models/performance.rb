class Performance < ActiveRecord::Base
  has_many :set_lists
  has_many :songs, through: :set_lists

  def clean_time
    DateTime.strptime(date.to_s, "%m/%d/%Y %H:%m")
  end
end

