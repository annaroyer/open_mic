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

  def test_telling_jokes_to_another_user_gives_that_user_a_new_joke
    joke = Joke.new({ id: 1,
                    question: "Why did the strawberry cross the road?",
                    answer: "Because his mother was in a jam."})
    sal = User.new("Sal")
    ali = User.new("Ali")
    sal.learn(joke)

    assert ali.jokes.empty?

    sal.tell(ali, joke)
    result = ali.jokes

    assert_equal [joke], result
    assert_equal 1, result.count
  end

  def test_perform_routine_lets_user_share_all_jokes_at_once
    joke_1 = Joke.new({ id: 1,
                    question: "Why did the strawberry cross the road?",
                    answer: "Because his mother was in a jam."})

    joke_2 = Joke.new({ id: 2,
                        question: "How do you keep a lion from charging?",
                        answer: "Take away its credit cards."})

    ilana = User.new("Ilana")
    josh = User.new("Josh")
    ilana.learn(joke_1)
    ilana.learn(joke_2)
    ilana.perform_routine_for(josh)

    result = josh.jokes

    assert_equal [joke_1, joke_2], result
    assert_equal 2, result.count
  end
end
