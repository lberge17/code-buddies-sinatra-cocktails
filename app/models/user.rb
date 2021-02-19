class User < ActiveRecord::Base
    has_secure_password
    validates :email, 
        presence: true,
        email: true,
        uniqueness: { case_sensitive: false },
        length: { minimum: 4, maximum: 254 }
    validates :name, 
        presence: true,
        length: { minimum: 2, maximum: 254 }

    has_many :cocktails
end