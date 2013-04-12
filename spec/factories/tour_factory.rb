FactoryGirl.define do
  factory :tour, class: Tour do
    name          "New York"
    description   "See the many wonders of New York"
    lat           0.0
    lng           0.0
    image         ""
    price        3.00
  end
end