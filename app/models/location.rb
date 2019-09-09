class Location < ApplicationRecord
    has_many :duties
    has_many :users, through: :duties
end
