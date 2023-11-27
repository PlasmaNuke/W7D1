class Cat < ApplicationRecord
    validates :birth_date, :name, presence: true
end