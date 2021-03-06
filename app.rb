require 'resque'
require_relative 'natter'

class Napper
  @queue = :foo

  def self.perform
    puts 'sleeping...'
    sleep 1
    puts 'awake!'
  end
end

class App
  def call(env)
    Resque.enqueue(Napper)
    Resque.enqueue(Natter)
    [200, {"Content-Type" => "text/html"}, ["Failed workers: #{Resque.info[:failed]}"]]
  end
end
