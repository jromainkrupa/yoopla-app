require 'date'

FactoryBot.define do
  factory :smoke do
    user { nil }
  end

  factory :user do
    first_name   { 'caroline' }
    last_name    { 'Janin' }
    email        { 'c@c.com' }
    phone_number { '0695500784' }
    status       { nil }
    is_mentor    { false }
    password     { 'c@c.com' }
  end
end
