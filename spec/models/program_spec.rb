require 'rails_helper'

describe Program, type: :model do
  context 'associations' do
    it { should belong_to(:user) }
  end

  context 'validations' do
    it 'is valid with a user, init_smoke, start date and end date'
    it 'is invalid without a user'
    it 'is invalid without a init_smoke'
    it 'is invalid without a program_start date'
    it 'is invalid without a program_end date'
    it 'is invalid with a end before a start date'
    it 'is invalid with a program shorter than 2 weeks'
    it 'is invalid with a start date before tomorow'
    it 'is invalid with a init_smoke superior at 30 smokes'
    it 'does not allow duplicate program per user'
  end
end
