require 'spec_helper'

describe PrimalityTests do
  it "should say primes are prime" do
    2.isPrime?.should be true
    3.isPrime?.should be true
    5.isPrime?.should be true
    823.isPrime?.should be true
    8675309.isPrime?.should be true
  end
  
  it "should say composites are not prime" do
    4.isPrime?.should be false
    6.isPrime?.should be false
    18.isPrime?.should be false
    1823198.isPrime?.should be false
  end
  
  it "should not choke on large primes" do
    5915587277.isPrime?.should be true
    48112959837082048697.isPrime?.should be true
    64495327731887693539738558691066839103388567300449.isPrime?.should be true
  end
  
  it "should handle the special cases 0 and 1" do
    1.isPrime?.should be false
    0.isPrime?.should be false
  end
  
  # This is a convention
  # the prime number 7 is associate to -7 via the unit -1
  # you could just as well say that -7 is prime, but we will not
  it "should handle negative numbers" do
    -4.isPrime?.should be false
    -7.isPrime?.should be false
  end
  
  pending "Performance tests"
end

describe Prime do
  it "should generate sequential primes" do
    pending "sequential prime tests"
  end
  
  it "should generate the sought after primes" do
    pending "random seek prime tests"
  end
  
  it "should be a singleton" do
    pending "make sure you can't make two instances of Prime"
  end
end