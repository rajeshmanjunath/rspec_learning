require 'spec_helper'

#describe Contact do
#  it "has a valid factory" do
#    expect(build(:contact)).to be_valid
#  end
#
#  it { should validate_presence_of :firstname }
#  it { should validate_presence_of :lastname }
#  it { should validate_presence_of :email }
#  it { should validate_uniqueness_of(:email) }
#
#  it "has three phone numbers" do
#    expect(create(:contact).phones.count).to eq 3
#  end
#
#  it "returns a contact's full name as a string" do
#    contact = build_stubbed(:contact,
#      firstname: "Jane", lastname: "Doe")
#    expect(contact.name).to eq "Jane Doe"
#  end
#
#  describe "filter last name by letter" do
#    let(:smith) { create(:contact,
#      lastname: 'Smith', email: 'jsmith@example.com') }
#    let(:jones) { create(:contact,
#      lastname: 'Jones', email: 'tjones@example.com') }
#    let(:johnson) { create(:contact,
#      lastname: 'Johnson', email: 'jjohnson@example.com') }
#
#    context "matching letters" do
#      it "returns a sorted array of results that match" do
#        expect(Contact.by_letter("J")).to eq [johnson, jones]
#      end
#    end
#
#    context "non-matching letters" do
#      it "returns a sorted array of results that match" do
#        expect(Contact.by_letter("J")).to_not include smith
#      end
#    end
#  end
#end


# specs i've writtten

describe Contact do

  it "has a valid factory" do
    #expect(FactoryGirl.build(:contact)).to be_valid
    expect(create(:contact)).to be_valid
  end


  #error
  #it "is valid with a first name, lastname and email"  do
  #  contact = Contact.new(
  #      firstname: 'Aaron',
  #      lastname: 'Summer',
  #      email: 'tester@example.com' )
  #
  #  expect(contact).to be_valid
  #end

  it "is invalid without a firstname" do
    #expect(Contact.new(firstname: nil)).to have(1).errors_on(:firstname)
    contact = build(:contact, firstname: nil)
    expect(contact).to have(1).errors_on(:firstname)
  end


  it "is invalid without a lastname"  do
    #expect(Contact.new(lastname: nil)).to have(1).errors_on(:lastname)
    contact = build(:contact, lastname: nil)
    expect(contact).to have(1).errors_on(:lastname)
  end

  it "is invalid without a email address" do
    #expect(Contact.new(email: nil)).to have(1).errors_on(:email)
    contact = build(:contact, email: nil)
    expect(contact).to have(1).errors_on(:email)
  end

  it "is invalid with a duplicate email address"  do
    #Contact.create(firstname: 'Joe', lastname: 'Tester', email: 'tester@example.com')
    #contact = Contact.new(firstname: 'Jane', lastname: 'Tester', email: 'tester@example.com')

    create(:contact, email: 'tester@example.com')
    contact = build(:contact, email: 'tester@example.com')

    expect(contact).to have(1).errors_on(:email)
  end


  it "returns a contact's full name as a string" do
    #contact = Contact.new(firstname: "John", lastname: 'Doe', email: 'johndoe@example.com')
    contact = build(:contact, firstname: "John", lastname: 'Doe', email: 'johndoe@example.com')
    expect(contact.name).to eq 'John Doe'
  end

  #error
  #it "returns a sorted array of results that match" do
  #   smith = Contact.create(firstname: "John", lastname: 'Smith', email: 'jsmith@example.com')
  #   jones = Contact.create(firstname: "Tim", lastname: 'Jones', email: 'tjones@example.com')
  #   johnson = Contact.create(firstname: "John", lastname: 'Johnson', email: 'jjohnson@example.com')
  #
  #   expect(Contact.by_letter("J")).to_not eq nil #['Jonhson', 'Jones']
  #   expect(Contact.by_letter("J")).to eq [johnson,jones]
  #end


  it "has three phone number" do
    expect(create(:contact).phones.count).to eq(3)
  end
end