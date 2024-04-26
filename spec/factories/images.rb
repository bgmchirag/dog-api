FactoryBot.define do
  factory :image, class: 'Image' do
    url { Faker::Name.first_name }
  end
end