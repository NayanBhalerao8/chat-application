class User < ApplicationRecord
    validates :username, presence: true, length: {minimum: 4, maximum:15}
    has_many :messages
    has_secure_password
    
end
