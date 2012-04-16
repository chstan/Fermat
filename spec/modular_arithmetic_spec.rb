require 'spec_helper'

describe ModularArithmetic do
  describe "Modular exponentiation" do
    it "should handle mod 1" do
      6.modPow(5, 1).should be 0
      1.modPow(12, 1).should be 0
      5.modPow(0, 1).should be 0
    end
    
    it "should handle mod 0" do
      lambda { 3.modPow(6, 0) }.should raise_error
      lambda { 2.modPow(83, 0) }.should raise_error
      lambda { -1.modPow(7, 0) }.should raise_error
      lambda { 19.modPow(8, 0) }.should raise_error
    end
    
    it "should produce valid results for a positive modulus" do
      6.modPow(5, 4).should be 0
      29.modPow(17, 324).should be 149
      6.modPow(12387, 89).should be 63
      892.modPow(75, 18).should be 10
    end
    
    it "should produce valid results for a negative modulus" do
      16.modPow(51, -7).should be -6
      3.modPow(111, -24).should be -21
      91.modPow(382, -21389).should be -6422
      137.modPow(7612, -4012).should be -1631
    end
  end
  
  pending "Write modular arithmetic specs."
  
end