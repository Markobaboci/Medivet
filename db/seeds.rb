require "open-uri"
# Clear and recreate the database before seeding
puts "Resetting the database..."

# Run db:drop, db:create, db:migrate
system("rails db:drop DISABLE_DATABASE_ENVIRONMENT_CHECK=1")
system("rails db:create")
system("rails db:migrate")

puts "Database reset complete. Now seeding data..."


# Clear existing data to avoid duplicates
puts "Clearing existing data..."
Review.destroy_all
Booking.destroy_all
Pet.destroy_all
Clinic.destroy_all
User.destroy_all
puts "Existing data cleared!"

# Initialize `users` as an empty array
users = []

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
users += client_users.map { |attrs| User.create!(attrs) }

# Add vet users
(1..22).each do |i|
  vet_user = { email: "vet#{i}@example.com", password: "password", role: "vet", first_name: "Dr.Vet#{i}", last_name: "Smith" }
  users << User.create!(vet_user)
end

puts "Users created: #{users.count}"

# Create Pets
puts "Creating pets..."
pets = Pet.create(
  [ { name: "Buddy", age: 3, species: "dog", breed: "Golden Retriever", weight: 30.5, description: "Friendly and energetic, loves playing fetch.", user: users[0] },
    { name: "Whiskers", age: 2, species: "cat", breed: "Siamese", weight: 5.2, description: "Independent yet affectionate, loves sunbathing.", user: users[0] },
    { name: "Rex", age: 4, species: "dog", breed: "German Shepherd", weight: 40.3, description: "Loyal and protective, great with kids.", user: users[0] },
    { name: "Loco", age: 12, species: "reptile/amphibian", breed: "Amazon Iguana", weight: 15.7, description: "Aggressive, great defensor.", user: users[0] },
    { name: "Fluffy", age: 1, species: "small mammal", breed: "Angora", weight: 2.5, description: "Soft and cuddly, loves carrots and hopping around.", user: users.sample },
    { name: "Max", age: 5, species: "dog", breed: "Bulldog", weight: 24.0, description: "Calm and friendly, enjoys short walks.", user: users.sample },
    { name: "Bella", age: 2, species: "cat", breed: "Persian", weight: 4.0, description: "Loves being pampered, has a fluffy coat.", user: users.sample },
    { name: "Charlie", age: 3, species: "bird", breed: "Parrot", weight: 0.9, description: "Talkative and smart, knows several words.", user: users.sample },
    { name: "Daisy", age: 4, species: "dog", breed: "Beagle", weight: 10.0, description: "Playful and curious, loves exploring.", user: users.sample },
    { name: "Oscar", age: 1, species: "cat", breed: "Maine Coon", weight: 6.5, description: "Gentle giant, very sociable.", user: users.sample },
    { name: "Shadow", age: 6, species: "dog", breed: "Labrador Retriever", weight: 28.0, description: "Loyal and energetic, loves swimming.", user: users.sample },
    { name: "Mittens", age: 3, species: "cat", breed: "Tabby", weight: 4.8, description: "Playful and curious, enjoys chasing laser pointers.", user: users.sample },
    { name: "Zazu", age: 2, species: "bird", breed: "Cockatiel", weight: 0.5, description: "Very talkative and loves whistling tunes.", user: users.sample },
    { name: "Thumper", age: 1, species: "small mammal", breed: "Netherland Dwarf", weight: 1.8, description: "Small and cuddly, loves hopping around.", user: users.sample },
    { name: "Spike", age: 5, species: "reptile/amphibian", breed: "Bearded Dragon", weight: 0.9, description: "Calm and hardy, loves basking under heat lamps.", user: users.sample },
    { name: "Coco", age: 8, species: "dog", breed: "Poodle", weight: 22.0, description: "Smart and active, loves performing tricks.", user: users.sample },
    { name: "Ginger", age: 2, species: "cat", breed: "Bengal", weight: 5.5, description: "Energetic and loves climbing trees.", user: users.sample },
    { name: "Sunny", age: 1, species: "bird", breed: "Canary", weight: 0.2, description: "Chirpy and cheerful, sings beautifully.", user: users.sample },
    { name: "Blue", age: 3, species: "fish", breed: "Betta", weight: 0.1, description: "Solitary and colorful, loves clean water.", user: users.sample },
    { name: "Luna", age: 4, species: "dog", breed: "Husky", weight: 25.0, description: "Energetic and loves the snow.", user: users.sample },
    { name: "Shelly", age: 12, species: "reptile/amphibian", breed: "Red-Eared Slider Turtle", weight: 1.5, description: "Calm and loves swimming in the pond.", user: users.sample },
    { name: "Leo", age: 8, species: "reptile/amphibian", breed: "Box Turtle", weight: 1.8, description: "Shy and prefers staying on land, loves leafy greens.", user: users.sample },
    { name: "Karma", age: 4, species: "reptile/amphibian", breed: "Panther Chameleon", weight: 0.2, description: "Color-changing and loves climbing trees.", user: users.sample },
    { name: "Webster", age: 2, species: "other/exotic", breed: "Tarantula", weight: 0.15, description: "Quiet and fascinating, spins intricate webs.", user: users.sample },
    { name: "Slither", age: 6, species: "reptile/amphibian", breed: "Ball Python", weight: 3.5, description: "Gentle and enjoys coiling around branches.", user: users.sample },
    { name: "Nibbles", age: 1, species: "small mammal", breed: "Syrian Hamster", weight: 0.1, description: "Small and energetic, loves running on the wheel.", user: users.sample },
    { name: "Ally", age: 4, species: "farm animal", breed: "Suri Alpaca", weight: 70.0, description: "Gentle and friendly, has soft, luxurious fleece.", user: users.sample }
  ])

  puts "Pets created: #{pets.count}"

# URL Mapping of Images for Pets
pet_images = {
  "Buddy"    => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732040310/berkay-gumustekin-Crj3gU0aJsU-unsplash_qbyfvx_ol47lh.jpg",
  "Whiskers" => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732117310/pexels-leah-newhouse-50725-596590_pqlecx.jpg",
  "Rex"      => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732040228/rob-fuller-u9GEK0AuOU8-unsplash_mq1ndn_df6bxj.jpg",
  "Loco"     => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732042969/nikolett-emmert-4ZSJf7qthQA-unsplash_p6k91m_owkqnt.jpg",
  "Fluffy"   => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732040530/karlijn-prot-3fjyk4CLfvA-unsplash_tdctkq_pibgfr.jpg",
  "Max"      => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732040221/julie-marsh-mAQdvE2zyLY-unsplash_nsnuv2_fnlg2e.jpg",
  "Bella"    => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732040344/veronika-homchis-1ejZ2XBjJgU-unsplash_pqflca_hjmxvq.jpg",
  "Charlie"  => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732041182/sultan-yZTbN9-5fx4-unsplash_d2s3wn_fr7fzh.jpg",
  "Daisy"    => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732040321/sam-mcnamara-lBdVjQcfSRQ-unsplash_f2pxir_hheqyz.jpg",
  "Oscar"    => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732040522/mona-magnussen-a7bdqjeG6M4-unsplash_evaxta_ee3snm.jpg",
  "Shadow"   => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732040231/jairo-alzate-sssxyuZape8-unsplash_hq8wbf_avzyu8.jpg",
  "Mittens"  => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732040349/amber-kipp-75715CVEJhI-unsplash_a8w15q_r5hj42.jpg",
  "Zazu"     => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732041182/sultan-yZTbN9-5fx4-unsplash_d2s3wn_fr7fzh.jpg",
  "Thumper"  => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732040540/sincerely-media-Umg6HxxLQ3Q-unsplash_t7tlxn_ckbtzo.jpg",
  "Spike"    => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732041528/gary-ellis-VU3rTuPtkDM-unsplash_vsbmpr_idylnx.jpg",
  "Coco"     => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732040237/jake-oates-E38KRRk1fvg-unsplash_lnnqvw_urjrjt.jpg",
  "Ginger"   => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732040326/jae-park-7GX5aICb5i4-unsplash_moap8b_dvb5yb.jpg",
  "Sunny"    => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732041330/laurent-jollet-9nyWYJuNq18-unsplash_zqfnp4_dhxe8c.jpg",
  "Blue"     => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732041414/brian-wangenheim-VyFdgN2UYeU-unsplash_slsjgb_dd0c3e.jpg",
  "Luna"     => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732040234/claire-brear-Ri6DjpT7uPc-unsplash_kjvkrt_q59qjv.jpg",
  "Shelly"   => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732041833/engin-akyurt-UWJ4bXEJFec-unsplash_xqtalv_ie7x6a.jpg",
  "Leo"      => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732041644/aron-visuals-_rK32L_RjtU-unsplash_x3em4m_byxyon.jpg",
  "Karma"    => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732041829/nikolett-emmert-QqmdyktgBVg-unsplash_iukaau_nb4oyo.jpg",
  "Webster"  => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732118912/ryan-hyde-w_JpsnSvPcQ-unsplash_kvaq32.jpg",
  "Slither"  => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732041835/timothy-dykes-JHNS4Flf9u0-unsplash_ceap6w_s7hb5q.jpg",
  "Ally"     => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732118625/nicholas-mullins-sIMAnsROUns-unsplash_vsc1vq.jpg",
  "Nibbles"  => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732040626/silje-roseneng-cMp84C0fPSg-unsplash_vuaj3i_fop7hy.jpg"
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

puts "Pet photos attached!"

# Create Clinics
puts "Creating clinics..."
    clinics = [
  { email: "cityvet@example.com", clinic_name: "Cityvet", phone_numer: "123-456-7890", webpage: "https://www.cityvet.com", address: "123 Main St, Cityville", description: "A full-service veterinary clinic for all species and care types.", species: ['cat', 'dog', 'bird', 'small mammal', 'reptile/amphibian', 'fish', 'farm animal', 'horse', 'other/exotic'], rate: 4.5, care_type: ['routine check', 'preventive care', 'microchipping', 'vaccination', 'dental', 'nutrition', 'skin and ear infections', 'trauma and injury', 'toxin ingestion', 'x-ray', 'grooming', 'mobility concerns', 'eye issues', 'holistic', 'neutering', 'surgery', 'flea and tick'], longitude: -74.0059728, latitude: 40.7127753, user: users[11] },
  { email: "exoticcare@example.com", clinic_name: "Exoticcare", phone_numer: "987-654-3210", webpage: "https://www.exoticcareclinic.com", address: "456 Side Ave, Petown", description: "Specializes in exotic pets including birds, reptiles, and small mammals.", species: ['bird', 'reptile/amphibian', 'small mammal', 'other/exotic'], rate: 4.8, care_type: ['routine check', 'nutrition', 'skin and ear infections', 'trauma and injury'], longitude: -73.935242, latitude: 40.73061, user: users[12] },
  { email: "petexpress@example.com", clinic_name: "PetExpress", phone_numer: "555-123-4567", webpage: "https://www.petexpress.com", address: "789 Uptown Blvd, Animaltown", description: "Emergency and urgent care for all domestic pets.", species: ['cat', 'dog', 'bird', 'small mammal'], rate: 4.3, care_type: ['emergency', 'trauma and injury', 'toxin ingestion', 'routine check', 'x-ray'], longitude: -74.006, latitude: 40.714, user: users[13] },
  { email: "oceanviewvet@example.com", clinic_name: "Oceanview Vets", phone_numer: "444-555-6666", webpage: "https://www.oceanviewvet.com", address: "3030 Seaside Ave, Coastal City", description: "Specializing in marine and coastal pets.", species: ['fish', 'other/exotic'], rate: 4.6, care_type: ['x-ray', 'mobility concerns', 'nutrition', 'routine check'], longitude: -73.9857, latitude: 40.7488, user: users[14] },
  { email: "centralparkpets@example.com", clinic_name: "Central park pets", phone_numer: "555-666-7777", webpage: "https://www.centralparkpets.com", address: "505 Park St, Midtown", description: "Caring for all urban pets with expert attention.", species: ['cat', 'dog', 'bird', 'small mammal'], rate: 4.5, care_type: ['routine check', 'vaccination', 'microchipping', 'skin and ear infections'], longitude: -73.9708, latitude: 40.7648, user: users[15] },
  { email: "harmonyanimalclinic@example.com", clinic_name: "Harmony Animalclinic", phone_numer: "666-777-8888", webpage: "https://www.harmonyanimalclinic.com", address: "678 Harmony Rd, Petown", description: "Holistic veterinary care for all pets.", species: ['cat', 'dog', 'bird', 'small mammal', 'reptile/amphibian', 'farm animal', 'horse', 'fish', 'other/exotic'], rate: 4.9, care_type: ['holistic', 'skin and ear infections', 'nutrition', 'routine check', 'eye issues'], longitude: -73.9878, latitude: 40.7329, user: users[16] },
  { email: "sunnydaypets@example.com", clinic_name: "SunnydayPets", phone_numer: "777-888-9999", webpage: "https://www.sunnydaypets.com", address: "101 Sunshine Blvd, Sunnytown", description: "Known for its friendly staff and modern facilities.", species: ['cat', 'dog'], rate: 4.7, care_type: ['routine check', 'grooming', 'vaccination', 'dental'], longitude: -73.9577, latitude: 40.7520, user: users[17] },
  { email: "littlepawsvet@example.com", clinic_name: "Little Paws Vet", phone_numer: "888-999-1111", webpage: "https://www.littlepawsvet.com", address: "505 Tiny Paws St, Littletown", description: "Specializing in small mammals like rabbits, hamsters, and guinea pigs.", species: ['small mammal'], rate: 4.8, care_type: ['routine check', 'nutrition', 'microchipping', 'skin and ear infections'], longitude: -74.0028, latitude: 40.7335, user: users[18] },
  { email: "happyhoovesclinic@example.com", clinic_name: "Happy Hooves", phone_numer: "999-111-2222", webpage: "https://www.happyhoovesvet.com", address: "303 Green Pastures Rd, Farmville", description: "Offers services for farm animals and large pets.", species: ['farm animal', 'horse'], rate: 4.6, care_type: ['routine check', 'nutrition', 'mobility concerns', 'trauma and injury'], longitude: -74.0150, latitude: 40.7211, user: users[19] },
  { email: "birdsongvet@example.com", clinic_name: "Birdsong Vet", phone_numer: "111-222-3333", webpage: "https://www.birdsongvet.com", address: "909 Aviary Ln, Birdland", description: "Dedicated to avian care with a focus on exotic birds.", species: ['bird', 'other/exotic'], rate: 4.9, care_type: ['routine check', 'eye issues', 'nutrition', 'trauma and injury'], longitude: -73.9850, latitude: 40.7205, user: users[20] },
  { email: "aquacareclinic@example.com", clinic_name: "AquaCareClinic", phone_numer: "333-444-5555", webpage: "https://www.aquacareclinic.com", address: "707 Coral Reef Dr, Seaside", description: "Expert care for aquatic animals like fish and turtles.", species: ['fish', 'reptile/amphibian'], rate: 4.7, care_type: ['mobility concerns', 'routine check', 'nutrition', 'toxin ingestion'], longitude: -73.9942, latitude: 40.7188, user: users[21] },
  { email: "drsmithclinic@example.com", clinic_name: "Dr.Smith clinic", phone_numer: "999-888-7777", webpage: "https://www.drsmithclinic.com", address: "101 Elm St, Springfield", description: "Personalized care for all domestic pets by Dr. Smith.", species: ['cat', 'dog', 'bird', 'small mammal'], rate: 4.9, care_type: ['routine check', 'dental', 'vaccination', 'microchipping'], longitude: -73.9850, latitude: 40.7300, user: users[22] },
  { email: "drkimsanimalcare@example.com", clinic_name: "Dr.Kims Animalcare", phone_numer: "888-777-6666", webpage: "https://www.drkimcare.com", address: "505 Maple Ave, Riverdale", description: "Expert care for exotic pets provided by Dr. Kim.", species: ['bird', 'reptile/amphibian', 'small mammal', 'other/exotic'], rate: 4.8, care_type: ['routine check', 'nutrition', 'skin and ear infections', 'trauma and injury'], longitude: -74.0100, latitude: 40.7210, user: users[23] },
  { email: "drjohnsonvethaven@example.com", clinic_name: "Dr.Johnson Vet-Haven", phone_numer: "777-666-5555", webpage: "https://www.drjohnsonhaven.com", address: "303 Birch Rd, Greenville", description: "Dr. Johnson's clinic for birds and small mammals.", species: ['bird', 'small mammal'], rate: 4.7, care_type: ['routine check', 'mobility concerns', 'skin and ear infections'], longitude: -73.9800, latitude: 40.7280, user: users[24] },
  { email: "drbrownfarmcare@example.com", phone_numer: "666-555-4444", webpage: "https://www.drbrownfarmcare.com", address: "789 Countryside Lane, Farmville", description: "Farm animal care and large pet services by Dr. Brown.", species: ['farm animal', 'horse'], rate: 4.6, care_type: ['routine check', 'nutrition', 'mobility concerns', 'trauma and injury'], longitude: -74.0200, latitude: 40.7290, user: users[25], clinic_name: "Dr.Brown Farmcare" },
    { email: "drleewildcare@example.com", phone_numer: "555-444-3333", webpage: "https://www.drleewildcare.com", address: "202 Forest St, Woodland", description: "Specialty care for wild and exotic animals by Dr. Lee.", species: ['reptile/amphibian', 'other/exotic'], rate: 4.9, care_type: ['skin and ear infections', 'nutrition', 'trauma and injury', 'mobility concerns'], longitude: -73.9500, latitude: 40.7310, user: users[26], clinic_name: "Dr.Lee Wildcare" },
    { email: "drandersonpetclinic@example.com", phone_numer: "444-333-2222", webpage: "https://www.drandersonclinic.com", address: "101 Park Ave, Midtown", description: "Dr. Anderson’s full-service clinic for urban pets.", species: ['cat', 'dog', 'bird', 'small mammal'], rate: 4.7, care_type: ['routine check', 'dental', 'vaccination', 'microchipping', 'skin and ear infections'], longitude: -73.9700, latitude: 40.7500, user: users[27], clinic_name: "Dr.Anderson Pet Clinic" },
    { email: "drgarciaaquatics@example.com", phone_numer: "333-222-1111", webpage: "https://www.drgarciaaquatics.com", address: "505 Coral Rd, Seaside", description: "Aquatic animal care and rehabilitation by Dr. Garcia.", species: ['fish', 'reptile/amphibian'], rate: 4.8, care_type: ['mobility concerns', 'nutrition', 'routine check', 'toxin ingestion', 'trauma and injury'], longitude: -73.9900, latitude: 40.7220, user: users[28], clinic_name: "Dr.Garcia Aquatics" },
    { email: "drdolittle@example.com", phone_numer: "111-333-5555", webpage: "https://www.drdolittleshaven.com", address: "123 Animal St, Wildtown", description: "Dr. Dolittle's clinic provides care for all animals, from domestic pets to exotic wildlife.", species: ['cat', 'dog', 'bird', 'small mammal', 'reptile/amphibian', 'farm animal', 'horse', 'fish', 'other/exotic'], rate: 5.0, care_type: ['trauma and injury', 'nutrition', 'routine check', 'x-ray', 'skin and ear infections'], longitude: -73.9800, latitude: 40.7200, user: users[29], clinic_name: "Dr.Dolittle" },
    { email: "dradamswildlifeclinic@example.com", phone_numer: "999-222-5555", webpage: "https://www.dradamswildlifeclinic.com", address: "305 Safari Lane, Wildwood", description: "Specializes in rehabilitation and care for wild animals, including injured wildlife.", species: ['bird', 'reptile/amphibian', 'small mammal', 'other/exotic'], rate: 4.9, care_type: ['trauma and injury', 'mobility concerns', 'routine check'], longitude: -73.9750, latitude: 40.7350, user: users[30], clinic_name: "Dr.Adams Wildlife Clinic" },
    { email: "drmorganpetparadise@example.com", phone_numer: "222-333-4444", webpage: "https://www.drmorganpetparadise.com", address: "505 Paradise St, Petown", description: "Offers luxury veterinary services for urban pets.", species: ['cat', 'dog', 'bird', 'small mammal', 'fish'], rate: 4.8, care_type: ['routine check', 'grooming', 'nutrition', 'dental', 'vaccination'], longitude: -74.0010, latitude: 40.7285, user: users[31], clinic_name: "Dr.Morgan Petparadise" },
    { email: "drgreenherbalsclinic@example.com", phone_numer: "323-444-5551", webpage: "https://www.drgreenherbalsclinic.com", address: "707 Herbal Rd, Greenfield", description: "Provides holistic and herbal treatments for pets.", species: ['cat', 'dog', 'small mammal'], rate: 4.7, care_type: ['holistic', 'nutrition', 'routine check', 'skin and ear infections'], longitude: -73.9655, latitude: 40.7400, user: users[10], clinic_name: "Dr.Green Herbals Clinic" }
  ].map do |clinic_attrs|
  clinic = Clinic.new(clinic_attrs)
  if clinic.save
    puts "Created clinic: #{clinic.clinic_name}"
  else
    puts "Failed to create clinic: #{clinic_attrs[:clinic_name]}"
    puts "Errors: #{clinic.errors.full_messages}"
  end
  clinic
end
puts "Clinics created: #{clinics.count}"

clinic_images = {
"cityvet@example.com" => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732040869/pexels-mikhail-nilov-7465698_jyqmyl_osqpq5.jpg",
"exoticcare@example.com" => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732040879/pexels-sparkphotopro-10559203_v8pzlt_c9dbz0.jpg",
"petexpress@example.com" => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732143152/close-up-veterinarian-taking-care-dog_esw5as.jpg",
"oceanviewvet@example.com" => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732040635/pexels-tima-miroshnichenko-6235666_npetby_ezs4cf.jpg",
"centralparkpets@example.com" => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732212710/Screenshot_2024-11-20_at_23.42.37_tbde77.png",
"harmonyanimalclinic@example.com" => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732040801/karlo-tottoc-ybZ5hRxaWS4-unsplash_qj0vfe_ha4ikh.jpg",
"sunnydaypets@example.com" => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732040795/pexels-marinaphotos-17084273_z7ciel_xdluoi.jpg",
"littlepawsvet@example.com" => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732040797/jeremy-alford-O13B7suRG4A-unsplash_ddux4e_pk5hd8.jpg",
"happyhoovesclinic@example.com" => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732128806/development/4g4v2torfic5i9xa1qgvclwvi630.jpg",
"birdsongvet@example.com" => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732040644/pexels-karolina-grabowska-4386467_mmbozc_hqpx9h.jpg",
"aquacareclinic@example.com" => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732040791/pexels-tessy-agbonome-521343232-19963193_ndbrqq_vd31z7.jpg",
"drsmithclinic@example.com" => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732040640/pexels-tima-miroshnichenko-6235233_nqgyho_pbvwlk.jpg",
"drkimsanimalcare@example.com" => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732040784/centre-for-ageing-better-LDbxOjVNxec-unsplash_mw8s8u_irtod0.jpg",
"drjohnsonvethaven@example.com" => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732040540/sincerely-media-Umg6HxxLQ3Q-unsplash_t7tlxn_ckbtzo.jpg",
"drbrownfarmcare@example.com" => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732040788/jonatan-bustos-P1Ku27zZJDs-unsplash_agpi3o_toodth.jpg",
"drleewildcare@example.com" => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732040781/cdc-uoYFqyvm6Bo-unsplash_iek4or_zusvcv.jpg",
"drandersonpetclinic@example.com" => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732040642/pexels-tima-miroshnichenko-6131543_jsxffg_wzttqi.jpg",
"drgarciaaquatics@example.com" => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732040777/pexels-ifaw-5486965_yz13ea_fg3sza.jpg",
"drdolittle@example.com" => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732040637/joenomias-m-de-jong-zhYy10qCzdw-unsplash_hkrrlf_rpjdvi.jpg",
"dradamswildlifeclinic@example.com" => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732142878/vet-clinic-concept-happy-male-doctor-veterinarian-holding-cute-black-pug-dog-smiling-camera-white-background_nn9sem.jpg",
"drmorganpetparadise@example.com" => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732040775/pexels-gustavo-fring-4173251_vhu03z_glrgdz.jpg",
"drgreenherbalsclinic@example.com" => "https://res.cloudinary.com/dpeys37ef/image/upload/v1732040628/pexels-ifaw-5487067_qymkdi_qggnwj.jpg",
}

# Attach Photos to Clinics

Clinic.all.each do |clinic|
  image_url = clinic_images[clinic.email]
  if image_url
    file = URI.open(image_url)
    clinic.image.attach(io: file, filename: "#{clinic.clinic_name.downcase}.jpg", content_type: "image/jpeg")
    puts "Attached photo for #{clinic.clinic_name}"
  else
    puts "No image URL found for #{clinic.clinic_name}"
  end
end

puts "Clinic photos attached!"

puts "Fetching all clinics.."
all_clinics = Clinic.all.map { |c| [c.id, c.clinic_name, c.user_id] }

if all_clinics.empty?
  puts "No clinics found in the database."
  exit # Exit seeding if no clinics exist
else
  puts "Clinics fetched"
end

# Fetch clinic_1 explicitly by ID or attribute
clinic_1 = Clinic.find_by(id: 1) # Replace `id: 1` with another attribute if necessary (e.g., email or clinic_name)
if clinic_1.nil?
  puts "Clinic with ID 1 does not exist. Please ensure it is created in the seed file."
  exit # Exit seeding if the clinic is not found
else
  puts "Clinic 1 found: #{clinic_1.clinic_name} at #{clinic_1.address}."
end

# Fetch all pets to ensure they exist
if pets.empty?
  puts "No pets found in the database. Ensure pets are seeded properly."
  exit
end

# Create Bookings
puts "Creating bookings..."
bookings = []

# Define the pet-care mapping explicitly to ensure correct matching
pet_care_details = [
  { pet: pets[0], species: pets[0].species, time: "10:00", description: "Microchipping Buddy.", care_type: 'microchipping' },
  { pet: pets[1], species: pets[1].species, time: "14:00", description: "Routine vaccination for Whiskers.", care_type: 'vaccination' },
  { pet: pets[2], species: pets[2].species, time: "16:00", description: "Urgent care for Rex.", care_type: 'toxin ingestion' },
  { pet: pets[4], species: pets[4].species, time: "11:00", description: "Dental check-up for Fluffy.", care_type: 'dental', date_offset: 1 },
  { pet: pets[7], species: pets[7].species, time: "15:00", description: "Wing trimming for Charlie.", care_type: 'surgery', date_offset: 2 },
  { pet: pets[9], species: pets[9].species, time: "09:30", description: "Vaccination for Oscar.", care_type: 'vaccination', date_offset: 3 },
  { pet: pets[3], species: pets[3].species, time: "13:00", description: "Swollen eyes.", care_type: 'eye issues', date_offset: 4 },
  { pet: pets[6], species: pets[6].species, time: "12:00", description: "Microchipping Bella", care_type: 'microchipping', date_offset: 5 },
  { pet: pets[5], species: pets[5].species, time: "14:30", description: "Routine check-up for Max.", care_type: 'routine check', date_offset: 6 },
  { pet: pets[8], species: pets[8].species, time: "10:15", description: "Behavioral consultation for Daisy.", care_type: 'mobility concerns', date_offset: 7 }
]

# Loop through each entry and create bookings
pet_care_details.each_with_index do |details, index|
  booking = Booking.create(
    clinic: clinic_1,
    pet: details[:pet],
    species: details[:species],
    date: Date.today + (details[:date_offset] || 0),
    time: details[:time],
    description: details[:description],
    care_type: details[:care_type]
  )

  # Add booking to the array and log the outcome
  if booking.persisted?
    bookings << booking
    puts "Booking created for #{booking.pet.name} at #{booking.clinic.clinic_name}, species: #{booking.species}."
  else
    puts "Failed to create booking for #{details[:pet].name}: #{booking.errors.full_messages}"
  end
end

# Print summary of all bookings
puts "Bookings created"

# Additional error log for failed bookings
# if bookings.any? { |b| !b.valid? }
#   puts "Some bookings failed to validate:"
#   bookings.each do |booking|
#     if booking.errors.any?
#       puts "Booking for #{booking.pet.name} failed: #{booking.errors.full_messages}"
#     end
#   end
# end
puts "Creating additional bookings for first 2 vets..."

# Get the first 5 vet users and their clinics
vet_users = User.where(role: "vet")
vet_users_with_clinics = vet_users[0..1].map do |vet|
  clinic = Clinic.find_by(user: vet)

  { vet: vet, clinic: clinic }
end

# Distribute bookings with diverse care types
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
      care_type: 'routine check',
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
      care_type: 'emergency',
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
      care_type: 'neutering',
      description: "Neutering surgery for #{pet.name}."
    )
  end

  # Create 2 Vaccinations
  vaccinations = pets_sample[11..12].map.with_index(1) do |pet, booking_index|
    Booking.create!(
      clinic: clinic,
      pet: pet,
      date: Date.today + index * 2 + booking_index + 15,
      time: "#{10 + booking_index}:15",
      care_type: 'vaccination',
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
      care_type: 'dental',
      description: "Dental cleaning for #{pet.name}, promoting oral health."
    )
  end

  # Create 1 Deworming Appointment
  deworming = Booking.create!(
    clinic: clinic,
    pet: pets_sample[4],
    date: Date.today + index * 2 + 25,
    time: "10:30",
    care_type: 'preventive care',
    description: "Deworming treatment for #{pets_sample[4].name}."
  )

  # Create Flea Treatment
  flea = Booking.create!(
    clinic: clinic,
    pet: pets_sample[8],
    date: Date.today + index * 2 + 30,
    time: "11:45",
    care_type: 'flea and tick',
    description: "Flea treatment for #{pets_sample[8].name}."
  )

  puts <<~INFO
    Created #{routine_checkups.count} Routine Check-ups,
    #{emergencies.count} Emergency Visits,
    #{neuterizations.count} Neuterization Appointments,
    #{vaccinations.count} Vaccinations,
    #{dental_cleanings.count} Dental Cleanings,
    1 Deworming Treatment,
    and 1 Flea Treatment
    for clinic #{clinic.address} (Vet: #{vet_info[:vet].clinic_name}).
  INFO
end

# After the loop ends
puts "Diverse bookings  different treatments created successfully!"


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
puts "Reviews created: #{reviews.map { |r| [r.booking.description, r.user.first_name,r.booking.clinic.clinic_name, r.rating] }}"

puts "Seeding complete!"
