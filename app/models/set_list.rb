class SetList < ActiveRecord::Base
  belongs_to :song
  belongs_to :performance
  has_many :casts
  has_many :actors, through: :casts

  def set_actors(actor_ids)
    returns = []
    actor_ids.each do |actor_id|
      cast_member = Cast.new(set_list: self, actor_id: actor_id)
      returns << cast_member.save
    end
    !returns.include?(false)
  end
end
