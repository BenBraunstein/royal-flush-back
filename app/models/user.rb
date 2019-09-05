class User < ApplicationRecord
    has_many :duties
    has_many :locations, through: :duties
    
end
