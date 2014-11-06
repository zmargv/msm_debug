class Movie < ActiveRecord::Base
  validates(:director_id, { :presence => true })
end
