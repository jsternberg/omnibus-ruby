# Why isn't this already required in omnibus?
require 'rake/dsl_definition'

require 'omnibus'

module Omnibus
  module RSpec

    SPEC_DATA = File.expand_path(File.join(File.dirname(__FILE__), "data"))

    def software_path(name)
      File.join(SPEC_DATA, "software", "#{name}.rb")
    end

    def overrides_path(name)
      File.join(SPEC_DATA, "overrides", "#{name}.overrides")
    end
    
  end
end

RSpec.configure do |config|
  config.include Omnibus::RSpec
  config.filter_run :focus => true
  config.run_all_when_everything_filtered = true
  config.treat_symbols_as_metadata_keys_with_true_values = true
end

