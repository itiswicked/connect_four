require_relative '../spec_helper'

describe Cell do

  let(:cell) { Cell.new }

  describe "#intialize" do

    it "has optional readable attr symbol" do
      expect(cell.symbol).to be(nil)
    end

    it "writes to attr symbol" do
      expect{cell.symbol = "O"}.to_not raise_error
    end

  end

end
