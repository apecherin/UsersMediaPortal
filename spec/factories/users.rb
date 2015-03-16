FactoryGirl.define do
  factory :user do |f|
    f.username "test"
    f.email "some_email_6@mailinator.com"
    f.password 'password'
  end
end