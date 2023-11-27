class Cat < ApplicationRecord

    CAT_COLORS = %w(grey black orange calico white brown blue-grey)

    validates :birth_date, :name, presence: true
    validates :color, inclusion: { in: CAT_COLORS }
    validates :sex, inclusion: { in: %w(M F) }
    validate :birth_date_cannot_be_future 

    def age
        age_year = Date.today.year - birth_date.year
        age_month = Date.today.month - birth_date.month
        age_day = Date.today.day - birth_date.day

        if age_month > 0 || (age_month == 0 && age_day > 0)
            return age_year
        end
        age_year - 1
    end

private

    def birth_date_cannot_be_future 
        if birth_date && birth_date > Date.today 
            errors.add(:birth_date, "cannot be in the future")
        end
    end


end