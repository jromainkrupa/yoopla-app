require 'rails_helper'

describe Program do
  context 'associations' do
    it { should belong_to(:user) }
  end
end
