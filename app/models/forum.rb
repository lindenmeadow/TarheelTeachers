class Forum < ApplicationRecord
    has_many :discussions, dependent: :destroy
    has_many :users, through: :discussions
    validates :forum_name, presence: true
    resourcify
end
