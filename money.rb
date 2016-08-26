require_relative 'expression'

class Money < Expression

  attr_reader :currency

  def initialize (amount, currency)
    @amount = amount
    @currency = currency
  end

  def == (money)
    @amount == money.amount && @currency == money.currency
  end

  def times (multiplier)
    Money.new (@amount * multiplier), @currency
  end

  def plus (addend)
    Sum.new self, addend
  end

  def self.dollar(amount)
    Money.new amount, 'USD'
  end

  def self.franc(amount)
    Money.new amount, 'CHF'
  end

  def inspect
    "#{@amount} #{@currency}"
  end

  protected

  attr_reader :amount
  @amount = 0
  @currency = ''

end
