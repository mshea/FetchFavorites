class Favorite < ActiveRecord::Base
  validates_uniqueness_of :id_str
end
