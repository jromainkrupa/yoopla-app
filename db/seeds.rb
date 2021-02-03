require 'date'

Program.destroy_all
User.destroy_all
puts "kemehameha...."

# caroline just signup expect redirect_to set_status_form
caroline = User.create!(
  first_name: 'caroline',
  last_name: 'Janin',
  email: 'c@c.com',
  password: 'c@c.com'
  )

# eloise doesn't smoke she is a mentor
# expect redirect_to invite a friend
eloise = User.create!(
  first_name: 'eloise',
  last_name: 'pividori',
  status: 'invite_a_friend',
  is_mentor: true,
  email: 'e@e.com',
  password: 'e@e.com'
  )

# Joseph has finish his setup program is in 1 day
# expect redirect_to get ready
joseph = User.create!(
  first_name: 'joseph',
  last_name: 'Krupa',
  status: 'ready_to_start',
  is_mentor: false,
  email: 'joseph@joseph.com',
  password: 'joseph@joseph.com'
  )
Program.create!(program_start: Time.zone.now + 2.day,
            program_end: Time.zone.now + 25.day,
            init_smoke: 20,
            user: joseph)

# Romain has already started his program
# expect redirect_to his dashboard
romain = User.create!(
  first_name: 'romain',
  last_name: 'Krupa',
  status: 'in_program',
  is_mentor: false,
  email: 'romain@romain.com',
  password: 'romain@romain.com'
  )

Program.create!(program_start: Time.zone.now - 2.day,
            program_end: Time.zone.now + 35.day,
            init_smoke: 15,
            user: romain)

Smoke.create!(user: romain, created_at: Time.zone.now - 4.hours)
Smoke.create!(user: romain, created_at: Time.zone.now - 3.hours)
Smoke.create!(user: romain, created_at: Time.zone.now - 2.hours)
puts "created #{User.count} users}"
