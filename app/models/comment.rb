class Comment < ApplicationRecord
    belongs_to :discussion
    belongs_to :user
    validates :content, presence: true
    resourcify
end
