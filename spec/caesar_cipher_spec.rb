require_relative '../caesar_cipher'

describe "#caesar_cipher" do
  
  it "shifts letters by shift value" do
    expect(caesar_cipher("rspec",1)).to eq "stqfd"
  end
  
  it "should work with shift greater than 26" do
    expect(caesar_cipher("ABC", 27)).to eq "BCD"
  end
  
  it "works even if shift is zero by doing nothing" do
    expect(caesar_cipher("rspec",0)).to eq "rspec"
  end
  
  it "wraps around z back to a" do
    expect(caesar_cipher("zzz",2)).to eq "bbb"
  end
  
  it "maintains capital letters" do
    expect(caesar_cipher("RSpec", 3)).to eq "UVshf"
  end
  
end