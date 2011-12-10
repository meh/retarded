Gem::Specification.new {|s|
	s.name         = 'retarded'
	s.version      = '0.0.3'
	s.author       = 'meh.'
	s.email        = 'meh@paranoici.org'
	s.homepage     = 'http://github.com/meh/retarded'
	s.platform     = Gem::Platform::RUBY
	s.summary      = 'Simple lazy object implementation'
	s.files        = Dir.glob('lib/**/*.rb')
	s.require_path = 'lib'

	s.add_dependency 'blankslate'

	s.add_development_dependency 'rake'
	s.add_development_dependency 'rspec'
}
