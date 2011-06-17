class Feed < ActiveRecord::Base
  has_many :favorites
end
