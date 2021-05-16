# Country Rest API
I did not include the currency of the countries as I was not able to get the data in an easy way, and didn't want to waist time on something where I can still demonstrate that am able to do what is required.

Meta Info:

- Ruby 2.7.0
- Rails 6.0.3.4
- Sqlite DataStore
#

Getting Up and Running:
- $ bundle i
##
- (DB commands optional as db is included)
- $ rake db:migrate
- $ rails db:seed
##
- rails s
#

# API Endpoints
(Postman Collection included:)
/countries API.postman_collection.json
```
#1 - List Countries
- GET http://localhost:3000/api/v1/countries
- Optional Query Parameter: alpha2
- Optional Query Parameter: alpha3

#2 - Soft Delete Country
- DELETE http://localhost:3000/api/v1/country
- Required Query Parameter: alpha2

#3 - Un-Delete Country (Technically an Update)
- PUT http://localhost:3000/api/v1/country
- Required Query Parameter: alpha2
```
#

# Unit Tests
- $ bin/rails test

Fixtures file /test/fixtures.yml (not working with actual data)

- 1 - testing first/only entry
- 2 - testing last entry (multiple results)
- 3 - testing soft deleting South Afica
- 4 - testing soft un-deleting South Afica
