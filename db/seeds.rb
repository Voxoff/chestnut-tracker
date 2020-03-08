User.destroy_all

User.create!(email: 'god@chestnut.co.uk', password: '123123', admin: true)
Organisation.create!(name: "Pledge", user: User.first)

User.create!(email: 'test@test.com', password: '123123')
Organisation.create!(name: 'reele', user: User.second)
Tracker.create!(referrer: "http://www.reele.co", organisation: Organisation.second)
