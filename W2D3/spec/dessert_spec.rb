require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:brownie) { Dessert.new("Brownie", 10, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(brownie.type).to eq("Brownie")
    end

    it "sets a quantity" do
      expect(brownie.quantity).to eq(10)
    end

    it "starts ingredients as an empty array" do
      expect(brownie.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("Brownie", "ten", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      brownie.add_ingredient("Chocolate")
      expect(brownie.ingredients).to eq(["Chocolate"])
    end
  end

  describe "#mix!" do
    context "shuffles the ingredient array" do
      before(:each) do
        brownie.add_ingredient("Chocolate")
        brownie.add_ingredient("Eggs")
        brownie.add_ingredient("Flour")
        brownie.mix!
      end
      it "retains length" do
        expect(brownie.ingredients.length).to eq(3)
      end
      it "does not return the same ordering" do
        expect(brownie.ingredients).to_not be(["Chocolate", "Eggs", "Flour"])
      end
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      brownie.eat(3)
      expect(brownie.quantity).to eq(7)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { brownie.eat(11) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(chef).to receive(:titleize).and_return("Chef Chefman the Great Baker")
      expect(brownie.serve).to eq("Chef Chefman the Great Baker has made 10 Brownies!")
    end
  end

  describe "#make_more" do
    context "calls bake on the dessert's chef with the dessert passed in" do
      before(:each) do
        expect(chef).to receive(:bake).with(brownie)
        brownie.add_ingredient("Chocolate")
        brownie.add_ingredient("Eggs")
        brownie.add_ingredient("Flour")
        brownie.make_more
        brownie.mix!
        brownie.heat!
      end
      it "mixes dessert" do

      end
      it "heats dessert" do
        expect(brownie.temp).to eq(400)
      end
    end
  end
end
