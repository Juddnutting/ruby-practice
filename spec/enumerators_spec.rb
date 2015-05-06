require_relative '../enumerators'

describe "my enumerables" do

  describe "#my_each" do
    subject { [1,2,3,4,5] }
    
    context "with a block" do
      
      it "iterates over each object" do
        test_arry = []
        subject.my_each {|num| test_arry << num}
        expect(test_arry).to eq subject
      end
    end
  
    context "without a block" do
    
      it "returns Enumberable if no block given" do
        expect(subject.my_each).to be_kind_of Enumerable
      end
    end
  end
  
  describe "#my_select" do
    subject {[1,2,3,4,5]}
    context "with a block" do
      
      it "returns original array if always true" do
        expect(subject.my_select {|num| true}).to eq subject
      end
      
      it "returns empty array if always false" do
        expect(subject.my_select {|num| false}).to eq []
      end
      
      it "returns proper elements" do
        expect(subject.my_select {|num| num>3}).to eq [4,5]
      end
    end
    
    context "without a block" do
      it "returns self" do
        expect([1,2,3].my_select).to eq [1,2,3]
      end
    end
  end
end