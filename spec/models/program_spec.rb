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

      expect(program.errors[:init_smoke]).to include('can\'t be blank')
    end

    it 'is invalid without a program_start date' do
      program = Program.new(program_start: nil)
      program.valid?

      expect(program.errors[:program_start]).to include('can\'t be blank')
    end
    it 'is invalid without a program_end date' do
      program = Program.new(program_end: nil)
      program.valid?

      expect(program.errors[:program_end]).to include('can\'t be blank')
    end

    it 'is invalid with a end before a start date' do
      program = Program.new(
        program_start: Time.zone.now + 1.day,
        program_end: Time.zone.now)
      program.valid?

      expect(program.errors[:program_end]).to include('must be after the start_date')
    end

    it 'is invalid with a program shorter than 2 weeks' do
      program = Program.new(
        program_start: Time.zone.now,
        program_end: Time.zone.now + 10.days)
      program.valid?

      expect(program.errors[:program_end]).to include('must be at least 15 days')
    end

    it 'is invalid with a program greater than 12 months' do
      program = Program.new(
        program_start: Time.zone.now + 2.days,
        program_end: Time.zone.now + 1.year + 6.days)
      program.valid?
      expect(program.errors[:program_end]).to include('program can\'t be longer than a year')
    end

    it 'is invalid with a start date before tomorow' do
      program = Program.new(
        program_start: Time.zone.now,
        program_end: Time.zone.now + 30.days)
      program.valid?
      expect(program.errors[:program_start]).to include('can\'t start before tomorow')
    end

    it 'is invalid with a init_smoke under 5 cigarettes a day' do
      program = Program.new(
        init_smoke: 3)
      program.valid?

      expect(program.errors[:init_smoke]).to include("We won't be very useful if you smoke less than 5 cigarettes a day")
    end

    it 'is invalid with a init_smoke over 20 cigarettes a day' do
      program = Program.new(
        init_smoke: 22)
      program.valid?

      expect(program.errors[:init_smoke]).to include("We initialize the program with maximum one packet a day")
    end
  end
end
