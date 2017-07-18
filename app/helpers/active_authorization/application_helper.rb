module ActiveAuthorization
  module ApplicationHelper
    def authorization_locals(details)
      send(details.fetch(:type).dup.concat('_locals'),
           receiver: details.fetch(:receiver),
           seeker: details.fetch(:seeker),
           message_name: details.fetch(:message_name),
           details: details)
    end

    def authorizable_locals(receiver:, seeker:, message_name:, details:)
      roles = receiver.authorization_roles(seeker: seeker)
      receiver_class = receiver_class(receiver)

      finder = ActiveAuthorization::Finder.new(receiver_class)
      factory = ActiveAuthorization::Factory.new(finder)
      applied_authorizations = roles.map do |role|
        factory.build(seeker: seeker,
                      receiver: receiver,
                      role: role).class.name
      end
      {
        seeker: seeker,
        receiver: receiver,
        message_name: message_name,
        roles: roles,
        authorizations: {
          applied: applied_authorizations,
          scoped: finder.class.search_scope(receiver_class).map(&:name),
          all: ActiveAuthorization.tree.values.flatten.map(&:name)
        }
      }
    end

    def policy_locals(receiver:, seeker:, message_name:, details:)
      policy = details.fetch(:invoker)
      roles = policy.authorization_roles(seeker: seeker)
      receiver_class = receiver_class(receiver)

      finder = ActiveAuthorization::Finder.new(receiver_class)
      factory = ActiveAuthorization::Factory.new(finder)
      applied_authorizations = roles.map do |role|
        factory.build(seeker: seeker,
                      receiver: receiver,
                      role: role).class.name
      end

      {
        seeker: seeker,
        receiver: receiver,
        message_name: message_name,
        roles: roles,
        policy: policy.class.name,
        authorizations: {
          applied: applied_authorizations,
          scoped: finder.class.search_scope(receiver_class).map(&:name),
          all: ActiveAuthorization.tree.values.flatten.map(&:name)
        }
      }
    end

    private

    def receiver_class(receiver)
      {
        true => receiver,
        false => receiver.class
      }[receiver.is_a?(Class)]
    end
  end
end
