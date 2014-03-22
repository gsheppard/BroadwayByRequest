class Cast < ActiveRecord::Base
  belongs_to :actors
  belongs_to :set_lists
end
