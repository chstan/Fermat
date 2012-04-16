

module ModularArithmetic
  #A module defining some helpful properties from number theory
  #and modular arithmetic. In particular, this is a dependency
  #for many of the primality tests in the module PrimalityTests
  #and by hierarchy, for the Prime class.

  #Future features
  # => Fermat's Little Theorem

  #Bitshifts power to avoid extra arithmetic
  def ModularArithmetic.pow(base, power, mod)
    result = 1
    raise "Invalid modulo" unless mod != 0
    while power > 0
      #Not the fastest modular arithmetic, but better
      #than naive powering
      result = (result*base) % mod if power & 1 == 1
      base = (base * base) % mod
      power >>= 1;
    end
    result % mod
  end
end

class Integer
  def modPow(power, mod)
    return ModularArithmetic.pow(self, power, mod)
  end
end