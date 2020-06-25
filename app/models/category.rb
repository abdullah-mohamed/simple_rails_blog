class Category < ApplicationRecord
    has_many :article_categories
    has_many :articles, through: :article_categories

    validates :name, presence: true, length: { minimum: 5, maximum: 25 },
                     uniqueness: { case_sensitive: false }
end