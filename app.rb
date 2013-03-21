require 'resque'

class Napper
  @queue = :not_queue

  def self.perform
    puts 'sleeping...'
    sleep 5
    puts 'awake!'
  end
end

class App
  def call(env)
    Resque.enqueue(Napper)
    [200, {"Content-Type" => "text/html"}, ["Queuing Motherfucker!"]]
  end
end