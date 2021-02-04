require 'rails_helper'

describe User, type: :model do
  context 'validations' do
    it "is valid with a first name, last name, email, and password" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without a first name" do
      user = User.new(first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include('can\'t be blank')
    end

    it "is invalid without a last name" do
      user = User.new(last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include('can\'t be blank')
    end

    it "is invalid without an email address" do
      user = User.new(email: nil)
      user.valid?
      expect(user.errors[:email]).to include('can\'t be blank')
    end

    it "is invalid without a password" do
      user = User.new(password: nil)
      user.valid?
      expect(user.errors[:password]).to include('can\'t be blank')
    end


    it "is invalid with a duplicate email address" do
      User.create(
        first_name: 'Jean',
        last_name: 'KRUPA',
        email: 'toto@toto.com',
        password: 'tototototo')
      user = User.new(
        first_name: 'Jean',
        last_name: 'KRUPA',
        email: 'toto@toto.com',
        password: 'tototototo')
      user.valid?
      expect(user.errors[:email]).to include('has already been taken')
    end

    it 'is invalid with a wrong status' do
      user = create(:user)
      user.status = 'something wrong'
      user.valid?
      expect(user.errors[:status]).to include('is not included in the list')
    end
  end
end
