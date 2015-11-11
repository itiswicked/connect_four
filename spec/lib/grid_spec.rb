require_relative '../spec_helper'

describe Grid do

  let(:grid) { Grid.new }

  describe "#intialize" do

    it "creates a 10x10 array full of cell objects" do
      expect(grid.matrix).to be_a(Array)
      expect(grid.matrix.first).to be_a(Array)
      expect(grid.matrix.first.first).to be_a(Cell)
    end

  end

  describe "#drop_piece" do
    it "accepts column number and player symbol and drops piece in column" do
      grid.drop_piece(5, "X")
      expect(grid.matrix.last[5].symbol).to eq("X")
    end

    it "drops pieces on top of other pieces" do
      grid.drop_piece(5, "X")
      grid.drop_piece(5, "X")
      expect(grid.matrix[8][5].symbol).to eq("X")
    end

    it "does not override other pieces" do
      grid.drop_piece(5, "X")
      grid.drop_piece(5, "X")
      expect(grid.matrix[8][5].symbol).to_not eq(nil)
    end
  end

  describe "column_filled?" do
    it "returns false if column is  not filled" do
      expect(grid.column_filled?(5)).to eq(false)
    end

    it "returns true if column is filled" do
      10.times { grid.drop_piece(5, "X") }
      expect(grid.column_filled?(5)).to eq(true)
    end
  end

  describe "#output" do

    context "matrix is empty" do
      it "returns a blank matrix" do
        output_matrix = ["|                   |",
                         "|                   |",
                         "|                   |",
                         "|                   |",
                         "|                   |",
                         "|                   |",
                         "|                   |",
                         "|                   |",
                         "|                   |",
                         "|                   |",
                         " 0 1 2 3 4 5 6 7 8 9 "]
        expect(grid.output).to eq(output_matrix)
      end

      context "matrix has some cells filled" do
        grid.drop_piece(5, "X")
        grid.drop_piece(3, "O")
        output_matrix = ["|                   |",
                         "|                   |",
                         "|                   |",
                         "|                   |",
                         "|                   |",
                         "|                   |",
                         "|                   |",
                         "|                   |",
                         "|                   |",
                         "|      O   X        |",
                         " 0 1 2 3 4 5 6 7 8 9 "]
        expect(grid.output).to eq(output_matrix)
      end
    end
  end
end
