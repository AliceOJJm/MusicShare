# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin = User.create(
    :name => "Лиза Олехнович",
    :provider => "vkontakte",
    :uid => "92297276",
    :oauth_token => "201003be99dc0ca0795c4e758577e53ac0d3ea436b283bc2d8b515895b47ab10bea4c337720c5eeb8f873",
    :image  => "http://cs620716.vk.me/v620716276/12469/_L_gcif90t0.jpg",
    :is_admin => true
)

admin.save!
