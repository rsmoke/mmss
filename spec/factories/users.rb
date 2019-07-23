FactoryBot.define do
  factory :user do
    email { 'chesttest@tester.com' }
    password { 'secret' }
    password_confirmation { 'secret' }
  end
end
