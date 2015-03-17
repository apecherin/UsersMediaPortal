# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


u1 = User.create(username: 'apecherin', email: 'apecherin@fhg.tin', password: '12345678')
u2 = User.create(username: 'spupkin', email: 'apecherin@fhg.tin2', password: '12345678')
u3 = User.create(username: 'zlupkin', email: 'apecherin@fhg.tin3', password: '12345678')