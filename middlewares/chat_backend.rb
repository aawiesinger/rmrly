require 'faye/websocket'
require 'json'

module Chat
  class ChatBackend
    KEEPALIVE_TIME = 15 # in seconds

    def initialize(app)
      @app     = app
      @clients = []
    end
    
    def call(env)
      if Faye::WebSocket.websocket?(env)
        ws = Faye::WebSocket.new(env, nil, {ping: KEEPALIVE_TIME })

        ws.on :open do |event|
          p [:open, ws.object_id]
          @clients << ws
        end  
        
        ws.on :message do |event|
          hash = JSON.parse event.data
          to_user = User.find(hash["to_user"]).name
          from_user = User.find(hash["from_user"]).name
          body = hash["text"]
          Message.create!(to_user: to_user, from_user: from_user, body: body)
          hash["from_user"] = from_user
          new_data = hash.to_json
          p [:message, new_data]
          clients_to_send = @clients.select { |client| client.url =~ /.*chat\/#{hash["from_user"]}\/#{hash["to_user"]}/ or client.url =~ /.*chat\/#{hash["to_user"]}\/#{hash["from_user"]}/ }
          clients_to_send.each {|client| client.send(new_data) }
        end
        
        ws.on :close do |event|
          p [:close, ws.object_id, event.code, event.reason]
          @clients.delete(ws)
          ws = nil
        end
        
        ws.rack_response
      else
        @app.call(env)
      end
    end
  end
end