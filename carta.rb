class Carta

  attr_accessor :number, :color

  def initialize(number, color)
    if !((number >= 1 && number <= 13) && (['C','D','T','E'].include?(color)))
      raise ArgumentError, "El numero o pinta ingresada no es valido"
    end
    @number = number
    @color = color
  end
  
  def to_s
    return "#{@number}-#{@color}"
  end
end
