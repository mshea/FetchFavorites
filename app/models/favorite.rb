class Favorite < ActiveRecord::Base
  validates_uniqueness_of :id_str
  belongs_to :feed # feed_id
end
