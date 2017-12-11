class Seed

  def self.begin
    seed = Seed.new
    seed.generate_destinations
    seed.generate_reviews
  end

  def generate_destinations
    20.times do
      destination = Destination.create!(
        country: Faker::Address.country,
        city: Faker::Address.city,
        category: Faker::Commerce.material,
        price: Faker::Number.decimal(2),
        accomodations: Faker::Commerce.department(5),
        name: Faker::Address.community
      )
    end
    puts "Created #{Destination.count} Destinations."
  end

  def generate_reviews
    200.times do
      review = Review.create!(
        author: Faker::Kpop.i_groups,
        content: Faker::Hipster.paragraph,
        rating: Faker::Number.rand(1..5),
        destination_id: Faker::Number.between(Destination.first.id, Destination.last.id)
      )
    end
    puts "Created #{Review.count} Reviews."
  end
end

Seed.begin
