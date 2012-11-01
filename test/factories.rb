require 'factory_girl'

FactoryGirl.define do
  factory :invitation do
    email Faker::Internet.email
  end
end

FactoryGirl.define do
  factory :unconfirmed_user, class: User do
    name                  Faker::Name.name
    email                 Faker::Internet.email
    invitation_id         FactoryGirl.create(:invitation).id
  end
end

FactoryGirl.define do
  factory :confirmed_user, class: User do
    name                  Faker::Name.name
    email                 Faker::Internet.email
    password              "2003asdf"
    password_confirmation "2003asdf"
    invitation_id         FactoryGirl.create(:invitation, :email => Faker::Internet.email).id
    confirmed  						true
  end
end

FactoryGirl.define do
  factory :organization do
  name Faker::Company.name
  end
end