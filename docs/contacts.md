### Contacts

You can access contact data using the `InContactClient::Api#contacts method`

```ruby
api      = InContactClient::Api.new
contacts = api.contacts # => #<InContactClient::Contacts> instance
```

To get active Contacts:

```ruby
# Returns an InContactClient::Responses::ContactResponse

contact_response = contacts.active # => {
                                   #      "result_set" => {
                                   #        "business_unit_id" => "4592889",
                                   #        "last_poll_time"   => "2017-04-21T18:13:13.600Z",
                                   #        "active_contacts"  => [...]
                                   #      }
                                   #    }

# The active_contacts method contains array of contact data
# See InContact API for all available data

contact_response.active_contacts # => [
                                 #      {
                                 #        "agent_id"        => "1234568",
                                 #        "campaign_id"     => "111111",
                                 #        "campaign_name"   => "Test",
                                 #        "contact_dd"      => "111111111",
                                 #        "contact_start"   => "2017-04-21T18:12:53.123Z",
                                 #        "first_name"      => "Bill",
                                 #        "last_name"       => "Smith",
                                 #        "media_type_name" => "Call",
                                 #        ...
                                 #      },
                                 #      {
                                 #        "agent_id"        => "1234569",
                                 #        "campaign_id"     => "111112",
                                 #        "campaign_name"   => "Test",
                                 #        "contact_id"      => "111111112",
                                 #        "contact_start"   => "2017-04-21T18:12:53.123Z",
                                 #        "first_name"      => "Joe",
                                 #        "last_name"       => "Johnson",
                                 #        "media_type_name" => "Call",
                                 #        ...
                                 #      },
                                 #      ...
                                 #     ]

# Getting some data


contact = contact_response.active_contacts.first
contact["first_name"] # => "Bill"

# The model is an OpenStruct, so this will also work
contact.first_name    # => "Bill"
```


