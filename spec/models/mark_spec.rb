require 'spec_helper'

describe Mark do

  before { @mark = Mark.new(name: "Suzuki") }

  subject { @mark }

  it {should respond_to(:name)}

  it { should be_valid }
  
  describe "when name is not present" do
  	before { @mark.name = " " }
  	it { should_not be_valid }
  end

  describe "when number_adress is too long" do
  	before { @mark.name = "a" * 101}
  	it { should_not be_valid }
  end

  describe "when name is already taken" do
  	before do
  	  @old = @mark.dup
  	  @old.save
  	end

  	it { should_not be_valid }
  end 
end
