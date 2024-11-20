require "open-uri"
# Clear existing data to avoid duplicates
puts "Clearing existing data..."
Review.destroy_all
Booking.destroy_all
Clinic.destroy_all
Pet.destroy_all
User.destroy_all
puts "Existing data cleared!"

# Create Users
puts "Creating client users..."
client_users = [
  { email: "quentin@example.com", password: "password", role: "client", first_name: "quentin".capitalize, last_name: "Doe" },
  { email: "marko@example.com", password: "password", role: "client", first_name: "marko".capitalize, last_name: "Doe" },
  { email: "joseph@example.com", password: "password", role: "client", first_name: "joseph".capitalize, last_name: "Doe" },
  { email: "liza@example.com", password: "password", role: "client", first_name: "liza".capitalize, last_name: "Doe" },
  { email: "louiza@example.com", password: "password", role: "client", first_name: "louiza".capitalize, last_name: "Doe" },
  { email: "nina@example.com", password: "password", role: "client", first_name: "nina".capitalize, last_name: "Doe" },
  { email: "alice@example.com", password: "password", role: "client", first_name: "alice".capitalize, last_name: "Doe" },
  { email: "bob@example.com", password: "password", role: "client", first_name: "bob".capitalize, last_name: "Doe" },
  { email: "charlie@example.com", password: "password", role: "client", first_name: "charlie".capitalize, last_name: "Doe" },
  { email: "diana@example.com", password: "password", role: "client", first_name: "diana".capitalize, last_name: "Doe" }
]
# Create vet users
puts "Creating vet users..."
(1..20).each do |i|
  users << User.create!(email: "vet#{i}@example.com", password: "password", role: "vet", first_name: "Dr.Vet#{i}", last_name: "Smith")
end

puts "Users created: #{users.map(&:email)}"

puts "Users created: #{users.map(&:email)}"


# Create Pets
puts "Creating pets..."
pets = Pet.create([
  { name: "Buddy", age: 3, species: "dog", breed: "Golden Retriever", weight: 30.5, description: "Friendly and energetic, loves playing fetch.", user: users[0] },
  { name: "Whiskers", age: 2, species: "cat", breed: "Siamese", weight: 5.2, description: "Independent yet affectionate, loves sunbathing.", user: users[0] },
  { name: "Rex", age: 4, species: "dog", breed: "German Shepherd", weight: 40.3, description: "Loyal and protective, great with kids.", user: users[0] },
  { name: "Loco", age: 12, species: "exotic", breed: "Amazon Iguana", weight: 15.7, description: "Aggressive, great defensor.", user: users[0] },
  # { name: "Fluffy", age: 1, species: "rabbit", breed: "Angora", weight: 2.5, description: "Soft and cuddly, loves carrots and hopping around.", user: users.sample },
  # { name: "Max", age: 5, species: "dog", breed: "Bulldog", weight: 24.0, description: "Calm and friendly, enjoys short walks.", user: users.sample },
  # { name: "Bella", age: 2, species: "cat", breed: "Persian", weight: 4.0, description: "Loves being pampered, has a fluffy coat.", user: users.sample },
  # { name: "Charlie", age: 3, species: "bird", breed: "Parrot", weight: 0.9, description: "Talkative and smart, knows several words.", user: users.sample },
  # { name: "Daisy", age: 4, species: "dog", breed: "Beagle", weight: 10.0, description: "Playful and curious, loves exploring.", user: users.sample },
  # { name: "Oscar", age: 1, species: "cat", breed: "Maine Coon", weight: 6.5, description: "Gentle giant, very sociable.", user: users.sample },
  # { name: "Shadow", age: 6, species: "dog", breed: "Labrador Retriever", weight: 28.0, description: "Loyal and energetic, loves swimming.", user: users.sample },
  # { name: "Mittens", age: 3, species: "cat", breed: "Tabby", weight: 4.8, description: "Playful and curious, enjoys chasing laser pointers.", user: users.sample },
  # { name: "Zazu", age: 2, species: "bird", breed: "Cockatiel", weight: 0.5, description: "Very talkative and loves whistling tunes.", user: users.sample },
  # { name: "Thumper", age: 1, species: "rabbit", breed: "Netherland Dwarf", weight: 1.8, description: "Small and cuddly, loves hopping around.", user: users.sample },
  # { name: "Spike", age: 5, species: "exotic", breed: "Bearded Dragon", weight: 0.9, description: "Calm and hardy, loves basking under heat lamps.", user: users.sample },
  # { name: "Coco", age: 8, species: "dog", breed: "Poodle", weight: 22.0, description: "Smart and active, loves performing tricks.", user: users.sample },
  # { name: "Ginger", age: 2, species: "cat", breed: "Bengal", weight: 5.5, description: "Energetic and loves climbing trees.", user: users.sample },
  # { name: "Sunny", age: 1, species: "bird", breed: "Canary", weight: 0.2, description: "Chirpy and cheerful, sings beautifully.", user: users.sample },
  # { name: "Blue", age: 3, species: "fish", breed: "Betta", weight: 0.1, description: "Solitary and colorful, loves clean water.", user: users.sample },
  # { name: "Luna", age: 4, species: "dog", breed: "Husky", weight: 25.0, description: "Energetic and loves the snow.", user: users.sample },
  # { name: "Shelly", age: 12, species: "exotic", breed: "Red-Eared Slider Turtle", weight: 1.5, description: "Calm and loves swimming in the pond.", user: users.sample },
  # { name: "Leo", age: 8, species: "exotic", breed: "Box Turtle", weight: 1.8, description: "Shy and prefers staying on land, loves leafy greens.", user: users.sample },
  # { name: "Karma", age: 4, species: "exotic", breed: "Panther Chameleon", weight: 0.2, description: "Color-changing and loves climbing trees.", user: users.sample },
  # { name: "Webster", age: 2, species: "exotic", breed: "Tarantula", weight: 0.15, description: "Quiet and fascinating, spins intricate webs.", user: users.sample },
  # { name: "Slither", age: 6, species: "exotic", breed: "Ball Python", weight: 3.5, description: "Gentle and enjoys coiling around branches.", user: users.sample }
])

# URL Mapping of Images for Pets
pet_images = {
  "Buddy" => "https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg",
  "Whiskers" => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732040977/karsten-winegeart-uy5l-VJ8dRM-unsplash_jf3yj3_ubzi7a.jpg",
  "Rex" =>  "https://res.cloudinary.com/dpeys37ef/image/upload/v1732041122/pexels-sam-lion-5732454_djy9ve_dshmkg.jpg",
  "Loco" => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732040324/jill-dimond-LdlNdclgVrI-unsplash_zz8lvo_f1l87k.jpg"
}

# Attach Photos to Pets
Pet.all.each do |pet|
  image_url = pet_images[pet.name]
  if image_url
    file = URI.open(image_url)
    pet.photo.attach(io: file, filename: "#{pet.name.downcase}.jpg", content_type: "image/jpeg")
    puts "Attached photo for #{pet.name}"
  else
    puts "No image URL found for #{pet.name}"
  end
end
puts "Pets created: #{pets.map(&:name)}"

# Create Clinics
puts "Creating clinics..."
clinics = [
  { email: "cityvet@example.com", phone_numer: "123-456-7890", webpage: "https://www.cityvet.com", address: "123 Main St, Cityville", description: "A full-service veterinary clinic for cats and dogs.", species: "dog", rate: 4.5, care_type: "general", longitude: -74.0059728, latitude: 40.7127753, user: users[11] },
  { email: "exoticcare@example.com", phone_numer: "987-654-3210", webpage: "https://www.exoticcareclinic.com", address: "456 Side Ave, Petown", description: "Specializes in exotic pets including birds, reptiles, and small mammals.", species: "exotic", rate: 4.8, care_type: "specialty", longitude: -73.935242, latitude: 40.73061, user: users[12] },
  { email: "petexpress@example.com", phone_numer: "555-123-4567", webpage: "https://www.petexpress.com", address: "789 Uptown Blvd, Animaltown", description: "Emergency and urgent care for all domestic pets.", species: "cat", rate: 4.3, care_type: "emergency", longitude: -74.006, latitude: 40.714, user: users[13] },
  { email: "oceanviewvet@example.com", phone_numer: "444-555-6666", webpage: "https://www.oceanviewvet.com", address: "3030 Seaside Ave, Coastal City", description: "Specializing in marine and coastal pets.", species: "exotic", rate: 4.6, care_type: "specialty", longitude: -73.9857, latitude: 40.7488, user: users[14] },
  { email: "centralparkpets@example.com", phone_numer: "555-666-7777", webpage: "https://www.centralparkpets.com", address: "505 Park St, Midtown", description: "Caring for all urban pets with expert attention.", species: "dog", rate: 4.5, care_type: "general", longitude: -73.9708, latitude: 40.7648, user: users[15] },
  { email: "harmonyanimalclinic@example.com", phone_numer: "666-777-8888", webpage: "https://www.harmonyanimalclinic.com", address: "678 Harmony Rd, Petown", description: "Holistic veterinary care for all pets.", species: "dog", rate: 4.9, care_type: "general", longitude: -73.9878, latitude: 40.7329, user: users[16] },
  { email: "sunnydaypets@example.com", phone_numer: "777-888-9999", webpage: "https://www.sunnydaypets.com", address: "101 Sunshine Blvd, Sunnytown", description: "Known for its friendly staff and modern facilities.", species: "dog", rate: 4.7, care_type: "general", longitude: -73.9577, latitude: 40.7520, user: users[17] },
  { email: "littlepawsvet@example.com", phone_numer: "888-999-1111", webpage: "https://www.littlepawsvet.com", address: "505 Tiny Paws St, Littletown", description: "Specializing in small mammals like rabbits, hamsters, and guinea pigs.", species: "rabbit", rate: 4.8, care_type: "specialty", longitude: -74.0028, latitude: 40.7335, user: users[18] },
  { email: "happyhoovesclinic@example.com", phone_numer: "999-111-2222", webpage: "https://www.happyhoovesvet.com", address: "303 Green Pastures Rd, Farmville", description: "Offers services for farm animals and large pets.", species: "cat", rate: 4.6, care_type: "specialty", longitude: -74.0150, latitude: 40.7211, user: users[19] },
  { email: "birdsongvet@example.com", phone_numer: "111-222-3333", webpage: "https://www.birdsongvet.com", address: "909 Aviary Ln, Birdland", description: "Dedicated to avian care with a focus on exotic birds.", species: "exotic", rate: 4.9, care_type: "specialty", longitude: -73.9850, latitude: 40.7205, user: users[20] },
  { email: "aquacareclinic@example.com", phone_numer: "333-444-5555", webpage: "https://www.aquacareclinic.com", address: "707 Coral Reef Dr, Seaside", description: "Expert care for aquatic animals like fish and turtles.", species: "dog", rate: 4.7, care_type: "specialty", longitude: -73.9942, latitude: 40.7188, user: users[21] },
  { email: "drsmithclinic@example.com", phone_numer: "999-888-7777", webpage: "https://www.drsmithclinic.com", address: "101 Elm St, Springfield", description: "Personalized care for all domestic pets by Dr. Smith.", species: "dog", rate: 4.9, care_type: "general", longitude: -73.9850, latitude: 40.7300, user: users[22] },
  { email: "drkimsanimalcare@example.com", phone_numer: "888-777-6666", webpage: "https://www.drkimcare.com", address: "505 Maple Ave, Riverdale", description: "Expert care for exotic pets provided by Dr. Kim.", species: "exotic", rate: 4.8, care_type: "specialty", longitude: -74.0100, latitude: 40.7210, user: users[23] },
  { email: "drjohnsonvethaven@example.com", phone_numer: "777-666-5555", webpage: "https://www.drjohnsonhaven.com", address: "303 Birch Rd, Greenville", description: "Dr. Johnson's clinic for birds and small mammals.", species: "cat", rate: 4.7, care_type: "specialty", longitude: -73.9800, latitude: 40.7280, user: users[24] },
  { email: "drbrownfarmcare@example.com", phone_numer: "666-555-4444", webpage: "https://www.drbrownfarmcare.com", address: "789 Countryside Lane, Farmville", description: "Farm animal care and large pet services by Dr. Brown.", species: "cat", rate: 4.6, care_type: "specialty", longitude: -74.0200, latitude: 40.7290, user: users[25] },
  { email: "drleewildcare@example.com", phone_numer: "555-444-3333", webpage: "https://www.drleewildcare.com", address: "202 Forest St, Woodland", description: "Specialty care for wild and exotic animals by Dr. Lee.", species: "exotic", rate: 4.9, care_type: "specialty", longitude: -73.9500, latitude: 40.7310, user: users[26] },
  { email: "drandersonpetclinic@example.com", phone_numer: "444-333-2222", webpage: "https://www.drandersonclinic.com", address: "101 Park Ave, Midtown", description: "Dr. Anderson’s full-service clinic for urban pets.", species: "dog", rate: 4.7, care_type: "general", longitude: -73.9700, latitude: 40.7500, user: users[27] },
  { email: "drgarciaaquatics@example.com", phone_numer: "333-222-1111", webpage: "https://www.drgarciaaquatics.com", address: "505 Coral Rd, Seaside", description: "Aquatic animal care and rehabilitation by Dr. Garcia.", species: "cat", rate: 4.8, care_type: "specialty", longitude: -73.9900, latitude: 40.7220, user: users[28] },
  { email: "drdolittle@example.com", phone_numer: "111-333-5555", webpage: "https://www.drdolittleshaven.com", address: "123 Animal St, Wildtown", description: "Dr. Dolittle's clinic provides care for all animals, from domestic pets to exotic wildlife.", species: "exotic", rate: 5.0, care_type: "specialty", longitude: -73.9800, latitude: 40.7200, user: users[29] },
  { email: "dradamswildlifeclinic@example.com", phone_numer: "999-222-5555", webpage: "https://www.dradamswildlifeclinic.com", address: "305 Safari Lane, Wildwood", description: "Specializes in rehabilitation and care for wild animals, including injured wildlife.", species: "cat", rate: 4.9, care_type: "rehabilitation", longitude: -73.9750, latitude: 40.7350, user: users[30] },
  { email: "drmorganpetparadise@example.com", phone_numer: "222-333-4444", webpage: "https://www.drmorganpetparadise.com", address: "505 Paradise St, Petown", description: "Offers luxury veterinary services for urban pets.", species: "dog", rate: 4.8, care_type: "specialty", longitude: -74.0010, latitude: 40.7285, user: users[31] },
  { email: "drgreenherbalsclinic@example.com", phone_numer: "333-444-5555", webpage: "https://www.drgreenherbalsclinic.com", address: "707 Herbal Rd, Greenfield", description: "Provides holistic and herbal treatments for pets.", species: "dog", rate: 4.7, care_type: "holistic", longitude: -73.9655, latitude: 40.7400, user: users[34] }
].map do |clinic_attrs|
  clinic = Clinic.new(clinic_attrs)
  if clinic.save
    puts "Created clinic: #{clinic.address}"
  else
    puts "Failed to create clinic: #{clinic_attrs[:address]}"
    puts "Errors: #{clinic.errors.full_messages}"
  end
  clinic
end
puts "Clinics created: #{clinics.map { |c| [c.id, c.address, c.user_id] }}"

clinic_images = {
"cityvet@example.com" => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732040869/pexels-mikhail-nilov-7465698_jyqmyl_osqpq5.jpg",
"exoticcare@example.com" => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732040879/pexels-sparkphotopro-10559203_v8pzlt_c9dbz0.jpg",
"petexpress@gmail.com" => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732040882/suzi-kim-8bRdsXqzc6k-unsplash_ssv62a_aptnmr.jpg",
"oceanviewvet@example.com" => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732040635/pexels-tima-miroshnichenko-6235666_npetby_ezs4cf.jpg",
"centralparkpets@example.com" => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732040881/cdc-bBm_QwIAsyc-unsplash_xaz459_gsmy59.jpg",
"harmonyanimalclinic@example.com" => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732040801/karlo-tottoc-ybZ5hRxaWS4-unsplash_qj0vfe_ha4ikh.jpg",
"sunnydaypets@example.com" => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732040795/pexels-marinaphotos-17084273_z7ciel_xdluoi.jpg",
"littlepawsvet@example.com" => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732040797/jeremy-alford-O13B7suRG4A-unsplash_ddux4e_pk5hd8.jpg",
"happyhoovesclinic@example.com" => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732040540/sincerely-media-Umg6HxxLQ3Q-unsplash_t7tlxn_ckbtzo.jpg",
"birdsongvet@example.com" => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732040644/pexels-karolina-grabowska-4386467_mmbozc_hqpx9h.jpg",
"aquacareclinic@example.com" => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732040791/pexels-tessy-agbonome-521343232-19963193_ndbrqq_vd31z7.jpg",
"drsmithclinic@example.com" => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732040542/freestocks-qqjWNVn8CvU-unsplash_ud5quo_vm2ro5.jpg",
"drkimsanimalcare@example.com" => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732040784/centre-for-ageing-better-LDbxOjVNxec-unsplash_mw8s8u_irtod0.jpg",
"drjohnsonvetheaven@example.com" => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732040630/travis-grossen-bOlOsY-pLgk-unsplash_gqxhhb_tsipj7.jpg",
"drbrownfarmcare@example.com" => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732040788/jonatan-bustos-P1Ku27zZJDs-unsplash_agpi3o_toodth.jpg",
"drleewildcare@example.com" => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732040781/cdc-uoYFqyvm6Bo-unsplash_iek4or_zusvcv.jpg",
"drandersonpetclinic@example.com" => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732040786/judy-beth-morris-k6-WI3A0i1s-unsplash_be4vrw_oo90h5.jpg",
"drgarciaaquatics@example.com" => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732040777/pexels-ifaw-5486965_yz13ea_fg3sza.jpg",
"drdolittle@example.com" => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732040637/joenomias-m-de-jong-zhYy10qCzdw-unsplash_hkrrlf_rpjdvi.jpg",
"dradamswildlifeclimic@example.com" => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732040640/pexels-tima-miroshnichenko-6235233_nqgyho_pbvwlk.jpg",
"drmorganpetparadise@example.com" => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732040775/pexels-gustavo-fring-4173251_vhu03z_glrgdz.jpg",
"drgreenherbalsclinic@example.com" => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732040628/pexels-ifaw-5487067_qymkdi_qggnwj.jpg",
}


# Attach Photos to Clinics
Clinic.all.each do |clinic|
  image_url = clinic_images[clinic.email]
  if image_url
    file = URI.open(image_url)
    clinic.photo.attach(io: file, filename: "#{clinic.email.downcase}.jpg", content_type: "image/jpeg")
    puts "Attached photo for #{clinic.email}"
  else
    puts "No image URL found for #{clinic.email}"
  end
end
puts "Clinics created: #{clinics.map(&:email)}"


# Explicitly fetch clinics
puts "Fetching clinics explicitly..."
clinic_1 = Clinic.find_by(email: "cityvet@example.com")
clinic_2 = Clinic.find_by(email: "exoticcare@example.com")
clinic_3 = Clinic.find_by(email: "petexpress@example.com")
clinic_4 = Clinic.find_by(email: "smallpetcare@example.com")
clinic_5 = Clinic.find_by(email: "birdhaven@example.com")

raise "Clinic not found" unless clinic_1 && clinic_2 && clinic_3 && clinic_4 && clinic_5
puts "Clinics fetched: #{[clinic_1, clinic_2, clinic_3, clinic_4, clinic_5].map { |c| [c.id, c.address] }}"

# Create Bookings
puts "Creating bookings..."
bookings = Booking.create([
  { clinic: clinic_1, pet: pets[0], date: Date.today, time: "10:00", description: "General check-up for Buddy." },
  { clinic: clinic_2, pet: pets[1], date: Date.today, time: "14:00", description: "Routine vaccination for Whiskers." },
  { clinic: clinic_3, pet: pets[2], date: Date.today, time: "16:00", description: "Urgent care for Rex." },
  { clinic: clinic_4, pet: pets[4], date: Date.today + 1, time: "11:00", description: "Dental check-up for Fluffy." },
  { clinic: clinic_5, pet: pets[7], date: Date.today + 2, time: "15:00", description: "Wing trimming for Charlie." },
  { clinic: clinic_1, pet: pets[9], date: Date.today + 3, time: "09:30", description: "Vaccination for Oscar." },
  { clinic: clinic_2, pet: pets[3], date: Date.today + 4, time: "13:00", description: "Special care for Loco." },
  { clinic: clinic_3, pet: pets[6], date: Date.today + 5, time: "12:00", description: "Check-up for Bella." },
  { clinic: clinic_4, pet: pets[5], date: Date.today + 6, time: "14:30", description: "Routine check-up for Max." },
  { clinic: clinic_5, pet: pets[8], date: Date.today + 7, time: "10:15", description: "Behavioral consultation for Daisy." }
])
puts "Bookings created: #{bookings.map { |b| [b.clinic.address, b.pet.name] }}"

puts "Creating additional bookings for first vets..."

puts "Creating diverse bookings for first vets with Deworming and Lysis treatments..."

# Get the first 5 vet users and their clinics
vet_users_with_clinics = vet_users[0..4].map do |vet|
  vet_clinic = Clinic.find_by(user: vet)
  { vet: vet, clinic: vet_clinic }
end

# Distribute bookings with diverse services
vet_users_with_clinics.each_with_index do |vet_info, index|
  clinic = vet_info[:clinic]
  pets_sample = pets.sample(17) # Randomly select 17 pets for bookings

  # Create 5 Routine Check-ups
  routine_checkups = pets_sample[0..4].map.with_index(1) do |pet, booking_index|
    Booking.create!(
      clinic: clinic,
      pet: pet,
      date: Date.today + index * 2 + booking_index,
      time: "#{9 + booking_index}:00",
      description: "Routine check-up for #{pet.name}, booking ##{booking_index} for vet #{vet_info[:vet].email}."
    )
  end

  # Create 3 Emergency Visits
  emergencies = pets_sample[5..7].map.with_index(1) do |pet, booking_index|
    Booking.create!(
      clinic: clinic,
      pet: pet,
      date: Date.today + index * 2 + booking_index + 5,
      time: "#{13 + booking_index}:30",
      description: "Emergency visit for #{pet.name}, urgent care required for #{pet.species}."
    )
  end

  # Create 3 Neuterization Appointments
  neuterizations = pets_sample[8..10].map.with_index(1) do |pet, booking_index|
    Booking.create!(
      clinic: clinic,
      pet: pet,
      date: Date.today + index * 2 + booking_index + 10,
      time: "#{11 + booking_index}:00",
      description: "Neuterization surgery for #{pet.name}."
    )
  end

  # Create 2 Vaccinations
  vaccinations = pets_sample[11..12].map.with_index(1) do |pet, booking_index|
    Booking.create!(
      clinic: clinic,
      pet: pet,
      date: Date.today + index * 2 + booking_index + 15,
      time: "#{10 + booking_index}:15",
      description: "Vaccination for #{pet.name}, up-to-date immunizations."
    )
  end

  # Create 2 Dental Cleanings
  dental_cleanings = pets_sample[13..14].map.with_index(1) do |pet, booking_index|
    Booking.create!(
      clinic: clinic,
      pet: pet,
      date: Date.today + index * 2 + booking_index + 20,
      time: "#{14 + booking_index}:45",
      description: "Dental cleaning for #{pet.name}, promoting oral health."
    )
  end

  # Create 1 Deworming Appointment
  deworming = Booking.create!(
    clinic: clinic,
    pet: pets_sample[15],
    date: Date.today + index * 2 + 25,
    time: "10:30",
    description: "Deworming treatment for #{pets_sample[15].name}."
  )

  # Create Flea Treatment
  lysis = Booking.create!(
    clinic: clinic,
    pet: pets_sample[16],
    date: Date.today + index * 2 + 30,
    time: "11:45",
    description: "Flea treatment for #{pets_sample[16].name}"
  )

  puts <<~INFO
    Created #{routine_checkups.count} Routine Check-ups,
    #{emergencies.count} Emergency Visits,
    #{neuterizations.count} Neuterization Appointments,
    #{vaccinations.count} Vaccinations,
    #{dental_cleanings.count} Dental Cleanings,
    1 Deworming Treatment,
    and 1 Flea Treatment
    for clinic #{clinic.address} (Vet: #{vet_info[:vet].email}).
  INFO
end

puts "Diverse bookings with Deworming and Lysis treatments created successfully!"


# Create Reviews
puts "Creating reviews..."
reviews = Review.create([
  { booking: bookings[0], user: pets[0].user, content: "Excellent care!", rating: 5 },
  { booking: bookings[1], user: pets[1].user, content: "Great experience.", rating: 4 },
  { booking: bookings[2], user: pets[2].user, content: "Not bad, but could improve.", rating: 3 },
  { booking: bookings[3], user: pets[4].user, content: "Fluffy was treated wonderfully!", rating: 5 },
  { booking: bookings[4], user: pets[7].user, content: "Charlie is happy with his new feathers.", rating: 5 },
  { booking: bookings[5], user: pets[9].user, content: "Oscar loved the staff.", rating: 5 },
  { booking: bookings[6], user: pets[3].user, content: "Loco received excellent exotic care.", rating: 5 },
  { booking: bookings[7], user: pets[6].user, content: "Bella's health is in good hands!", rating: 4 },
  { booking: bookings[8], user: pets[5].user, content: "Max was calm and happy.", rating: 5 },
  { booking: bookings[9], user: pets[8].user, content: "Daisy's behavior has improved.", rating: 4 }
])
puts "Reviews created: #{reviews.map { |r| [r.booking.description, r.user.email, r.rating] }}"

puts "Seeding complete!"
