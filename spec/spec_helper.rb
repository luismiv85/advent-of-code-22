require 'pathname'
ROOT_PATH = Pathname.new(File.dirname(__FILE__))
$:.unshift ROOT_PATH

RSpec.configure do |config|
  config.color = true
end