require 'readline'

module Graphed
  class Looper

    def self.execute_command(command, image)

      case command
        when /^I (\d) (\d)/
          image = ImageEditor.I($1.to_i, $2.to_i)
        else
          puts "No match is found"
      end

      image

    end



    def self.main

      print <<-EOF
This program simulates a simple interactive graphical editor.

Available commands:
I M N       Create a new MxN image with all pixels coloured white(O).
C           Clears the table, setting all pixels to white (O).
L X Y C     Colours the pixel (X,Y) with colour C.
V X Y1 Y2 C Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
H X1 X2 Y C Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
F X Y C     Fill the region R with the colur C. R is defined as: Pixel (X,Y) belongs to R. Any other pixel which is the same colour as (X,Y) and shares a common side with any pixel in R also belongs to this region.
S           Show the contents of the current image
X           Terminate the session

      EOF


      image = []

      loop do
        line = Readline::readline('> ')
        exit if line.nil? || line == 'X'
        Readline::HISTORY.push(line)
        image = self.execute_command(line, image)
      end

    end



  end
end