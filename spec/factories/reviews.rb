FactoryBot.define do
  factory :review do
    author('Keegan')
    content('It Sucked')
    rating(1)
    destination_id(1)
  end
end
