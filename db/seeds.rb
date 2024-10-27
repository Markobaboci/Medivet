# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.create([
  { name: "Quentin", email: "quentin@example.com", password: "password" },
  { name: "Marko", email: "marko@example.com", password: "password" }
  { name: "Joseph", email: "joseph@example.com", password: "password" }
  { name: "Liza", email: "liza@example.com", password: "password" }
  { name: "Louiza", email: "louiza@example.com", password: "password" }
  { name: "VetPro", email: "vetpro@example.com", password: "password" }
])

Pet.create([
  {
    name: "Buddy",
    age: 3,
    species: "Dog",
    breed: "Golden Retriever",
    weight: 30.5,
    description: "Friendly and energetic, loves playing fetch.",
    user_id: 1
  },
  {
    name: "Whiskers",
    age: 2,
    species: "Cat",
    breed: "Siamese",
    weight: 5.2,
    description: "Independent yet affectionate, loves sunbathing.",
    user_id: 2
  },
  {
    name: "Rex",
    age: 4,
    species: "Dog",
    breed: "German Shepherd",
    weight: 40.3,
    description: "Loyal and protective, great with kids.",
    user_id: 3
  },
  {
    name: "Fluffy",
    age: 1,
    species: "Rabbit",
    breed: "Angora",
    weight: 2.5,
    description: "Soft and cuddly, loves carrots and hopping around.",
    user_id: 2
  }
])

Clinic.create([
  {
    email: "cityvet@example.com",
    phone_numer: "123-456-7890",
    webpage: "https://www.cityvet.com",
    address: "123 Main St, Cityville",
    description: "A full-service veterinary clinic for cats and dogs.",
    species: "Dogs, Cats",
    logitude: -74.0059728,
    latitude: 40.7127753,
    rate: 4.5,
    care_type: "General Care",
    user_id: 4
  },
  {
    email: "exoticcare@example.com",
    phone_numer: "987-654-3210",
    webpage: "https://www.exoticcareclinic.com",
    address: "456 Side Ave, Petown",
    description: "Specializes in exotic pets including birds, reptiles, and small mammals.",
    species: "Birds, Reptiles, Small Mammals",
    logitude: -73.935242,
    latitude: 40.73061,
    rate: 4.8,
    care_type: "Specialty Care",
    user_id: 5
  },
  {
    email: "petexpress@example.com",
    phone_numer: "555-123-4567",
    webpage: "https://www.petexpress.com",
    address: "789 Uptown Blvd, Animaltown",
    description: "Emergency and urgent care for all domestic pets.",
    species: "Dogs, Cats, Rabbits",
    logitude: -74.006,
    latitude: 40.714,
    rate: 4.3,
    care_type: "Emergency Care",
    user_id: 6
  }
])
