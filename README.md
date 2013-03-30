# Graphed

This is a simple character based image editor with command line interface.

## Installation

1. Install it yourself as:

    $ gem install graphed

2. Launch it:

    $ graphed

## Usage

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

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
