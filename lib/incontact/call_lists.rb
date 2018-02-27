module InContact
  class CallLists < TokenAuthenticatedResource
    def all
      connection.get("lists/call-lists")
    end

    def find(call_list_id)
      connection.get("lists/call-lists/#{call_list_id}")
    end

    def upload_file(call_list_id, body)
      connection.post("lists/call-lists/#{call_list_id}/upload", body)
    end

    def create(body)
      connection.post("lists/call-lists", body)
    end
  end
end
