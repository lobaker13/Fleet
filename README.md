Rails: version - 5.1.2
APIs: 'AceHopper', 'Google Calendar'
Gems: 'Devise', 'Paperclip', 'Geocoder', 'has_friendship'

```
rails new travel_batch
```
--------------------------------------------------------------------------------------------------------------------------------------------
                            GOOGLE CALENDAR API
--------------------------------------------------------------------------------------------------------------------------------------------
---Create a new project, sign in to the google API console and create new project, after you create it there will be a small wait until it is available to choose. Just look for the notifications icon on the top right. Afterwards, go to the library and pick the API you want/need and click "enable". For us, its the Google Calendar API---

---Next, name the application "Agency Week" or w/e ,you want, in the tab that says "OAuth consent screen". This is what the users will see when they authenticate and sign in with Google---



---Obtained our client credentials by clicking on the "create credentials" tab then "OAuthclient ID". Application type will be "Web application" and our name again will just be "Agency Week" for now, this will produce a ClientId and a Client secret, which is used in our app to access the API---
---NOTE--- add a redirect URI to the list of "Authorized redirect URIs". An authorised redirect URI is the resource/route in your application that Google redirects back to after a user grants access, and needs to be specified here. The exact value depends on what port your development web server is running on and what path/route you want to use for the callback, we did https://localhost:3000/callback for development. Make sure the "OOB_URI" and the "Authorized redirect URIs" on your credentials section of your API manager match---



---Turned on the Google Calendar , obtained key and client id. Afterwards, downloaded JSON file and labeled it "client_secret.json" per google.---

---Storing our client credentials. In order to keep them private, we will store them in our config/secrets.yml file---

---Install Google client library---
```
gem install google-api-client
```

---Set up the sample - create a file named quickstart.rb in your working directory.---
```
touch quickstart.rb
```

---Copy in the following code (per Google) and enter it into quickstart.rb---


```
require 'google/apis/calendar_v3'
require 'googleauth'
require 'google/api_client/client_secrets'
require 'googleauth/stores/file_token_store'

require 'fileutils'

OOB_URI = 'urn:ietf:wg:oauth:2.0:oob'
APPLICATION_NAME = 'Google Calendar API Ruby Quickstart'
CLIENT_SECRETS_PATH = 'client_secret.json'
CREDENTIALS_PATH = File.join(Dir.home, '.credentials',
                             "calendar-ruby-quickstart.yaml")
SCOPE = Google::Apis::CalendarV3::AUTH_CALENDAR_READONLY

##
# Ensure valid credentials, either by restoring from the saved credentials
# files or intitiating an OAuth2 authorization. If authorization is required,
# the user's default browser will be launched to approve the request.
#
# @return [Google::Auth::UserRefreshCredentials] OAuth2 credentials
def authorize
  FileUtils.mkdir_p(File.dirname(CREDENTIALS_PATH))

  client_id = Google::Auth::ClientId.from_file(CLIENT_SECRETS_PATH)
  token_store = Google::Auth::Stores::FileTokenStore.new(file: CREDENTIALS_PATH)
  authorizer = Google::Auth::UserAuthorizer.new(
    client_id, SCOPE, token_store)
  user_id = 'default'
  credentials = authorizer.get_credentials(user_id)
  if credentials.nil?
    url = authorizer.get_authorization_url(
      base_url: OOB_URI)
    puts "Open the following URL in the browser and enter the " +
         "resulting code after authorization"
    puts url
    code = gets
    credentials = authorizer.get_and_store_credentials_from_code(
      user_id: user_id, code: code, base_url: OOB_URI)
  end
  credentials
end

# Initialize the API
service = Google::Apis::CalendarV3::CalendarService.new
service.client_options.application_name = APPLICATION_NAME
service.authorization = authorize

# Fetch the next 10 events for the user
calendar_id = 'primary'
response = service.list_events(calendar_id,
                               max_results: 10,
                               single_events: true,
                               order_by: 'startTime',
                               time_min: Time.now.iso8601)

puts "Upcoming events:"
puts "No upcoming events found" if response.items.empty?
response.items.each do |event|
  start = event.start.date || event.start.date_time
  puts "- #{event.summary} (#{start})"
end
```

---Run the sample---
```
ruby quickstart.rb
```
---The first time you run the sample, it will prompt you to authorize access:

The sample will attempt to open a new window or tab in your default browser. If this fails, copy the URL from the console and manually open it in your browser.

If you are not already logged into your Google account, you will be prompted to log in. If you are logged into multiple Google accounts, you will be asked to select one account to use for the authorization.
Click the Accept button.
The sample will proceed automatically, and you may close the window/tab.---


---Scopes for this project---
https://www.googleapis.com/auth/calendar	Manage your calendars
https://www.googleapis.com/auth/calendar.readonly	View your calendars

---Create a controller---
```
rails g controller Calendar
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
