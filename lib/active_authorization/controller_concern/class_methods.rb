# frozen_string_literal: true

module ActiveAuthorization
  module ControllerConcern
    module ClassMethods
      private

      def authorize_before_action!(**filter_options, &block)
        before_action(**filter_options) do
          params = AuthorizationParams.new(
            seeker: current_user,
            message_name: action_name,
            receiver: nil
          )

          instance_exec(params, &block)
          model_authorize!(**params)
        end
      end
    end
  end
end
