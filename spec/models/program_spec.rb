require 'rails_helper'

describe Program do
  context 'associations' do
    it { should belong_to(:user) }
  end

  context 'validations' do
  end

  context 'method' do
    it 'has a start date' do
      program = Program.new(program_start: '01/02/2020')

      expect(program.program_start).to eq('01/02/2020')
      expect(program.program_start).to eq('01/02/2020')
      expect(program.program_start).to eq('01/02/2020')
    end
    it 'has a end date' do
    end
    it 'has a init smoke' do
    end
  end
end
