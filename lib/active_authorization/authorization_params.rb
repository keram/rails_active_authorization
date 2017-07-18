# frozen_string_literal: true

# :reek:Attribute:

module ActiveAuthorization
  class AuthorizationParams
    attr_writer :seeker, :message_name, :receiver

    def initialize(seeker:, message_name:, receiver:)
      @seeker = seeker
      @message_name = message_name
      @receiver = receiver
    end

    def to_hash
      {
        seeker: @seeker,
        message_name: @message_name,
        receiver: @receiver
      }
    end
  end
end
