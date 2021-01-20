require_relative "carta.rb"

class Baraja
  attr_accessor :cards
  def initialize
    @cards = []
    color = ["C","D","T","E"]
    color.each do |pinta|
      13.times do |number|
        @cards.push(Carta.new((number+1), pinta))
      end
    end
    return @cards
  end

  def barajar 
    @cards = @cards.shuffle
  end

  def sacar
    if @cards.size > 0
      @card = (@cards.reverse).pop
      @cards.delete(@card)
      return @card
    else
      return "No quedan cartas en el mazo"
    end
  end

  def repartir_mano
    @hand = []
    5.times do |x|
      @hand.push(@cards[x])
    end
    return @hand
  end

end

a = Baraja.new

a.barajar
a.repartir_mano

53.times do
  puts a.sacar
end

