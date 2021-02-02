require 'rails_helper'

describe User do
  context 'validations' do
    it { should have_one(:program) }
  end

  context 'associations' do
    it 'should associate a program' do

    end
  end
end
