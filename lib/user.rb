require 'csv'
class User
  attr_reader   :name
  attr_accessor :jokes

  def initialize(name)
    @name = name
    @jokes = []
  end

  def learn(joke)
    @jokes << joke
  end

  def tell(user, joke)
    user.jokes << joke if @jokes.include?(joke)
  end

  def perform_routine_for(user)
    @jokes.each do |joke|
      user.jokes << joke
    end
  end

  def learn_routine(joke_manual)
    CSV.foreach(joke_manual, headers:true) do |row|
      joke = {}
      joke[:id] = row[0]
      joke[:question] = row[1]
      joke[:answer] = row[2]
      learn(joke)
    end
  end
end
