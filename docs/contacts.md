### Contacts

You can access contact data using the `InContactClient::Api#contacts method`

```ruby
api = InContactClient::Api.new
contacts = api.contacts # => #<InContactClient::Contacts> instance
```

To get active Contacts:

```ruby
# Returns an InContactClient::Responses::ContactResponse

contact_response = contacts.active # => {
                                   #      "resultSet" => {
                                   #        "businessUnitId" => "4592889",
                                   #        "lastPollTime"   => "2017-04-21T18:13:13.600Z",
                                   #        "activeContacts" => [...]
                                   #      }
                                   #    }

# The active_contacts method contains array of contact data
# See InContact API for all available data

contact_response.active_contacts # => [
                                 #      {
                                 #        "agentId"       => "1234568",
                                 #        "campaignId"    => "111111",
                                 #        "campaignName"  => "Test",
                                 #        "contactId"     => "111111111",
                                 #        "contactStart"  => "2017-04-21T18:12:53.123Z",
                                 #        "firstName"     => "Bill",
                                 #        "lastName"      => "Smith",
                                 #        "mediaTypeName" => "Call",
                                 #        ...
                                 #      },
                                 #      {
                                 #        "agentId"       => "1234569",
                                 #        "campaignId"    => "111112",
                                 #        "campaignName"  => "Test",
                                 #        "contactId"     => "111111112",
                                 #        "contactStart"  => "2017-04-21T18:12:53.123Z",
                                 #        "firstName"     => "Joe",
                                 #        "lastName"      => "Johnson",
                                 #        "mediaTypeName" => "Call",
                                 #        ...
                                 #      },
                                 #      ...
                                 #     ]

# Getting some data


contact = contact_response.active_contacts.first
contact["firstName"] # => "Bill"

# The model is a Hashie::Mash, so this will also work
contact.firstName    # => "Bill"
```


