require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/joke'
require './lib/user'

class UserTest < Minitest::Test
  def test_it_exists
    sal = User.new("Sal")

    assert_instance_of User, sal
  end

  def test_it_has_a_name
    sal = User.new("Sal")

    assert_equal "Sal", sal.name
  end

  def test_it_can_have_another_name
    ali = User.new("Ali")

    assert_equal "Ali", ali.name
  end

  def test_it_starts_with_no_jokes
    sal = User.new('Sal')

    result = sal.jokes

    assert_equal [], result
  end

  def test_learn_joke_gives_it_a_new_joke
    sal = User.new('Sal')
    joke = Joke.new({ id: 1,
                      question: "Why did the strawberry cross the road?",
                      answer: "Because his mother was in a jam."})
    sal.learn(joke)

    result = sal.jokes

    assert_equal 1, result.length
    assert_equal [joke], result
  end
end
