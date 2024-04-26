FactoryBot.define do
  factory :dog, class: 'Dog' do
    breed { Faker::Name.first_name }
  end
end
