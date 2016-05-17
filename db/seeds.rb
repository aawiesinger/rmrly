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
        
messages = [{to_user: "user1", from_user: "user2", body: "hey hi hello whats up"},
           {to_user: "user2", from_user: "user1", body: "hey lets be roommates!!!!"},
           {to_user: "user1", from_user: "user2", body: "Okay cool great awesome"},
           {to_user: "user2", from_user: "user1", body: "yeah alright lets do it"}]

User.destroy_all
users.each {|user| User.create!(user)}

Message.destroy_all
messages.each{|message| Message.create!(message)}