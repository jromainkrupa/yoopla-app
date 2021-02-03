require 'rails_helper'

describe Program, type: :model do
  context 'associations' do
    it { should belong_to(:user) }
  end

  context 'validations' do
    it 'should persist a program' do
      caro = create(:user)
      program = Program.create(user: caro)
      program.validate

      expect(Program.count).to eq(1)
    end
  end
end
