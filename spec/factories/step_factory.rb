FactoryGirl.define do
  factory :step1, class: Step do
    name          "Empire State Building"
    description   "The tallest building in NYC"
    address       "34th Street, New York, NY"
    lat           0.0
    lng           0.0
    position      1
    audiofile     "/audios/audio.mp4"
  end

  factory :step2, class: Step do
    name          "Statue of Liberty"
    description   "Lady Liberty"
    address       "Liberty Island, NY"
    lat           0.0
    lng           0.0
    position      2
    audiofile     "/audios/audio.mp4"
  end

  factory :step3, class: Step do
    name          "Metropolitan Museum of Art"
    description   "a really big museum"
    address       "86th Street, New York, NY"
    lat           0.0
    lng           0.0
    position      3
    audiofile     "/audios/audio.mp4"
  end

end