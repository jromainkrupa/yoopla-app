require 'rails_helper'

describe Smoke, type: :model do
  context 'Associations' do
    it 'increment smokes_count when persisted' do
      user = create(:user)
      Smoke.create(user: user)
      user.save

      expect(Smoke.count).to eq(1)
      expect(user.smokes_count).to eq(1)
    end
  end
  context 'validations' do
    it 'persist a Smoke with valid inputs' do
      user = create(:user)
      Smoke.create(user: user)

      expect(Smoke.count).to eq(1)
    end
    it 'is not valid without a user' do
      smoke = Smoke.new(user: nil)
      smoke.valid?
      expect(smoke.errors[:user]).to include('must exist')
    end
  end

end
