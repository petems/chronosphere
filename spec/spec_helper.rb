require 'chronosphere'
require 'shared/environment'

RSpec.configure do |config|
  # Pretty tests
  config.color_enabled = true

  config.order = :random
end

def project_path
  File.expand_path("../..", __FILE__)
end
