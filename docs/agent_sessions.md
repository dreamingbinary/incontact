### Agent Sessions

You can access agent session data using the `InContactClient::Api#agent_session` method.

```ruby
api            = InContactClient::Api.new
agent_sessions = api.agent_sessions # => #<InContactClient::AgentSessions> instance
```

To join a session:

```ruby
# Pass in the Agent ID
# Returns an InContactClient::Responses::AgentSessionRespose

agent_session_response = agent_sessions.join_agent_session(1234567) # => {
                                                                    #      "sessionId" => 12346
                                                                    #    }
agent_session_response.session_id # => 123456
```

To mask and unmask a call:

```ruby
# Pass in session ID and contact ID

session_id = 1234567
contact_id = 7564313

agent_sessions.mask_call(session_id, contact_id)  # => nil

agent_session.unmask_call(session_id, contact_id) # => nil
```
