class User < ApplicationRecord
    rolify
    has_secure_password

    has_many :discussions, dependent: :destroy
    has_many :forums, through: :discussions
    has_many :comments, dependent: :destroy

    validates :username, presence: true 
    validates :email, presence: true
    validates :password, presence: true, length: { minimum: 7  }
end
