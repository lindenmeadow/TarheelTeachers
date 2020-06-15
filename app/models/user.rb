class User < ApplicationRecord
    rolify
    has_secure_password

    has_many :discussions, dependent: :destroy
    has_many :forums, through: :discussions
    has_many :comments, dependent: :destroy

    validates :username, presence: true 
    validates :username, uniqueness: true
    validates :email, presence: true
    validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
    validates :password, presence: true, length: { minimum: 7  }
end
