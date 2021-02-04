require 'rails_helper'

describe Program, type: :model do
  context 'associations' do
    it { should belong_to(:user) }
  end

  context 'validations' do
    it 'is valid with a user, init_smoke, start date and end date' do
      program = build(:program)
      expect(program).to be_valid
    end

    it 'is invalid without a user' do
      program = Program.new(user: nil)
      program.valid?
      expect(program.errors[:user]).to include('must exist')
    end

    it 'is invalid without a init_smoke' do
      program = Program.new(init_smoke: nil)
      program.valid?
      p program.errors
      expect(program.errors[:init_smoke]).to include('can\'t be blank')
    end

    it 'is invalid without a program_start date' do
      program = Program.new(program_start: nil)
      program.valid?
      p program.errors
      expect(program.errors[:program_start]).to include('can\'t be blank')
    end
    it 'is invalid without a program_end date' do
      program = Program.new(program_end: nil)
      program.valid?
      p program.errors
      expect(program.errors[:program_end]).to include('can\'t be blank')
    end

    it 'is invalid with a end before a start date' do
      program = Program.new(
        program_start: Time.zone.now + 1.day,
        program_end: Time.zone.now)
      program.valid?
      p program.errors
      expect(program.errors[:program_end]).to include('must be after the start_date')
    end

    it 'is invalid with a program shorter than 2 weeks' do
      program = Program.new(
        program_start: Time.zone.now + 1.day,
        program_end: Time.zone.now)
      program.valid?
      p program.errors
      expect(program.errors[:program_end]).to include('must be at least 15 days')
    end

    it 'is invalid with a start date before tomorow' do
      program = Program.new(
        program_start: Time.zone.now)
      program.valid?
      p program.errors
      expect(program.errors[:program_start]).to include('can\'t start before tomorow')
    end

    it 'is invalid with a init_smoke under 5 cigarettes a day' do
      program = Program.new(
        init_smoke: 3)
      program.valid?
      p program.errors
      expect(program.errors[:init_smoke]).to include("We won't be very useful if you smoke less than 3 cigarettes a day")
    end
    it 'does not allow duplicate program per user'
  end
end
