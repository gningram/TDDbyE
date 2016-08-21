require 'minitest/autorun'
require 'minitest/reporters'
require_relative 'money'

Minitest::Reporters.use!

class MoneyTest < Minitest::Test
  def test_multiplication
    five = Money.dollar 5
    assert_equal Money.dollar(10), five.times(2)
    assert_equal Money.dollar(15), five.times(3)
  end

  def test_equality
    assert Money.dollar(5) == Money.dollar(5)
    assert Money.dollar(5) != Money.dollar(6)
    assert Money.franc(5) != Money.dollar(5)
  end

  def test_currency
    assert_equal 'USD', Money.dollar(1).currency
    assert_equal 'CHF', Money.franc(1).currency
  end
end