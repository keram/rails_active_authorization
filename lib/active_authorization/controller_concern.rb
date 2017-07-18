# frozen_string_literal: true

require 'active_authorization/controller_concern/class_methods'
require 'active_authorization/controller_concern/instance_methods'

module ActiveAuthorization
  module ControllerConcern
    def self.included(klass)
      klass.extend ClassMethods
      klass.include InstanceMethods
    end
  end
end
