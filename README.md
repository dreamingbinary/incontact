# InContactClient [![Build Status](https://travis-ci.org/customink/incontact_client.svg?branch=master)](https://travis-ci.org/customink/incontact_client)

This gem is a library for accessing [InContact's API](https://developer.incontact.com/API)


## Installation

Add this line to your application's Gemfile:

    gem 'incontact_client'

And then execute:

    $ bundle

## Configuration

The following environmental variables need to be defined. They will be used to set all configurations for the client
without the need to customize a YAML config file. An example configuration:

    export INCONTACT_TOKEN_URL=https://api.incontact.com/InContactAuthorizationServer/token
    export INCONTACT_APP_NAME=dashboard
    export INCONTACT_VENDOR_NAME=VeryGoodBusinessCo
    export INCONTACT_BUSINESS_UNIT_NUMBER=123456
    export INCONTACT_SCOPE="AdminApi RealTimeApi"            # Scope used for tokens. Leaving this blank will set scope to all APIs
    export INCONTACT_USERNAME=dashboard@verygoodbusiness.com # Admin user who can access all data
    export INCONTACT_PASSWORD=Apple123!

It is recommended to use [dotenv](https://github.com/bkeepers/dotenv) to set
your ENV variables.

## Documentation

[Api](docs/api.md)

[Agents](docs/agents.md)

[Agent Sessions](docs/agent_sessions.md)

[Contacts](docs/contacts.md)

