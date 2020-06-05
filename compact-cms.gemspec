Gem::Specification.new do |s|
  s.name = %q{compact-cms}
  s.version = '0.0.09'
  s.date = %q{2020-05-26}
  s.summary = "compact content management system"
  s.files = [
    'lib/general-form.rb'
  ]
  s.require_paths = ['lib']
  [
    'activerecord-import',
    'active_flag',
    'select2-rails',
    'jquery-ui-rails',
    'nokogiri'
  ].each { |dep_name| s.add_runtime_dependency(dep_name) }
  s.authors = 'elias'
end
