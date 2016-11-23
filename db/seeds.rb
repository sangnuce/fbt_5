User.create! name: "Admin",
  phone: "0987654321",
  address: "Ha Noi",
  is_admin: true,
  email: "sanga2k50@gmail.com",
  password: "123456",
  password_confirmation: "123456"

User.create! name: "Admin",
  phone: "0987654321",
  address: "Ha Noi",
  is_admin: false,
  email: "sang.a2k50@gmail.com",
  password: "123456",
  password_confirmation: "123456"


User.create! name: "Admin", email: "admin@gmail.com", password: "123456",
  password_confirmation: "123456", is_admin: true, phone: "123456789"

19.times do |n|
  name  = "customer-#{n+1}"
  email = "user-#{n+1}@gmail.com"
  password = "password"
  phone = "123456789"
  User.create! name: name, email: email, password: password,
    password_confirmation: password, phone: phone, is_admin: false
end

3.times do
  Place.create! name: Faker::Name.name
end

3.times do
  category = Category.create! name: Faker::Name.name
  10.times do
    tour = category.tours.create! name: Faker::Hipster.sentence(1),
      price_per_person: 100, description: Faker::Hipster.paragraph(20),
      num_people: 3, duration: 3
    tour.tour_places.create! place_id: Faker::Number.between(1, 3)
    3.times do
      tour.tour_dates.create! start_date: Time.zone.today
    end
  end
end

tour = Tour.first
user = User.first
10.times do
  tour.reviews.create! user: user, review_type: 0,
    title: Faker::Hipster.sentence(3),
    content: Faker::Hipster.paragraph(20)
end
