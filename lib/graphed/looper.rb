require 'readline'
require 'pp'

module Graphed
  class Looper

    #Processing commands with regex
    def self.execute_command(command, image)
      case command
        when /^I (\d+) (\d+)/
          m = $1.to_i
          n = $2.to_i
          image = ImageEditor.new(m, n)
        when /^help/
          help
        else
          unless image[0].nil? #Following commands valid only if object is created.
            case command
              when /^C/
                image = ImageEditor.new(image.cols, image.rows)
              when /^L (\d+) (\d+) (.+$)/
                x = $1.to_i
                y = $2.to_i
                c = $3
                image.valid_on?(x,y) ? image.L(x, y, c) : puts("Sorry, wrong parameters.")
              when /^V (\d+) (\d+) (\d+) (.+$)/
                x = $1.to_i
                y1 = $2.to_i
                y2 = $3.to_i
                c = $4
                (y1<=y2) && image.valid_on?(x, y1) && image.valid_on?(x, y2) ? image.V(x, y1, y2, c) : puts("Sorry, wrong parameters.")
              when /^H (\d+) (\d+) (\d+) (.+$)/
                x1 = $1.to_i
                x2 = $2.to_i
                y = $3.to_i
                c = $4
                (x1<=x2) && image.valid_on?(x1, y) && image.valid_on?(x2,y) ? image.H(x1, x2, y, c) : puts("Sorry, wrong parameters.")
              when /^F (\d+) (\d+) (.+$)/
                x = $1.to_i
                y = $2.to_i
                c = $3
                image.valid_on?(x, y) ? image.F(x, y, c) : puts("Sorry, wrong parameters.")
              when /^S/
                image.S
            else
                puts "Sorry, try again. Type 'help' to see all commands."
            end
          else
            puts "Tip: create an image first with 'I'. Example: I 9 7"
          end
      end
      image
    rescue
      puts "Exception: Sorry, something happened, please try again."
      return image
    end

    #Help message and instruction
    def self.help
      print <<-EOF
This program simulates a simple interactive graphical editor.

Available commands:
I M N       Create a new MxN image with all pixels coloured white(O).
C           Clears the table, setting all pixels to white (O).
L X Y C     Colours the pixel (X,Y) with colour C.
V X Y1 Y2 C Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
H X1 X2 Y C Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
F X Y C     Fill the region R with the colour C. R is defined as: Pixel (X,Y) belongs to R. Any other pixel which is the same colour as (X,Y) and shares a common side with any pixel in R also belongs to this region.
S           Show the contents of the current image
X           Terminate the session
help        Show this help

      EOF
    end

    #Good for debugging
    def self.automata(image)
      image = execute_command('I 15 10', image)
      image = execute_command('V 3 3 9 x', image)
      image = execute_command('V 7 3 9 x', image)
      image = execute_command('H 3 7 3 x', image)
      image = execute_command('H 3 7 7 x', image)
      image = execute_command('S', image)
    end

    #Main entry point
    def self.main
      help #Show help message
      image = []
      #image = automata(image)
      loop do
        line = Readline::readline('GraphEd> ')
        exit if line.nil? || line == 'X'
        Readline::HISTORY.push(line)
        image = execute_command(line, image)
      end
    end
  end
end