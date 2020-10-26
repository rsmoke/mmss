# == Schema Information
#
# Table name: applicant_details
#
#  id                 :bigint           not null, primary key
#  user_id            :bigint           not null
#  firstname          :string           not null
#  middlename         :string
#  lastname           :string           not null
#  gender             :string
#  us_citizen         :boolean          default(FALSE), not null
#  demographic        :string
#  birthdate          :date             not null
#  diet_restrictions  :string
#  shirt_size         :string           not null
#  address1           :string           not null
#  address2           :string
#  city               :string           not null
#  state              :string           not null
#  state_non_us       :string
#  postalcode         :string           not null
#  country            :string           not null
#  phone              :string           not null
#  parentname         :string           not null
#  parentaddress1     :string
#  parentaddress2     :string
#  parentcity         :string
#  parentstate        :string
#  parentstate_non_us :string
#  parentzip          :string
#  parentcountry      :string
#  parentphone        :string           not null
#  parentworkphone    :string
#  parentemail        :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
FactoryBot.define do
  factory :applicant_detail do
    user
    firstname { "Chester" }
    # middlename { "The" }
    lastname { "Tester" }
    gender { "Male" }
    us_citizen { true }
    demographic { "MyString" }
    birthdate { "2019-07-22" }
    diet_restrictions { "peanuts" }
    shirt_size { "Large" }
    address1 { "123 Main Street" }
    # address2 { "MyString" }
    city { "Saline" }
    # state { "MyString" }
    # state_non_us { "MyString" }
    postalcode { "48896" }
    country { "US" }
    phone { "1234567890" }
    parentname { "Cheryl Stooge" }
    parentaddress1 { "123 Main Street" }
    # parentaddress2 { "MyString" }
    parentcity { "Saline" }
    # parentstate { "MyString" }
    # parentstate_non_us { "MyString" }
    parentzip { "48896" }
    parentcountry { "US" }
    parentphone { "9876543217" }
    # parentworkphone { "MyString" }
    parentemail { "cheryl.tester@tester.com" }
  end
end
