



Group.create! ([
  {
    id: 1,
    name: "WDI Tunesquad",
    description: "Just a group of wannabe coders looking for a chance to escape.",
    start:("09/01/2017"),
    end:("10/15/2017")
  },
  {
    id: 2,
    name: "Taco Tuesdays",
    description: "Looking for my travel soulmate, willing to spend every Tuesday searching for the best taco spots",
    start:("08/22/2017"),
    end:("08/22/2017")
  },
  {
    id: 3,
    name: "New Zealand-bound",
    description: "We have two months to explore the best that the Kiwis have to offer.",
    start:("11/01/2017"),
    end:("01/15/2018")
  },
  {
    id: 4,
    name: "European Newbies",
    description: "Traveling through anywhere from 5 to 12 countries in Europe. ",
    start:("01/21/2018"),
    end:("02/02/2018")
  },
  {
    id: 5,
    name: "Deep in [travel] Thought",
    description: "Wherever you go becomes a part of you somehow.” “Travel is fatal to prejudice, bigotry, and narrow-mindedness, and many of our people need it sorely on these accounts. Broad, wholesome, charitable views of men and things cannot be acquired by vegetating in one little corner of the earth all one's lifetime",
    start:("09/01/2017"),
    end:("10/15/2017")
  },
  {
    id: 6,
    name: "Adventure is Worthwhile",
    description: "Looking to jump around South America. Hopes are high and so is the need to practice our Spanish",
    start:("08/023/2017") ,
    end:("09/03/2017")
  }
])

Trip.create!([
  {
    id: 1,
    city: "San Diego",
    state: "CA",
    country: "United States",
    # longitude: '117.1611',
    # latitude: '32.7157',
    zipcode: 22434,
    group_id: 1
  },
  {
    id: 2,
    city: "New York",
    state: "NY",
    country: "United States",
    # longitude: ‎'-73.935242',
    # latitude: '40.7128',
    zipcode: 10022,
    group_id: 2
  },
  {
    id: 3,
    city: "Paris",
    state: "",
    country: "France",
    # longitude: '2.3522',
    # latitude: '48.8566',
    # zipcode:
    group_id: 4
  },
  {
    id: 4,
    city: "Rome",
    state: "",
    country: "Italy",
    # longitude: '12.4964',
    # latitude: '41.9028',
    # zipcode:
    group_id: 4
  },
  {
    id: 5,
    city: "Amsterdam",
    state: "",
    country: "Holland",
    # longitude: '4.8952',
    # latitude: '52.3702',
    # zipcode: ,
    group_id: 4
  },
  {
    id: 6,
    city: "Wanaka",
    state: "",
    country: "New Zealand",
    # longitude: '169.1321',
    # latitude: '44.7032',
    # zipcode: ,
    group_id: 3
  },
  {
    id: 7,
    city: "Queenstown",
    state: "",
    country: "New Zealand",
    # longitude: '168.6626',
    # latitude: '45.0312',
    # zipcode: ,
    group_id: 3
  },
  {
    id: 8,
    city: "Detroit",
    state: "MI",
    country: "United States",
    # longitude:  ‎'-83.045753',
    # latitude: '42.3314',
    zipcode: 48127,
    group_id: 5
  }
  ])

Itinerary.create!([
  {
  title: "USS Midway Museum",
  description: "The USS Midway Museum is San Diego’s newest visitor attraction, this real naval aircraft carrier offers a once in a lifetime opportunity for everyone. Guests of all ages can enjoy a self-guided audio tour featuring 60 exhibits highlighting this “city at sea” and 25 restored aircrafts. Explore galleys, officer’s country and sleeping quarters of a 69,000 ton ship, naturally located in Navy Town USA, a visit to the Midway is uniquely San Diego!",
  start_time: DateTime.parse("09/01/2017 17:00"),
  end_time: DateTime.parse("09/01/2017 17:45"),
  color: "Red",
  trip_id: 1
  },
  ])

User.create([
 {
   id: 1,
   email: "nfehlinger@wdi.com",
   password: "password",
   avatar: File.new("#{Rails.root}/app/assets/images/profiles/Nick.jpeg"),
   fname: "Nick",
   lname: "Fehlinger",
   bio: "Hey, I'm Nick. Apart from travel, I thoroughly enjoy keeping up with the most hipster events. Whether its a cup of freshly brewed organic coffee, or rocking a solid Fedora, I am always open to meeting new people. As long as you love MGMT.",
   username: "nfehlinger"
 },
 {
   id: 2,
   email: "dcalifornia@wdi.com",
   password: "password",
   avatar: File.new("#{Rails.root}/app/assets/images/profiles/Dennis.jpeg"),
   fname: "Dennis",
   lname: "California",
   bio: "Why would I travel? Go K*** yourself. ",
   username: "dannycals123"
 },
 {
   id: 3,
   email: "kpola@wdi.com",
   password: "password",
   avatar: File.new("#{Rails.root}/app/assets/images/profiles/Katy.jpeg"),
   fname: "Katy",
   lname: "Pola",
   bio: "Traveling is one of my favorite experiences. The best part about traveling is trying the different wines.",
   username: "kpola123"
 },
 {
   id: 4,
   email: "jlim@wdi.com",
   password: "password",
   avatar: File.new("#{Rails.root}/app/assets/images/profiles/James.jpeg"),
   fname: "James",
   lname: "Lim",
   bio: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
   username: "jlim123"
 },
 {
   id: 5,
   email: "ccrews@wdi.com",
   password: "password",
   avatar: File.new("#{Rails.root}/app/assets/images/profiles/Cam.jpeg"),
   fname: "Cam",
   lname: "Crews",
   bio: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
   username: "ccrews123"
 },
 {
   id: 6,
   email: "eyoung@wdi.com",
   password: "password",
   avatar: File.new("#{Rails.root}/app/assets/images/profiles/Erin.jpeg"),
   fname: "Erin",
   lname: "Young",
   bio: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
   username: "eyoung123"
 },
 {
   id: 7,
   email: "hpalacios@wdi.com",
   password: "password",
   avatar: File.new("#{Rails.root}/app/assets/images/profiles/Hans.jpeg"),
   fname: "Hans",
   lname: "Palacios",
   bio: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
   username: "hpalacios123"
 },
 {

   id: 8,
   email: "sgarcia@wdi.com",
   password: "password",
   avatar: File.new("#{Rails.root}/app/assets/images/profiles/Steven.jpeg"),
   fname: "Steven",
   lname: "Garcia",
   bio: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
   username: "sgarcia123"
 },
 {
   id: 9,
   email: "ohuang@wdi.com",
   password: "password",
   avatar: File.new("#{Rails.root}/app/assets/images/profiles/Oliver.jpeg"),
   fname: "Oliver",
   lname: "Huang",
   bio: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
   username: "ohuang123"
 },
 {
   id: 10,
   email: "nparsa@wdi.com",
   password: "password",
   avatar: File.new("#{Rails.root}/app/assets/images/profiles/Neil.jpeg"),
   fname: "Neil",
   lname: "Parsa",
   bio: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
   username: "nparsa123"
 },
 {
   id: 11,
   email: "temperance@wdi.com",
   password: "password",
   avatar: File.new("#{Rails.root}/app/assets/images/profiles/Temperance.jpeg"),
   fname: "Temperance",
   lname: "Baker",
   bio: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
   username: "temperance123"
 },
 {
   id: 12,
   email: "lbaker@wdi.com",
   password: "password",
   avatar: File.new("#{Rails.root}/app/assets/images/profiles/Logan.jpeg"),
   fname: "Logan",
   lname: "Baker",
   bio: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
   username: "lbaker123"
 }

 ])

# Friendship.create([
#   friendable_type: " ",
#   friendable_id: ,
#   friend_id: ,
#   blocker_id: ,
#   status: ,
#
#
#   ])

GroupUser.create([
   {
    user_id: 1,
    group_id: 1
   },
   {
    user_id: 2,
    group_id: 1
   },
   {
    user_id: 3,
    group_id: 1
   },
   {
    user_id: 4,
    group_id: 1
   },
   {
    user_id: 5,
    group_id: 1
   },
   {
    user_id: 6,
    group_id: 1
   },
   {
    user_id: 7,
    group_id: 1
   },
   {
    user_id: 8,
    group_id: 1
   },
   {
    user_id: 9,
    group_id: 1
   },
   {
    user_id: 10,
    group_id: 1
   },
   {
    user_id: 11,
    group_id: 1
   },
   {
    user_id: 12,
    group_id: 1
   },
   {
    user_id: 12,
    group_id: 3,
   },
   {
    user_id: 12,
    group_id: 5
   },
   {
    user_id: 12,
    group_id: 6
   },
   {
    user_id: 11,
    group_id: 3,
   },
   {
    user_id: 10,
    group_id: 2
   },
   {
    user_id: 10,
    group_id: 6
   },
   {
    user_id: 9,
    group_id: 5
   },
   {
    user_id: 9,
    group_id: 3
   },
   {
    user_id: 8,
    group_id: 3
   },
   {
    user_id: 8,
    group_id: 2
   },
   {
    user_id: 7,
    group_id: 2
   },
   {
    user_id: 7,
    group_id: 3
   },
   {
    user_id: 7,
    group_id: 4
   },
   {
    user_id: 7,
    group_id: 5
   },
   {
    user_id: 6,
    group_id: 6
   },
   {
    user_id: 4,
    group_id: 2
   },
   {
    user_id: 3,
    group_id: 3
   },
   {
    user_id: 2,
    group_id: 3
   },
   {
    user_id: 2,
    group_id: 5
   },
   {
    user_id: 2,
    group_id: 6
   },
   {
    user_id: 1,
    group_id: 2
   },
   {
    user_id: 1,
    group_id: 3
   },
   {
    user_id: 1,
    group_id: 4
   },
   {
    user_id: 1,
    group_id: 5
   }
   ])


# Group.find(1).groups << User.find(1) << User.find(3) << User.find(5)
#
# Group.find(2).groups << User.find(1) << User.find(5)
#
