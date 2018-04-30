module Mf
  module PublicApi
    # Math infix operators
    def +(b)   proc { |a| a + b  } end
    def -(b)   proc { |a| a - b  } end
    def *(b)   proc { |a| a * b  } end
    def /(b)   proc { |a| a / b  } end
    def %(b)   proc { |a| a % b  } end
    def **(b)  proc { |a| a ** b } end

    # Comparators
    def >(b)   proc { |a| a > b  } end
    def >=(b)  proc { |a| a >= b } end
    def <(b)   proc { |a| a < b  } end
    def <=(b)  proc { |a| a <= b } end
    def <=>(b) proc { |a| a <=> b } end
    def ==(b)  proc { |a| a == b  } end

    # Triple Equals black magic for pre-2.6
    def ===(b) proc { |a| b === a } end

    # Bit Operators
    def |(b)   proc { |a| a | b  } end
    def &(b)   proc { |a| a & b  } end
    def >>(b)  proc { |a| a >> b } end
    def <<(b)  proc { |a| a << b } end
  end
end
