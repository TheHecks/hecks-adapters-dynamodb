Gem::Specification.new do |s|
  s.name        = 'hecks-adapters-dynamodb'
  s.version     = '0.1.0'
  s.licenses    = ['MIT']
  s.summary     = 'A dynamodb adapter for hecksapp'
  s.description = 'Knows how to read a domain and write to dynamodb'
  s.authors     = ["Hecks DynamoDB Dev"]
  s.email       = 'support@the_good_guys.com'
  s.files       = Dir['lib/**/*.rb']
  s.homepage    = 'https://www.thehecks.com'

  s.add_dependency 'activerecord', '~> 6.0'
  s.add_dependency 'aws-sdk-dynamodb', '~> 1.34'
end
