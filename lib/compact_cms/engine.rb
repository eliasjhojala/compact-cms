module CompactCms
  class Engine < Rails::Engine
  end
  
  class << self
    mattr_accessor :sites

    # add default values of more config vars here
  end

   # this function maps the vars from your app into your engine
   def self.setup(&block)
     yield self
   end
end
