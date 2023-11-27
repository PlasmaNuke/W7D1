class Cat < ApplicationRecord

    CAT_COLORS = %w(grey black orange calico white brown blue-grey)

    validates :birth_date, :name, presence: true
    validates :color, inclusion: { in: CAT_COLORS }
    validates :sex, inclusion: { in: %w(M F) }
    validate :birth_date_cannot_be_future 

private

    def birth_date_cannot_be_future 
        if birth_date > Date.today 
            errors.add(:birth_date, "cannot be in the future")
        end
    end


end