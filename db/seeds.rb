# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

bigdawg = User.create(username: 'bigdawg')
lilcat = User.create(username: 'lilcat')

broski = Contact.create({
  name: 'jabroni',
  email:'datjabroni@jab.roni',
  user_id: bigdawg.id
})

homie = Contact.create({
  name: 'datguy',
  email:'daguy@place.com',
  user_id: lilcat.id
})

ContactShare.create(contact_id: broski.id, user_id: lilcat.id)
ContactShare.create(contact_id: homie.id, user_id: bigdawg.id)