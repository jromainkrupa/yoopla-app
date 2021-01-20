class Program < ApplicationRecord
  belongs_to :user
  has_many   :days

  def number_of_days
    ((self.end-self.start)/86400 + 1).to_i
  end
end
