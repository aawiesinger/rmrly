FactoryGirl.define do
    factory :message do
        from_user 'user1'
        to_user 'user2'
        body 'hello world'
    end
end