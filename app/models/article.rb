class Article < ApplicationRecord
    # Uupdate : has_one :user
    has_many :comments, dependent: :destroy
    validates :title, presence: true, length: {minimum: 5}
end
