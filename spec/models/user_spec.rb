require 'rails_helper'

describe User do
  context 'validations' do
    it { should have_one(:program) }
  end

  context 'associations' do
    it 'should associate a program' do
      user = build(:user)
      create(:program, user: user)

      expect(Program.count).to eq(1)
      expect(User.count).to eq(1)
    end
  end
end
