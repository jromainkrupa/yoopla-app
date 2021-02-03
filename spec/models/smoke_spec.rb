require 'rails_helper'

describe Smoke, type: :model do
  context 'Associations' do
    it 'should increment smokes_count' do
      caro = create(:user)
      Smoke.create(user: caro)
      caro.save

      expect(Smoke.count).to eq(1)
      expect(caro.smokes_count).to eq(1)
    end
  end

  it 'should persist a Smoke' do
    caro = create(:user)
    Smoke.create(user: caro)

    expect(Smoke.count).to eq(1)
  end

  it 'should not destroy if nil' do

  end
end
