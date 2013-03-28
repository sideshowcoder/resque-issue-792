class Natter
  @queue = :foo

  def self.perform
    puts 'natter...'
    sleep 1
    puts 'awake!'
  end
end

