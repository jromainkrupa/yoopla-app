class Program < ApplicationRecord
  belongs_to :user

  validates :init_smoke, presence: true
  validates :program_start, presence: true
  validates :program_end, presence: true
  validate :end_date_after_start_date



  def number_of_days
    ((self.program_end-self.program_start).fdiv(86400) + 1).to_i
  end

  # this method is the diminution program it's just linear
  def cigarette_allowed_for(date)
    program_day = day_number(date)
    ((-init_smoke.fdiv(number_of_days-1) * program_day) + init_smoke).ceil
  end

  # this method returns the n° of the day of program the first day return 0 !
  #dates have to be ActiveSupport::TimeWithZone
  def day_number(date)
    ((date - self.program_start).to_i.fdiv(86400)).round
  end

  private

  def end_date_after_start_date
    return if program_end.blank? || program_start.blank?
    if program_end < program_start
      errors.add(:program_end,"must be after the start_date")
    end
  end
end
