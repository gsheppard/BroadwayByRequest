class Actor < ActiveRecord::Base
  has_many :casts
  has_many :set_lists, through: :casts

  def full_name
    first_name + ' ' + last_name
  end
end
