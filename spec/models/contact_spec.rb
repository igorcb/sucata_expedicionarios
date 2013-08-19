require 'spec_helper'

describe Contact do
  before { @contact = Contact.new(name: "Igor C. Batista", 
  	                             email: "igor.batista@gmail.com", 
  	                             phone: "85 32326790", 
  	                           subject: "Peca de Sucata", 
  	                           message: "Lorem ipsum dolor sit amet, consectetur adipisicing elit.") }

  subject { @contact }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:phone) }
  it { should respond_to(:subject) }
  it { should respond_to(:message) }

  it { should be_valid }

  describe "when name is not present" do
  	before { @contact.name = " "}
  	it { should_not be_valid }
  end

  describe "when email is not present" do
  	before { @contact.email = " "}
  	it { should_not be_valid }
  end

  describe "when phone is not present" do
  	before { @contact.phone = " "}
  	it { should_not be_valid }
  end

  describe "when subject is not present" do
  	before { @contact.subject = " "}
  	it { should_not be_valid }
  end

  describe "when message is not present" do
  	before { @contact.message = " "}
  	it { should_not be_valid }
  end
 
  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[contact@foo,com contact_at_foo.org example.contact@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @contact.email = invalid_address
        expect(@contact).not_to be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[contact@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @contact.email = valid_address
        expect(@contact).to be_valid
      end
    end
  end  

  describe "when phone is not number" do
  	before { @contact.phone = "abc"}
    it { should be_valid } 
  end

  describe "when phone is number" do
  	before { @contact.phone = "8532323232"}
    it { should be_valid } 
  end

  # describe "when phone is too long" do
  # 	before { @contact.phone = "a" * 11}
  #   it { should_not be_valid } 
  # end

end
