class Performance < ActiveRecord::Base
  has_many :set_lists
  has_many :songs, through: :set_lists

  def clean_time
    date.to_datetime.strftime("%m/%d/%Y %H:%m")
  end

  def song_builder(ids)
    returns = []
    ids.each do |song_id|
      set = SetList.new(song: Song.find(song_id), performance: self)
      returns << set.save
    end
    !returns.include?(false)
  end

  def find_set_list(song)
    SetList.where(performance: self, song: song).first
  end
end

