class Program < ApplicationRecord
  belongs_to :user

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
end
