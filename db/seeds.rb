# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u = User.create email: 'user@example.com', password: 'password'

t1 = Team.create name: 'team1', visibility: 'public',  creator: u
t2 = Team.create name: 'team2', visibility: 'public',  creator: u
t3 = Team.create name: 'team1', visibility: 'private', creator: u

c1 = Channel.create name: 'channel1', visibility: 'public',  team: t1, creator: u
c2 = Channel.create name: 'channel2', visibility: 'public',  team: t1, creator: u
c3 = Channel.create name: 'channel3', visibility: 'private', team: t1, creator: u

m1 = Message.create content: 'message1', channel: c1, creator: u
m2 = Message.create content: 'message2', channel: c1, creator: u
m3 = Message.create content: 'message3', channel: c1, creator: u
