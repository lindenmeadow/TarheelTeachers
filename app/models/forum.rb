class Forum < ApplicationRecord
    has_many :discussions, dependent: :destroy
    has_many :users, through: :discussions
    has_many :comments, through: :discussions
    validates :forum_name, presence: true
    scope :discussions, -> {where('forum_id = ?', @forum.id) } 
    resourcify
end
