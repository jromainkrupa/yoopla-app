class Program < ApplicationRecord
  belongs_to :user
  has_many   :days

  def number_of_days
    ((self.end-self.start)/86400 + 1).to_i
  end

  def cigarette_allowed_for(date)
    program_day = get_program_day(date)
    (-init_smoke.fdiv(number_of_days) * (program_day) + init_smoke).round
  end

  private

  def get_program_day(date)
    (date - self.start).to_i
  end
end
