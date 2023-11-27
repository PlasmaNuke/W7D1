class Cat < ApplicationRecord


    validates :birth_date, :name, presence: true
    validates :color, inclusion: { in: CAT_COLORS }
    validates :sex, inclusion: { in: %w(M F) }
end