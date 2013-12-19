require 'couchbase'
require 'httparty'
require 'pp'
require 'map'

class SimpleDot < Map
  def default
    self["default_bucket"]
  end  
end

class Connections
  @@buckets = []
  @@connections = SimpleDot.new
  
  def initialize(options = { quiet: true, environment: :production })
    reload(options)
    
  end
  
  def buckets
    @@buckets
  end
  
  def connections
    @@connections
  end
  
  def reload(options)
    @@buckets = []
    @@connections = SimpleDot.new
    
    r = HTTParty.get("http://#{Yetting.couchbase_servers[0]}:8091/pools/default/buckets")
    buckets = JSON.parse(r.body)

    buckets.each do |bucket|
      b = bucket["name"]
      @@buckets << b
      opt = { bucket: b, password: bucket["saslPassword"] }
      if b == "default"
        @@connections[:default_bucket] = Couchbase.new(opt.merge(options))        
      else
        @@connections[b] = Couchbase.new(opt.merge(options))
      end
    end
    
    
    puts "========> Buckets"
    pp @@buckets
    puts "========> Connections (Views from #{options[:environment]} mode)"
    pp @@connections
    puts    
  end
end