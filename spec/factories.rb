FactoryBot.define do
  factory :patient do
    first_name {"#{Faker::Name.first_name}"}
    last_name {"#{Faker::Name.last_name}"}
    dob { Date.today - 33.years}
    gender {0}
  end

  factory :facility do
    name {"#{Faker::Company.name}"}
  end

  factory :admission do
    moment {Date.today - 3.days}

  end
end