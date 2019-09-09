class User < ApplicationRecord
    has_many :duties
    has_many :locations, through: :duties
    validates :username, uniqueness: true
    has_secure_password
end
