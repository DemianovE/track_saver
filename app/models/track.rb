class Track < ApplicationRecord
    validates :name, presence: true
    validates :startdate, presence: true
end
