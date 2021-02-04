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

    factory :mentor_user do
      is_mentor { true }
      status    { 'invite_a_friend' }
    end

    factory :ready_to_start_user do
      status { 'ready_to_start' }
    end

    factory :in_program_user do
      status { 'in_program' }
    end
  end

  factory :program do
    user
    init_smoke    { 17 }
    program_start { Time.zone.now + 2.days  }
    program_end   { program_start + 20.days }

    factory :program_started do
      program_start { Time.zone.now - 2.days  }
      program_end   { program_start + 20.days }
    end
  end
end
