# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string(255)
#  last_name       :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  lat             :float
#  lng             :float
#  address         :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

FactoryGirl.define do
  factory :user, class: User do
    first_name            "Bob"
    last_name             "Jones"
    email                 "bob@gmail.com"
    password_digest       "a"
    lat                   0.0
    lng                   0.0
    address               "10 E. 21st St, New York, NY"
  end
end
