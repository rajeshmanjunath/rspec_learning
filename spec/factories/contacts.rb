#require 'faker'

#FactoryGirl.define do
#  factory :contact do
#    firstname { Faker::Name.first_name }
#    lastname { Faker::Name.last_name }
#    email { Faker::Internet.email }
#
#    after(:build) do |contact|
#      [:home_phone, :work_phone, :mobile_phone].each do |phone|
#        contact.phones << FactoryGirl.build(:phone,
#          phone_type: phone, contact: contact)
#      end
#    end
#
#    factory :invalid_contact do
#      firstname nil
#    end
#  end
#end


FactoryGirl.define do
  factory :contact do
    firstname "John"
    lastname "Doe"
    sequence(:email) {|n| "johndoe#{n}@example.com"}

    after(:build) do |contact|
      [:home_phone, :work_phone, :mobile_phone].each do |phone|
        contact.phones <<  FactoryGirl.build(:phone,
          phone_type: phone, contact: contact)
      end
    end

    factory :invalid_contact do
       firstname nil
    end

  end

  #factory :contact do
  #  firstname { Faker::Name.first_name }
  #  lastname { Faker::Name.last_name }
  #  email { Faker::Internet.first_name }
  #end
end