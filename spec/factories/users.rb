FactoryGirl.define do
    factory :user do
        email 'abc@binghamton.edu'
        password '1234567'
        name 'fake user'
        matches []
    end
end