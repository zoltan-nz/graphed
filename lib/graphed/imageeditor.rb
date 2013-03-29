module Graphed
  class ImageEditor < Array

    def initialize(m, n, default_color = 'O')
       super([Array.new(m, default_color)]*n) #Create an M * N 2 dimensional matrix with 'white'
       @cols = m
       @rows = n
    end

    alias :I :initialize

  public

    def self.I(m,n)
      ImageEditor.new(m,n)
    end
  end
end