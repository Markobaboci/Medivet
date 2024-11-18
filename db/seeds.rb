# Clear existing data to avoid duplicates
puts "Clearing existing data..."
Review.destroy_all
Booking.destroy_all
Clinic.destroy_all
Pet.destroy_all
User.destroy_all
puts "Existing data cleared!"

# Create Users
puts "Creating users..."
users = User.create([
  { email: "quentin@example.com", password: "password" },
  { email: "marko@example.com", password: "password" },
  { email: "joseph@example.com", password: "password" },
  { email: "liza@example.com", password: "password" },
  { email: "louiza@example.com", password: "password" },
  { email: "vetpro@example.com", password: "password" },
  # Additional users
  { email: "alice@example.com", password: "password" },
  { email: "bob@example.com", password: "password" },
  { email: "charlie@example.com", password: "password" },
  { email: "diana@example.com", password: "password" }
])
puts "Users created: #{users.map(&:email)}"

# Create Pets
puts "Creating pets..."
pets = Pet.create([
  { name: "Buddy", age: 3, species: "dog", breed: "Golden Retriever", weight: 30.5, description: "Friendly and energetic, loves playing fetch.", user: users[0] },
  { name: "Whiskers", age: 2, species: "cat", breed: "Siamese", weight: 5.2, description: "Independent yet affectionate, loves sunbathing.", user: users[1] },
  { name: "Rex", age: 4, species: "dog", breed: "German Shepherd", weight: 40.3, description: "Loyal and protective, great with kids.", user: users[2] },
  { name: "Loco", age: 12, species: "exotic", breed: "Amazon Iguana", weight: 15.7, description: "Aggressive, great defensor.", user: users[2] },
  { name: "Fluffy", age: 1, species: "rabbit", breed: "Angora", weight: 2.5, description: "Soft and cuddly, loves carrots and hopping around.", user: users[1] },
  # Additional pets
  { name: "Max", age: 5, species: "dog", breed: "Bulldog", weight: 24.0, description: "Calm and friendly, enjoys short walks.", user: users[6] },
  { name: "Bella", age: 2, species: "cat", breed: "Persian", weight: 4.0, description: "Loves being pampered, has a fluffy coat.", user: users[7] },
  { name: "Charlie", age: 3, species: "bird", breed: "Parrot", weight: 0.9, description: "Talkative and smart, knows several words.", user: users[8] },
  { name: "Daisy", age: 4, species: "dog", breed: "Beagle", weight: 10.0, description: "Playful and curious, loves exploring.", user: users[9] },
  { name: "Oscar", age: 1, species: "cat", breed: "Maine Coon", weight: 6.5, description: "Gentle giant, very sociable.", user: users[6] }
])
puts "Pets created: #{pets.map(&:name)}"

# Create Clinics
puts "Creating clinics..."
clinics = [
  { email: "cityvet@example.com", phone_numer: "123-456-7890", webpage: "https://www.cityvet.com", address: "123 Main St, Cityville", description: "A full-service veterinary clinic for cats and dogs.", species: "dog", rate: 4.5, care_type: "general", longitude: -74.0059728, latitude: 40.7127753, user: users[3] },
  { email: "exoticcare@example.com", phone_numer: "987-654-3210", webpage: "https://www.exoticcareclinic.com", address: "456 Side Ave, Petown", description: "Specializes in exotic pets including birds, reptiles, and small mammals.", species: "exotic", rate: 4.8, care_type: "specialty", longitude: -73.935242, latitude: 40.73061, user: users[4] },
  { email: "petexpress@example.com", phone_numer: "555-123-4567", webpage: "https://www.petexpress.com", address: "789 Uptown Blvd, Animaltown", description: "Emergency and urgent care for all domestic pets.", species: "cat", rate: 4.3, care_type: "emergency", longitude: -74.006, latitude: 40.714, user: users[5] },
  # Additional clinics
  { email: "smallpetcare@example.com", phone_numer: "222-333-4444", webpage: "https://www.smallpetcare.com", address: "1010 Tiny Lane, Smallville", description: "Expert care for rabbits, hamsters, and other small pets.", species: "rabbit", rate: 4.7, care_type: "general", longitude: -74.001, latitude: 40.7128, user: users[6] },
  { email: "birdhaven@example.com", phone_numer: "333-444-5555", webpage: "https://www.birdhaven.com", address: "2020 Feather St, Birdcity", description: "Dedicated avian veterinary services.", species: "bird", rate: 4.9, care_type: "specialty", longitude: -74.002, latitude: 40.7130, user: users[7] }
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
  # Additional bookings
  { clinic: clinic_4, pet: pets[4], date: Date.today + 1, time: "11:00", description: "Dental check-up for Fluffy." },
  { clinic: clinic_5, pet: pets[7], date: Date.today + 2, time: "15:00", description: "Wing trimming for Charlie." },
  { clinic: clinic_1, pet: pets[9], date: Date.today + 3, time: "09:30", description: "Vaccination for Oscar." },
  { clinic: clinic_2, pet: pets[3], date: Date.today + 4, time: "13:00", description: "Special care for Loco." },
  { clinic: clinic_3, pet: pets[6], date: Date.today + 5, time: "12:00", description: "Check-up for Bella." },
  { clinic: clinic_4, pet: pets[5], date: Date.today + 6, time: "14:30", description: "Routine check-up for Max." },
  { clinic: clinic_5, pet: pets[8], date: Date.today + 7, time: "10:15", description: "Behavioral consultation for Daisy." }
])
puts "Bookings created: #{bookings.map { |b| [b.clinic.address, b.pet.name] }}"

# Create Reviews
puts "Creating reviews..."
reviews = Review.create([
  { booking: bookings[0], user: pets[0].user, content: "Excellent care!", rating: 5 },
  { booking: bookings[1], user: pets[1].user, content: "Great experience.", rating: 4 },
  { booking: bookings[2], user: pets[2].user, content: "Not bad, but could improve.", rating: 3 },
  # Additional reviews
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
