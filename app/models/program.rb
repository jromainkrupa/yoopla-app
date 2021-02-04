class Program < ApplicationRecord
  belongs_to :user

  validates :init_smoke, presence: true
  validates :program_start, presence: true
  validates :program_end, presence: true
  validate  :program_duration
  validate  :init_smoke_range



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

  def program_duration
    return if program_end.blank? || program_start.blank?
    if program_end < program_start
      errors.add(:program_end, "must be after the start_date")
    elsif (program_end - program_start) < 1296000 # this 15 days is sec
      errors.add(:program_end, "must be at least 15 days")
    elsif (program_end - program_start) > 31540000 # this is a year in sec
      errors.add(:program_end, "program can't be longer than a year")
    elsif program_start < (Time.zone.now + 1.day)
      errors.add(:program_start, "can't start before tomorow")
    end
  end

  def init_smoke_range
    return if init_smoke.blank?
    if init_smoke < 5
      errors.add(:init_smoke, "We won't be very useful if you smoke less than 5 cigarettes a day")
    elsif init_smoke > 20
      errors.add(:init_smoke, "We initialize the program with maximum one packet a day")
    end
  end
end
