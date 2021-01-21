Program.destroy_all
User.destroy_all
puts "kemehameha...."

# caroline just signup expect redirect_to st_status_form
caroline = User.create!(
  first_name: 'caroline',
  last_name: 'Janin',
  email: 'c@c.com',
  password: 'azerty'
  )

# eloise doesn't smoke she is a mentor
# expect redirect_to invite a friend
eloise = User.create!(
  first_name: 'eloise',
  last_name: 'pividori',
  status: 'invite_a_friend',
  is_mentor: true,
  email: 'e@e.com',
  password: 'azerty'
  )

puts "created #{User.count} users}"
