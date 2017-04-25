### Agents

You can access agent data using the `InContactClient::Api#agents` method.

```ruby
api    = InContactClient::Api.new
agents = api.agents # => #<InContactClient::Agents> instance
```

To get all agents:

```ruby
# Returns an InContactClient::Responses::AgentResponse

agent_response = agents.all # => {
                            #      "businessUnitId" => 123467,
                            #      "lastPollTime"   => "2017-04-25T19:12:22.117Z",
                            #      "totalRecords"   => 1000,
                            #      "agents"         => [...]
                            #    }

agent_response.total_records  # => 1000
agent_response.agents         # Returns Array of agent data
```

To find one agent:

```ruby
# Returns an InContactClient::Responses::AgentResponse

agent_response = agents.find(1234567) # => {
                                      #      "businessUnitId" => 4592889,
                                      #      "lastPollTime"   => "2017-04-21T18:12:32.120Z",
                                      #      "agents"         => [...]
                                      #    }

# Returns the agents data
# See InContact API for available data
# The InContact APT returns data with keys in CamelCase
agent = agent_response.agents.first  # => {
                                     #      "agentId"     => 1234567
                                     #      "userName"    => "billsmith@business.com"
                                     #      "firstName"   => "Bill"
                                     #      "lastName"    => "Smith"
                                     #      "emailAdress" => "billsmith@business.com"
                                     #      "isActive"    => true
                                     #      ...
                                     #    }

agent["firstName"]  # => "Bill"

# The model is a Hashie::Mash, so this will also work
agent.firstName     # => "Bill"
```
