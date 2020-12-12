#Create admin
User.create!(
  name: "Admin",
  email: "admin@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  birthday: "",
  avatar: "https://cdn.luxstay.com/users/256105/avatar_13fe15c4-d36f-44d7-a471-93186a0a71e1.",
  address: Faker::Address.country,
  phone: "098111222",
  activated: true,
  admin: true
)

#Create user
100.times do |n|
  name = "user#{n+1}"
  email = "user#{n+1}@gmail.com"
  password = "123456"
  birthday = ""
  avatar = "https://cdn.luxstay.com/users/220919/avatar_1_1576866089.jpg"
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
users = User.order(:created_at).take(100)
place_types = [1, 2, 3, 4, 5, 6]
facilities = Facility.all.ids.sample(5)
currencies = [1, 2, 3]
cancel_policies = [1, 2, 3]
rating_score = [1, 2, 3, 4, 5]
positive_number = Faker::Number.between(from: 1, to: 10)

images = ["https://cdn.luxstay.com/rooms/21289/large/room_21289_50_1557240288.jpg",
          "https://cdn.luxstay.com/rooms/35959/large/971CE3AB-879A-4F79-BF12-7190D2D30FEF.jpg",
          "https://cdn.luxstay.com/rooms/29288/large/room_29288_213_1565167160.jpg",
          "https://cdn.luxstay.com/rooms/13328/large/1530343271__DSC0214.JPG",
          "https://cdn.luxstay.com/rooms/33385/large/LIM%20GREEN%20(16).jpg",
          "https://cdn.luxstay.com/users/91740/ub9gJsP701PjeTWoejjBU-Ta.jpg",
          "https://cdn.luxstay.com/rooms/32850/large/_DSC4898-Edit.jpg",
          "https://cdn.luxstay.com/rooms/27478/large/room_27478_22_1563615347.jpg",
          "https://cdn.luxstay.com/users/32999/c1gK94DTkZ4l3NpJR2TwskZR.jpg",
          "https://cdn.luxstay.com/rooms/15173/large/room_15173_3_1551106011.jpg",
          "https://cdn.luxstay.com/users/230391/WMPuXP_zH_qJ8vfz8nrpQSW7.jpg",
          "https://cdn.luxstay.com/rooms/14807/large/1536221578__DSC0953.JPG",
          "https://cdn.luxstay.com/rooms/32866/large/Untitled_HDR2%2050.jpg",
          "https://cdn.luxstay.com/rooms/23858/large/room_23858_36_1555845106.jpg",
          "https://cdn.luxstay.com/rooms/39106/large/IMG_8483.jpeg",
          "https://cdn.luxstay.com/rooms/35630/large/302-1.jpg",
          "https://cdn.luxstay.com/users/15048/64x6xw032P0eXTeKGu10lpLt.jpg",
          "https://cdn.luxstay.com/rooms/19588/large/room_19588_7_1547620232.jpg",
          "https://cdn.luxstay.com/rooms/17822/large/room_17822_71_1544089622.jpg",
          "https://cdn.luxstay.com/rooms/23569/large/339a03a1810e7950201f.jpg",
          "https://cdn.luxstay.com/rooms/34370/large/room_34370_4_1570514075.jpg",
          "https://cdn.luxstay.com/rooms/36749/large/20191118_153041.jpg",
          "https://cdn.luxstay.com/rooms/66838/large/room_66838_15_1579111664.jpg",
          "https://cdn.luxstay.com/rooms/33463/large/room_33463_2_1571081586.jpg",
          "https://cdn.luxstay.com/rooms/25769/large/room_25769_14_1560317299.jpg",
          "https://cdn.luxstay.com/rooms/34404/large/room_34404_12_1570563625.jpg",
          "https://cdn.luxstay.com/users/56061/p5PJhBwOUvcjNlIPOC4GrkO-.jpg",
          "https://cdn.luxstay.com/rooms/17679/large/room_17679_23_1543814614.jpg",
          "https://cdn.luxstay.com/users/1793/6LhX5Dl-DEyBjm0XmhfO1d6m.jpg",
          "https://cdn.luxstay.com/rooms/16657/large/1542352179_screenshot_4png",
          "https://cdn.luxstay.com/users/1793/RCk9-Yd_xnYMeP5Lny6jdIQh.jpg",
          "https://cdn.luxstay.com/rooms/27912/large/room_27912_1_1563699349.jpg",
          "https://cdn.luxstay.com/rooms/12948/large/1528656044_IMG_5481-min.jpg",
          "https://cdn.luxstay.com/rooms/24690/large/room_24690_126_1558686304.jpg",
          "https://cdn.luxstay.com/rooms/13737/large/room_13737_31_1566960034.jpg",
          "https://cdn.luxstay.com/rooms/41639/large/074E9F47-5D8C-45C5-928A-0639479EA5CF.jpg",
          "https://cdn.luxstay.com/rooms/41616/large/4194194B-1D0A-4E00-A558-80013518EEE6.jpg",
          "https://cdn.luxstay.com/rooms/25495/large/room_25495_52_1558713239.jpg",
          "https://cdn.luxstay.com/rooms/36906/large/room_36906_1_1573752192.jpg",
          "https://cdn.luxstay.com/rooms/30529/large/room_30529_3_1566474077.jpg"
          ]

8.times do |n|
  city = n + 1
  place_type = place_types.sample
  overviews_attributes = [{image: images.sample}, {image: images.sample},
               {image: images.sample}, {image: images.sample},
               {image: images.sample}, {image: images.sample},
               {image: images.sample}, {image: images.sample}]
  policy_attributes = {currency: currencies.sample, cancel_policy: cancel_policies.sample, max_num_of_people: positive_number}
  rule_attributes = {special_rules: Faker::Lorem.sentence(word_count: 50), smoking: 1, pet: 1, cooking: 2, party: 3}
  room_attributes = {square: Faker::Number.number(digits: 3),
                    num_of_bedroom: positive_number,
                    num_of_bed: positive_number,
                    num_of_bathroom: positive_number,
                    num_of_kitchen: positive_number}
  schedule_price_attributes = {normal_day_price: Faker::Number.number(digits: 6),
                              weekend_price: Faker::Number.number(digits: 7),
                              cleaning_price: Faker::Number.number(digits: 6)}
  ratings_attributes = {score: rating_score.sample, comment: Faker::Lorem.sentence(word_count: 11)}
  place_facilities_attributes = facilities.map {|f| {facility_id: f}}

  users.each {|user| user.places.create!(
    name: Faker::Name.name,
    details: Faker::Lorem.sentence(word_count: 10),
    city: city,
    image: images.sample,
    place_type: place_type,
    address: Faker::Address.street_address,
    accepted: false,
    overviews_attributes: overviews_attributes,
    policy_attributes: policy_attributes,
    rule_attributes: rule_attributes,
    room_attributes: room_attributes,
    schedule_price_attributes: schedule_price_attributes,
    place_facilities_attributes: place_facilities_attributes
  )}
end

places = Place.all

places.each do |place|
  ratings_params = {place_id: place.id, score: rating_score.sample, comment: Faker::Lorem.sentence(word_count: 11)}
  users.take(2).each do |user|
    if user.id != place.user_id
      rating = user.ratings.build ratings_params

      rating.save if rating.valid?
    end
  end
end
