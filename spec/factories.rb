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
      status    { 'mentor'}
    end

    factory :setuped_user do
      status                     { 'ready_to_start' }
      average_cigarettes_per_day { 3 }
      hour_of_first_smoke        { '10:30' }
      best_cigarettes            { }
    end

    factory :in_program_user do
      status { 'in_program' }
    end
  end

  factory :program do
    program_start { Time.zone.now + 2.day }
    program_end   { Time.zone.now + 20.day }
    init_smoke    { 20 }

    factory :in_program do
      in_program_user
      program_start { Time.zone.now - 2.day }
      program_end   { Time.zone.now + 35.day }
      init_smoke    { 15 }
    end

  end
end
