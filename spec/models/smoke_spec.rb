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

  context 'Validations' do
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

  context 'today scope' do
    it 'return all the cigarettes smoked today for one user' do
      user = create(:user)
      5.times do
       Smoke.create(user: user)
      end
      3.times do
        Smoke.create(user:user, created_at: Time.zone.now + 1.day)
      end
      expect(user.smokes.today.count).to eq(5)
      expect(user.smokes_count).to eq(8)
    end

    it 'returns the number total of cigarettes smoked by all users ' do
      user_one = create(:user)
      user_two = create(:user, email:'another@another.com')
      5.times do
       Smoke.create(user: user_one)
       Smoke.create(user: user_two)
      end
      expect(Smoke.today.count).to eq(10)
    end
  end

end
