# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

host_user = User.new
host_user.name = "Host User"
host_user.save

guest_user = User.create(:name => "Guest User")
not_attending_user = User.create(:name => "Not Attending User")
attending_user = User.create(:name => "Attending User")

birthday = Event.create(:name => "Birthday", :host => host_user)
holiday_party = host_user.hosted_events.create(:name => "Holiday Party")

# birthday.host_id = 1 # 2 details, column and literal value
# birthday.host_id = host_user.id # 1 detail, column
# birthday.host = host_user # 0 details, just an attribute

Invite.create(:event => birthday, 
              :guest => guest_user, 
              :status => true)

birthday.invites.create(:guest => not_attending_user, :status => false)
attending_user.invites.create(:event => holiday_party, :status => true)

birthday.guests << guest_user
holiday_party.guests << guest_user