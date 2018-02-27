module InContactClient
  class Dispositions < TokenAuthenticatedResource
    def all
      connection.get("dispositions")
    end
  end
end
