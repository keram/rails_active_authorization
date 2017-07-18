# frozen_string_literal: true

module ActiveAuthorization
  module ControllerConcern
    module InstanceMethods
      def model_authorize!(receiver:, seeker:, message_name:)
        receiver.authorize!(seeker: seeker, message_name: message_name)
      end

      def set_authorization_policy(seeker:, receiver_class:)
        @authorization_policy =
          Policy.new(
            seeker: seeker,
            receiver_class: receiver_class
          )
      end

      def policy_authorize!(receiver:, message_name:)
        @authorization_policy.authorize!(receiver: receiver,
                                         message_name: message_name)
      end

      def access_denied(exception)
        respond_to :html, :json

        exception.details[:type] = exception.details.fetch(:type).to_s

        render(
          authorization_config
          .exception_render
          .merge(locals:  {
                   details: exception.details
                 },
                 status: :forbidden)
        )
      end

      def authorization_config
        ActiveAuthorization::Engine.configuration
      end
    end
  end
end
