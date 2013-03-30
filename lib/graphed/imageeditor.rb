module Graphed
  class ImageEditor < Array

    attr_reader :cols, :rows

    def initialize(m, n,  default_color = 'O')
      super(n) {Array.new(m){default_color}} #Create an M * N 2 dimensional matrix with 'white'
      @cols = m
      @rows = n
    end

    def valid_on?(x,y)
      x>0 && y>0 && x<=@cols && y<=@rows ? true : false
    end

    def set(x, y, color)
      self[y-1][x-1] = color
    end

    def get(x, y)
      self[y-1][x-1]
    end

    def vertical(x, y1, y2, color)
      (y1..y2).each{|y| set(x, y, color)}
    end

    def horizontal(x1, x2, y, color)
      (x1..x2).each{|x| set(x, y, color)}
    end

    #This recursive algorithm from Ruby Forum: http://www.ruby-forum.com/topic/184567
    def flood_fill(x, y, target_color, replacement_color )
      return unless valid_on?(x,y)
      #puts "x=#{x}, y=#{y}, target_color=#{target_color}, replacement_color=#{replacement_color}, get=#{get(x,y)}"
      #show; sleep(0.2)

      return if get(x,y) != target_color
      return if get(x,y) == replacement_color

      set(x, y, replacement_color)
      flood_fill(x+1, y, target_color, replacement_color)
      flood_fill(x-1, y, target_color, replacement_color)
      flood_fill(x, y+1, target_color, replacement_color)
      flood_fill(x, y-1, target_color, replacement_color)
    end

    def fill(x,y, color)
      flood_fill(x, y, get(x,y), color)
    end

    def show
      puts "\n=>"
      each {|line| puts line.join}
      puts "\n"
    end

    alias :L :set
    alias :V :vertical
    alias :H :horizontal
    alias :F :fill
    alias :S :show

  end
end