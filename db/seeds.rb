# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = [{name: "user1", matches: ["user2", "user3"], email: "abc@binghamton.edu", password: "1234567"},
        {name: "user2", matches: ["user1"], email: "fkdlsaljfdsa@binghamton.edu", password: "fkldsakjfdkjslajkl"},
        {name: "user3", matches: ["user1"], email: "nvfdnvkd@binghamton.edu", password: "fern3jnr"}]

User.destroy_all
users.each {|user| User.create!(user)}