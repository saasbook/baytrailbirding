# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Location Seed Data

#facilities = Facility.create([{name: "Bathroom", icon: "https://cdn1.iconfinder.com/data/icons/construction-2-13/48/87-512.png"}])
locations = Location.create([{name: "Heron's Head Park", 
							description: "Once slated to be a new shipping terminal in the 1970s, this slice of land ultimately became one of San
Francisco’s natural gems thanks to a wetland restoration project in the 1990s. Heron’s Head Park is
representative of what much of the San Francisco coastline once was: grassland uplands gently sloping
into the pickleweed marsh bordering the bay. The pleasantly musical song of the many White-crowned
Sparrows carries over the uplands, which are dotted with orange poppies in spring. On the mudflats a
variety of ducks and shorebirds feed close to the trail during migration. Listen for the shrill calls from a
pair of Black Oystercatchers that sometimes nest on the dilapidated pier in spring and summer.", 
							longitude: "-122.373510", latitude: "37.738327"},
							{name: "Coyote Point Recreation Area",
								description: "This former site of an Ohlone fishing village now has a marina, a museum, and a eucalyptus forest. A
variety of sea ducks can be seen around Coyote Point, some of which are harder to find elsewhere in the
bay. Surf Scoters, scaup (especially Greater), and Common Goldeneyes are all approachable as they dive
for mollusks just offshore. There is sometimes a Harlequin Duck roosting on the rocks below the bluffs.
Black Turnstones and Surfbirds scour the rocky shoreline in fall and winter, as do a few Wandering
Tattlers from late summer through fall. The eucalyptus forest is busy with warblers and hummingbirds
when the trees are flowering in winter, and also during migration when landbirds drop in. An
unexpected denizen of this exotic forest is the Nuttall’s Woodpecker, which is resident. The recreation
area has attracted many rare birds over the years including Dusky Warbler, Yellow-throated Warbler,
and Yellow-crowned Night-Heron.", longitude:"0", latitude:"0"}])