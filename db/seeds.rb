# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create([
  {email: 'chesttest@tester.com', password:'secret', password_confirmation: 'secret'},
  {email: "moe@tester.com", password: "secret", password_confirmation: "secret"}
  ])

admins = Admin.create([
  {email: 'rsmoke@umich.edu', password:'secret', password_confirmation: 'secret'}
  ])Admin.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?


# camp1 = CampOccurrence.find(5)
# camp2 = CampOccurrence.find(7)
# camp3 = CampOccurrence.find(8)


# camp2.courses.create(title: "Catalysis, Solar Energy and Green Chemical Synthesis", available_spaces: 25, status: "open")
# camp1.courses.create(title: "Dissecting Life: Human Anatomy and Physiology", available_spaces: 25, status: "open")
# camp1.courses.create(title: "Forensic Physics", available_spaces: 25, status: "open")
# camp1.courses.create(title: "Graph Theory", available_spaces: 25, status: "open")
# camp1.courses.create(title: "Hex and the 4 Cs", available_spaces: 25, status: "open")
# camp1.courses.create(title: "Life, Death and Change: Landscapes and Human Impact", available_spaces: 25, status: "open")
# camp1.courses.create(title: "Mathematical Modeling in Biology", available_spaces: 25, status: "open")
# camp1.courses.create(title: "Mathematics and Music Theory", available_spaces: 25, status: "open")
# camp1.courses.create(title: "Relativity: A Journey through Warped Space and Time", available_spaces: 25, status: "open")
# camp1.courses.create(title: "Roller Coaster Physics", available_spaces: 25, status: "open")
# camp1.courses.create(title: "Sampling, Monte Carlo and Problem Solving: How Analyzing Statistics Helps us Improve", available_spaces: 25, status: "open")
# camp1.courses.create(title: "The Physics of Magic and the Magic of Physics", available_spaces: 25, status: "open")

# camp2.courses.create(title: "Catalysis, Solar Energy and Green Chemical Synthesis", available_spaces: 25, status: "open")
# camp2.courses.create(title: "Dissecting Life: Human Anatomy and Physiology", available_spaces: 25, status: "open")
# camp2.courses.create(title: "Forensic Physics", available_spaces: 25, status: "open")
# camp2.courses.create(title: "Graph Theory", available_spaces: 25, status: "open")
# camp2.courses.create(title: "Human Identification: Forensic Anthropology Methods", available_spaces: 25, status: "open")
# camp2.courses.create(title: "Mathematics and the Internet", available_spaces: 25, status: "open")
# camp2.courses.create(title: "Mathematics of Decisions, Elections and Games", available_spaces: 25, status: "open")
# camp2.courses.create(title: "Organic Chemistry 101: Orgo Boot Camp", available_spaces: 25, status: "open")
# camp2.courses.create(title: "Paleobiology - Biodiversity and mass extinctions through deep time", available_spaces: 25, status: "open")

# camp3.courses.create(title: "Art and Mathematics", available_spaces: 25, status: "open")
# camp3.courses.create(title: "Biological Oceanography ? Food web dynamics in the marine world", available_spaces: 25, status: "open")
# camp3.courses.create(title: "Brain and Behavior", available_spaces: 25, status: "open")
# camp3.courses.create(title: "Climbing the Distance Ladder to the Big Bang: How Astronomers Survey the Universe", available_spaces: 25, status: "open")
# camp3.courses.create(title: "Dissecting Life: Human Anatomy and Physiology", available_spaces: 25, status: "open")
# camp3.courses.create(title: "Fibonacci Numbers", available_spaces: 25, status: "open")
# camp3.courses.create(title: "Graph Theory", available_spaces: 25, status: "open")
# camp3.courses.create(title: "Human Identification: Forensic Anthropology Methods", available_spaces: 25, status: "open")
# camp3.courses.create(title: "Mathematics of Cryptography", available_spaces: 25, status: "open")
# camp3.courses.create(title: "Organic Chemistry 101: Orgo Boot Camp", available_spaces: 25, status: "open")
# camp3.courses.create(title: "Relativity: A Journey through Warped Space and Time", available_spaces: 25, status: "open")
# camp3.courses.create(title: "Surface Chemistry", available_spaces: 25, status: "open")
# camp3.courses.create(title: "Sustainable Polymers", available_spaces: 25, status: "open")
