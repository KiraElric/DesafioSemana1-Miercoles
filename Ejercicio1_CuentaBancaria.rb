class Usuario

  def initialize(name, bank_acounts)
    @name = name
    @bank_acounts = bank_acounts
  end

  def saldo_total
    @total_balance = 0
    @bank_acounts.each do |bank_acount|
      @total_balance += bank_acount.balance
    end
    return @total_balance
  end
end

class CuentaBancaria
  attr_accessor :balance

  def initialize(bank, number, balance = 0)
    if bank.class != String || number.class != String
      raise ArgumentError, "El tipo de dato ingresado no es correcto"
    end
    @bank = bank
    @number = number
    @balance = balance
  end

  def transferir(amount, other_acount)
    if amount <= @balance
      @balance -= amount
      other_acount.balance += amount
    else
      return "La transacción no es posible debido a que no se cuenta con el saldo suficiente en la cuenta para realizarla"
    end
  end
end

c1 = CuentaBancaria.new("Banco Chile","123456",5000)
c2 = CuentaBancaria.new("Banco BCI","9837483",5000)

c1.transferir(5000,c2)

puts c1.balance
puts c2.balance

c3 = CuentaBancaria.new("Banco Estado","4578349",3000)

u = Usuario.new("Lissette",[c1,c2,c3])

puts u.saldo_total