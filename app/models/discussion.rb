class Discussion < ApplicationRecord
    belongs_to :forum
    belongs_to :user
    has_many :comments, dependent: :destroy
    
    scope :recent, -> { order(created_at: :desc) }

    validates :title, :content, presence: true
    resourcify
end
