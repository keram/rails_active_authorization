module ActiveAuthorization
  class Engine < ::Rails::Engine
    isolate_namespace ActiveAuthorization

    class Configuration
      attr_accessor :exception_render
    end

    class << self
      attr_accessor :configuration

      def configure
        yield(configuration)
      end
    end

    @configuration = Configuration.new
    configure do |config|
      config.exception_render = {
        template: 'active_authorization/forbidden'
      }
    end

    initializer 'preload authorizations' do
      [Rails.root.join('app'), Rails.root.join('app', 'models')]
        .select { |path| Dir.exist? File.join(path, 'authorizations') }
        .map { |path| File.join(path, 'authorizations', '**', '*.rb') }
        .flat_map { |path| Dir.glob(path) }
        .each { |file| require(file) }
    end
  end
end
