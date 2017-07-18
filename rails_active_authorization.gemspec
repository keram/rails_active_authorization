$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'rails_active_authorization'
  s.version     = '0.0.1'
  s.authors     = ['Marek L']
  s.email       = ['nospam.keram@gmail.com']
  s.homepage    = 'https://github.com/keram/rails_active_authorization'
  s.summary     = 'Rails helpers for ActiveAuthorization.'
  s.description = 'Rails specific extensions of ActiveAuthorization.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '~> 5.1.1'
  s.add_dependency 'activeauthorization'

  s.add_development_dependency 'sqlite3'
end
