Rails: version - 5.1.2
APIs: 'AceHopper', 'Google Calendar'
Gems: 'Devise', 'Paperclip', 'Geocoder', 'has_friendship'

```
rails new travel_batch
```
--------------------------------------------------------------------------------------------------------------------------------------------
                        GEM INSTALL
--------------------------------------------------------------------------------------------------------------------------------------------
---In the gem file, we will add our gems to be used---
```
gem 'devise'
gem 'paperclip'
gem 'geocoder'
gem 'has_friendship'
gem 'simple_calendar'
```

```
bundle install
```
--------------------------------------------------------------------------------------------------------------------------------------------
                                                          DEVISE
--------------------------------------------------------------------------------------------------------------------------------------------

--Next we are going to set up devise--
```
rails generate devise:install
```

in config/environments/devolopments.rb paste the code generated in the terminal
```
config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
```

--In your app.erb paste these alerts--
```
<p class="notice"><%= notice %></p>
<p class="alert"><%= alert %></p>
```
--Create a user model through Devise then migrate, default is Admin--
```
rails g devise User
rails db:migrate
```
--- NOTE:You should restart your application after changing Devise's configuration options. Otherwise, you will run into strange errors, for example, users being unable to login and route helpers being undefined.---


---Add the packaged views from devise---
```
rails g devise:views
```
---Add the packaged controllers from devise---
```
rails g devise:controllers users
```
---reset registrations controller routes in ``routes.rb``---
```
devise_for :users, controllers: {
    registrations: 'users/registrations'
    }
```
--------------------------------------------------------------------------------------------------------------------------------------------
                                                        PAPERCLIP
--------------------------------------------------------------------------------------------------------------------------------------------

---Models---
```
class User < ActiveRecord::Base
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
```

---Migrations (since our user will already be generated through Devise)---
```
class AddAvatarColumnsToUsers < ActiveRecord::Migration
  def up
    add_attachment :users, :avatar
  end

  def down
    remove_attachment :users, :avatar
  end
end
```

---Edit and New Views---
```
<%= form_for @user, url: users_path, html: { multipart: true } do |form| %>
  <%= form.file_field :avatar %>
<% end %>
```

---Controller---
```
def create
  @user = User.create( user_params )
end

private

# Use strong_parameters for attribute whitelisting
# Be sure to update your create() and update() controller methods.

def user_params
  params.require(:user).permit(:avatar)
end
```

--------------------------------------------------------------------------------------------------------------------------------------------
                                                        SCAFFOLDING TIME!
--------------------------------------------------------------------------------------------------------------------------------------------
---Users are alreasy built from Devise---
```
rails g scaffold group name:string description:text start:date end:date
rails g scaffold trip city:string state:string country:string longitude:float latitude:float zipcode:integer
rails g scaffold group_comment body:text user:belongs_to group:belongs_to
rails g scaffold trip_comment body:text user:belongs_to trip:belongs_to
rails g model group_user user:belongs_to group:belongs_to
```


--------------------------------------------------------------------------------------------------------------------------------------------
                                                        GEOCODER
--------------------------------------------------------------------------------------------------------------------------------------------

---IF NOT INCLUDED IN SCAFFOLD!!! Otherwise skip step below------------------
---Model must have two attributes (database columns) for storing latitude and longitude coordinates. By default we will call them latitude and longitude---
```
rails g migration AddLatitudeAndLongitudeToTrip latitude:float longitude:float
rails db:migrate
```

---Have our model tell Geocoder which method returns our object's geocodeable address. For our purposes (with AceHoppers input), we will use the :address method for returning similiar strings one would search on google maps, such as:
"714 Green St, Big Town, MO"
"Eiffel Tower, Paris, FR"
"Paris, TX, US"
---We need to define what parameters we want our "address" method to have add:---

```
def address
  [ city, state, country].compact.join(', ')
end
```

---Now that our fields are defined , we need to include Geocoder::Trip::Mongoid and we'll call it "geocoded_by"
```
geocoded_by :address
after_validation :geocode
```
---Some utility methods are also available, for example to look up coordinates of some location (like searching Google Maps)
```
Geocoder.coordinates("25 Main St, Cooperstown, NY")
```
---outputs [42.700149, -74.922767]---

--------------------------------------------------------------------------------------------------------------------------------------------
                                                        HAS_FRIENDSHIP
--------------------------------------------------------------------------------------------------------------------------------------------
---first we need to run a generator that will create a ``friendships`` migration---
```
rails generate has_friendship
```
---then run the migration---
```
rails db:migrate
```
---now all we need to do is add ``has_friendship`` to our ``User`` model!---
---for more info on how to use has_friendship look at the documentation at [has_friendship's github](https://github.com/sungwoncho/has_friendship)---

http://api.acehopper.com/v1/attraction/search?distance=50&zip=43210&query=&type=&sort=dist&key=0AUJEJ9UHQARHUPOG39997HX9K30GVLR0JS4KG1UBV1&secret=Q9YAIBODGO6MSIQYDOIFHACRKDG8KQAE9TT2VGOUGJC
