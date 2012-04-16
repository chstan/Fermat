require_relative 'modular_arithmetic'

module PrimalityTests
  #Miller Rabin expects an odd integer
  #greater than 3, but we will use a wrapper
  #anyway to handle bad cases and do repeated tests
  def PrimalityTests.InternalMillerRabin n,d    
    #Get a random test number to use
    a = rand(n-2) + 1 # We don't want zero, so we shift by one
    t = d
    y = ModularArithmetic.pow(a,t,n)
    while t != n-1 and y != 1 and y != n-1
      y = (y*y) % n
      t <<= 1
    end
    return false if y != n-1 and t & 1 == 0
    return true
  end

  #accepts an accuracy parameter
  def PrimalityTests.MillerRabin n, a
      weeder = Weeder n
      if weeder != nil
        return weeder
      end

      #remove all factors of two from n-1
      #this is a helper that gets passed to
      #InternalMillerRabin
      d = n-1
      d >>= 1 while d & 1 == 0


      (0..a).each do
        if not InternalMillerRabin n, d
          return false
        end
      end

      return true
  end

  #all purpose primality test, based on circumstances,
  #this method will call the appropriate background test
  #in reality, this is all the end user ever needs
  def PrimalityTests.IsPrime? n
    #probabilistic, but good enough for anything
    return MillerRabin n, 10
  end

  #Weeder test for very simple cases
  def PrimalityTests.Weeder n
    #return true if n=2 or n=3
    return true if n == 2 or n == 3
    #not a prime if n=1 or n is even
    return false if n == 1 or n & 1 == 0
    return false if n % 6 != 1 and n % 6 != 5
    #the weeder was indeterminate
    return nil
  end
end

class Integer
  def isPrime?
    return PrimalityTests.IsPrime? self
  end
end
