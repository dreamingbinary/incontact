### Agents

You can access agent data using the `InContact::Api#agents` method.

```ruby
api    = InContact::Api.new
agents = api.agents # => #<InContact::Agents> instance
```

To get all agents:

```ruby
# Returns an InContact::Responses::AgentResponse

agent_response = agents.all # => {
                            #      "business_unit_id" => 123467,
                            #      "last_poll_time"   => "2017-04-25T19:12:22.117Z",
                            #      "total_records"    => 1000,
                            #      "agents"           => [...]
                            #    }

agent_response.total_records  # => 1000
agent_response.agents         # Returns Array of agent data
```

To find one agent:

```ruby
# Returns an InContact::Responses::AgentResponse

agent_response = agents.find(1234567) # => {
                                      #      "business_unit_id" => 4592889,
                                      #      "last_poll_time"   => "2017-04-21T18:12:32.120Z",
                                      #      "agents"           => [...]
                                      #    }

# Returns the agents data
# See InContact API for available data
# The InContact APT returns data with keys in CamelCase
agent = agent_response.agents.first  # => {
                                     #      "agent_id"     => 1234567
                                     #      "user_name"    => "billsmith@business.com"
                                     #      "first_name"   => "Bill"
                                     #      "last_name"    => "Smith"
                                     #      "email_adress" => "billsmith@business.com"
                                     #      "is_active"    => true
                                     #      ...
                                     #    }

agent["first_name"]  # => "Bill"

# The model is an OpenStruct, so this will also work
agent.first_name     # => "Bill"
```
