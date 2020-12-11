#Create admin
User.create!(
  name: "Admin",
  email: "admin@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  birthday: "",
  avatar: "avatar.png",
  address: Faker::Address.country,
  phone: "098111222",
  activated: true,
  admin: true
)

#Create user
10.times do |n|
  name = "user#{n+1}"
  email = "user#{n+1}@gmail.com"
  password = "123456"
  birthday = ""
  avatar = "avatar.png"
  phone = "098111222"
  gender = "male"
  admin = false
  User.create!(
    name: name,
    email: email,
    password: password,
    password_confirmation: password,
    admin: admin,
    gender: gender,
    phone: phone,
    birthday: birthday,
    address: Faker::Address.country,
    activated: true,
    avatar: avatar
  )
end

#Create facilities

Facility.create!(name: "Wifi")
Facility.create!(name: "TV")
Facility.create!(name: "Air-conditioner")
Facility.create!(name: "Washing machine")
Facility.create!(name: "Microwave")
Facility.create!(name: "Fridge/ Freezer")
Facility.create!(name: "Balcony")
Facility.create!(name: "Sofa")

#Create coupon
5.times do |n|
  Coupon.create!(code_name: Faker::Code.asin,
                  start_date: Time.zone.now,
                  expire_date: Time.zone.now + 5.days,
                  discount: Faker::Number.between(from: 0, to: 100))
end

#Create place
users = User.order(:created_at).take(20)
place_types = [1, 2, 3, 4, 5, 6]
facilities = Facility.all.ids.sample(5)
currencies = [1, 2, 3]
cancel_policies = [1, 2, 3]
rating_score = [1, 2, 3, 4, 5]
positive_number = Faker::Number.between(from: 1, to: 10)

8.times do |n|
  name = Faker::Name.name
  details = Faker::Lorem.sentence(word_count: 10)
  city = n + 1
  place_type = place_types.sample
  address = Faker::Address.street_address
  overviews_attributes = [{image: "image1"}, {image: "image1"},
               {image: "image1"}, {image: "image1"},
               {image: "image1"}, {image: "image1"},
               {image: "image1"}, {image: "image1"}]
  policy_attributes = {currency: currencies.sample, cancel_policy: cancel_policies.sample, max_num_of_people: positive_number}
  rule_attributes = {special_rules: Faker::Lorem.sentence(word_count: 50), smoking: 1, pet: 1, cooking: 2, party: 3}
  room_attributes = {square: Faker::Number.number(digits: 3),
                    num_of_bedroom: positive_number,
                    num_of_bed: positive_number,
                    num_of_bathroom: positive_number,
                    num_of_kitchen: positive_number}
  schedule_price_attributes = {normal_day_price: Faker::Number.number(digits: 2),
                              weekend_price: Faker::Number.number(digits: 2),
                              cleaning_price: Faker::Number.number(digits: 2)}
  ratings_attributes = {score: rating_score.sample, comment: Faker::Lorem.sentence(word_count: 11)}
  place_facilities_attributes = facilities.map {|f| {facility_id: f}}

  users.each {|user| user.places.create!(
    name: name,
    details: details,
    city: city,
    place_type: place_type,
    address: address,
    accepted: false,
    overviews_attributes: overviews_attributes,
    policy_attributes: policy_attributes,
    rule_attributes: rule_attributes,
    room_attributes: room_attributes,
    schedule_price_attributes: schedule_price_attributes,
    place_facilities_attributes: place_facilities_attributes
  )}
end
