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
Sparrows carries over the uplands, which are dotted with orange poppies in spring.", 
							longitude: "-122.373510", latitude: "37.738327"},
							{name: "Coyote Point Recreation Area",
								description: "This former site of an Ohlone fishing village now has a marina, a museum, and a eucalyptus forest. A
variety of sea ducks can be seen around Coyote Point, some of which are harder to find elsewhere in the
bay. Surf Scoters, scaup (especially Greater), and Common Goldeneyes are all approachable as they dive
for mollusks just offshore. There is sometimes a Harlequin Duck roosting on the rocks below the bluffs.
Black Turnstones and Surfbirds scour the rocky shoreline in fall and winter, as do a few Wandering
Tattlers from late summer through fall. ", longitude:"-122.318821", latitude:"37.587750"},
							{name: "Martin Luther King Jr. Regional Shoreline",
								description: "This park comprises much of the shoreline around San Leandro Bay, which is a small, sheltered area
tucked behind Alameda and the Oakland Airport. Arrowhead Marsh is the prominent natural feature
here. A boardwalk extending into the marsh provides one of the best opportunities to see the secretive
Ridgway’s Rail as they emerge from the cordgrass to forage in the winding slough channels at low tide.", latitude:"37.731010", longitude:"-122.208106"},
							{name: "Presidio",
								description: "This area at the mouth of the San Francisco Bay offers grand views and a variety of birding. Battery
Godfrey and Lands End west of the Golden Gate Bridge are hotspots where birds can be seen migrating
north in spring and south in fall. Migration in spring includes swifts, warblers, orioles, and more. Many of
the same species also pass through again in the fall, but at this time of year look especially for raptors
crossing the Golden Gate strait from the Marin headlands. Large flocks of Vaux’s Swifts are often seen
overhead in fall while Elegant Terns are pursued intently by Parasitic Jaegers offshore.", latitude: "37.800337", longitude: "-122.468419"},
							{name: "Lake Merritt", description: "This lake in Oakland was originally a salt marsh named “Laguna Peralta,” and then became the first
National Wildlife Refuge in North America in 1869. The lake is a popular wintering site for a great variety
of waterfowl. A few Barrow’s Goldeneyes spend the winter here and the larger diving ducks such as
Canvasback, Lesser Scaup, and Greater Scaup are unusually approachable at the shoreline.", latitude:"37.803523", longitude:"-122.257413"}])