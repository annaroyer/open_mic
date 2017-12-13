class Joke
  attr_reader :id,
              :question,
              :answer
  def initialize(joke)
    @id = joke[:id]
    @question = joke[:question]
    @answer = joke[:answer]
  end

end
