FactoryBot.define do
  factory :travel do
    enrollment { nil }
    direction { "MyString" }
    transport_needed { "MyString" }
    date { "2019-09-24 16:54:31" }
    mode { "MyString" }
    carrier { "MyString" }
    route_num { "MyString" }
    note { "MyText" }
  end
end
