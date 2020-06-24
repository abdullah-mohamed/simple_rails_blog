class Category < ApplicationRecord
    validates :name, presence: true, length: { minimum: 5, maximum: 25 },
                     uniqueness: { case_sensitive: false }
end