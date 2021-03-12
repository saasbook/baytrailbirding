# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Location Seed Data

#facilities = Facility.create([{name: "Bathroom", icon: "https://cdn1.iconfinder.com/data/icons/construction-2-13/48/87-512.png"}])
locations = Location.create([{name: "Heron's Head Pakr", description: "Once slated to be a new shipping terminal in the 1970s, this slice of land ultimately became one of San
Francisco’s natural gems thanks to a wetland restoration project in the 1990s. Heron’s Head Park is
representative of what much of the San Francisco coastline once was: grassland uplands gently sloping
into the pickleweed marsh bordering the bay. The pleasantly musical song of the many White-crowned
Sparrows carries over the uplands, which are dotted with orange poppies in spring. On the mudflats a
variety of ducks and shorebirds feed close to the trail during migration. Listen for the shrill calls from a
pair of Black Oystercatchers that sometimes nest on the dilapidated pier in spring and summer.", 
longitude: "-122.373510", latitude: "37.738327"}])