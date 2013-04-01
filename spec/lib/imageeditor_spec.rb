require "spec_helper"
require "graphed"

module Graphed

  describe ImageEditor do

    let(:testimage) {ImageEditor.new(6, 7)}

    it "should create 6x7 size 2D array with O" do
      testimage.should == [['O','O','O','O','O','O'],
                           ['O','O','O','O','O','O'],
                           ['O','O','O','O','O','O'],
                           ['O','O','O','O','O','O'],
                           ['O','O','O','O','O','O'],
                           ['O','O','O','O','O','O'],
                           ['O','O','O','O','O','O']]
    end

    it "valid on 3x6 but invalid on 7x8" do
      testimage.should be_valid_on(3,6)
      testimage.should_not be_valid_on(7,8)
    end

    it "should change color" do
      testimage.set(3,6,'X')
      testimage.get(3,6).should == 'X'
    end

    it "should draw a vertical line" do
      testimage.vertical(3,1,5, 'X')
      testimage.should == [['O','O','X','O','O','O'],
                           ['O','O','X','O','O','O'],
                           ['O','O','X','O','O','O'],
                           ['O','O','X','O','O','O'],
                           ['O','O','X','O','O','O'],
                           ['O','O','O','O','O','O'],
                           ['O','O','O','O','O','O']]
    end

    it "should draw a horizontal line" do
      testimage.horizontal(2, 6, 3, 'Z')
      testimage.should == [['O','O','O','O','O','O'],
                           ['O','O','O','O','O','O'],
                           ['O','Z','Z','Z','Z','Z'],
                           ['O','O','O','O','O','O'],
                           ['O','O','O','O','O','O'],
                           ['O','O','O','O','O','O'],
                           ['O','O','O','O','O','O']]
    end

    it "should fill an area" do
      testimage.V(2,2,6,'X')
      testimage.V(5,2,6,'X')
      testimage.H(2,5,2,'X')
      testimage.H(2,5,6,'X')
      testimage.fill(3,3,'Z')
      testimage.should ==
          [["O", "O", "O", "O", "O", "O"],
           ["O", "X", "X", "X", "X", "O"],
           ["O", "X", "Z", "Z", "X", "O"],
           ["O", "X", "Z", "Z", "X", "O"],
           ["O", "X", "Z", "Z", "X", "O"],
           ["O", "X", "X", "X", "X", "O"],
           ["O", "O", "O", "O", "O", "O"]]
    end


  end

end
