FactoryBot.define do
  factory :user do
    email { 'chester@tester.com' }
    password { 'secret' }
    password_confirmation { 'secret' }
  end
end
