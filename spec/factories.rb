FactoryBot.define do
  factory :role do
    trait :admin do
      name {"admin"}
    end

    trait :normal do
      name {"normal"}
    end
  end
  
  factory :user do
    name  {"Joe"}
    email {"joe@gmail.com"}
    password  {"Blah@123"}
    trait :female do
      gender {"female"}
    end
    trait :male do
      gender {"male"}
    end
   end

  factory :event_category do
    name  {"Event1"}
    description {"description"}
  end

  factory :event do
    name  {"Event1"}
    location {"Location1"}
    event_date  {"10-02-2020"}
    fees   {900.00}
    association :event_category, factory: :event_category
  end

end