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
  ])
  Admin.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?


gender = Gender.create([
  {name: "Female", description; "dudette"},
  {name: "Male", description; "dude"}
])


camp_configuration = CampConfiguration.create([
  {camp_year: 2021, application_open: "2021-01-01", application_close: "2021-05-01", priority: "2021-04-01", application_materials_due: "2021-05-20", camper_acceptance_due: "2021-06-01", active: true}
])

camp_occurrence = CampOccurrence.create([
  {camp_configuration_id: CampConfiguration.last, description: "Session 1", begin_date: "2021-09-14", end_date: "2021-09-21", active: true}
  {camp_configuration_id: CampConfiguration.last, description: "Session 2", begin_date: "2021-09-23", end_date: "2021-09-30", active: true}
  {camp_configuration_id: CampConfiguration.last, description: "Session 3", begin_date: "2021-10-3", end_date: "2021-10-10", active: true}


  ])
camp1 = CampOccurrence.first
camp2 = CampOccurrence.second
camp3 = CampOccurrence.last

course1 = camp1.create([
  {title: "Dissecting Life: Human Anatomy and Physiology", available_spaces: 25, status: "open"},
  {title: "Forensic Physics", available_spaces: 25, status: "open"},
  {title: "Graph Theory", available_spaces: 25, status: "open"},
  {title: "Hex and the 4 Cs", available_spaces: 25, status: "open"},
  {title: "Life, Death and Change: Landscapes and Human Impact", available_spaces: 25, status: "open"},
  {title: "Mathematical Modeling in Biology", available_spaces: 25, status: "open"},
  {title: "Mathematics and Music Theory", available_spaces: 25, status: "open"},
  {title: "Relativity: A Journey through Warped Space and Time", available_spaces: 25, status: "open"},
  {title: "Roller Coaster Physics", available_spaces: 25, status: "open"},
  {title: "Sampling, Monte Carlo and Problem Solving: How Analyzing Statistics Helps us Improve", available_spaces: 25, status: "open"},
  {title: "The Physics of Magic and the Magic of Physics", available_spaces: 25, status: "open"}
])

course2 = camp2.create([
  {title: "Catalysis, Solar Energy and Green Chemical Synthesis", available_spaces: 25, status: "open"},
  {title: "Dissecting Life: Human Anatomy and Physiology", available_spaces: 25, status: "open"},
  {title: "Forensic Physics", available_spaces: 25, status: "open"},
  {title: "Graph Theory", available_spaces: 25, status: "open"},
  {title: "Human Identification: Forensic Anthropology Methods", available_spaces: 25, status: "open"},
  {title: "Mathematics and the Internet", available_spaces: 25, status: "open"},
  {title: "Mathematics of Decisions, Elections and Games", available_spaces: 25, status: "open"},
  {title: "Organic Chemistry 101: Orgo Boot Camp", available_spaces: 25, status: "open"},
  {title: "Paleobiology - Biodiversity and mass extinctions through deep time", available_spaces: 25, status: "open"}
])

course3 = camp3.create([
  {title: "Art and Mathematics", available_spaces: 25, status: "open"},
  {title: "Biological Oceanography ? Food web dynamics in the marine world", available_spaces: 25, status: "open"},
  {title: "Brain and Behavior", available_spaces: 25, status: "open"},
  {title: "Climbing the Distance Ladder to the Big Bang: How Astronomers Survey the Universe", available_spaces: 25, status: "open"},
  {title: "Dissecting Life: Human Anatomy and Physiology", available_spaces: 25, status: "open"},
  {title: "Fibonacci Numbers", available_spaces: 25, status: "open"},
  {title: "Graph Theory", available_spaces: 25, status: "open"},
  {title: "Human Identification: Forensic Anthropology Methods", available_spaces: 25, status: "open"},
  {title: "Mathematics of Cryptography", available_spaces: 25, status: "open"},
  {title: "Organic Chemistry 101: Orgo Boot Camp", available_spaces: 25, status: "open"},
  {title: "Relativity: A Journey through Warped Space and Time", available_spaces: 25, status: "open"},
  {title: "Surface Chemistry", available_spaces: 25, status: "open"},
  {title: "Sustainable Polymers", available_spaces: 25, status: "open"}
])
