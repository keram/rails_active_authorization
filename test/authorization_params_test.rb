# frozen_string_literal: true

require 'test_helper'

module ActiveAuthorization
  class AuthorizationParamsTest < Minitest::Test
    def test_implicit_conversion_to_hash
      subject = AuthorizationParams.new(
        seeker: 'current_user',
        receiver: 'receiver',
        message_name: 'action name'
      )

      dummy = OpenStruct.new(**subject)

      assert_equal 'current_user', dummy.seeker
      assert_equal 'receiver', dummy.receiver
      assert_equal 'action name', dummy.message_name
    end
  end
end
