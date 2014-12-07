require 'spec_helper'
#
#describe Phone do
#  it { should validate_uniqueness_of(:phone).scoped_to(:contact_id) }
#
#  it "does not allow duplicate phone numbers per contact" do
#    contact = create(:contact)
#    create(:home_phone,
#      contact: contact,
#      phone: '785-555-1234')
#    mobile_phone = build(:mobile_phone,
#      contact: contact,
#      phone: '785-555-1234')
#    expect(mobile_phone).to have(1).errors_on(:phone)
#  end
#
#  it "allows two contacts to share a phone number" do
#    create(:home_phone,
#      phone: "785-555-1234")
#    expect(build_stubbed(:home_phone, phone: "785-555-1234")).to be_valid
#  end
#end


 describe Phone do
   it "does not allow duplicate phone numbers per contact" do
     #contact = Contact.create(firstname: 'joe', lastname: 'Tester', email:'joetester@example.com')
     #home_phone = contact.phones.create(phone_type: 'home', phone: '785-555-1234')
     #mobile_phone = contact.phones.build(phone_type: 'mobile', phone: '785-555-1234')
     ##test_phone = contact.phones.build(phone_type: 'test', phone: '785-555-1234')

     contact = create(:contact)
     home_phone =  create(:home_phone, contact:contact, phone: '785-555-1234')
     mobile_phone =  build(:mobile_phone, contact:contact, phone: '785-555-1234')

     expect(mobile_phone).to have(1).errors_on(:phone)
   end

   it "allows two contacts to share a phone number" do
     #contact = Contact.create(firstname: 'joe', lastname: 'Tester', email:'joetester@example.com')
     #contact.phones.create(phone_type: 'home', phone: '785-555-1234')
     #
     #other_contact = Contact.create(firstname: 'joe', lastname: 'Tester', email:'joetester123@example.com')
     #other_contact.phones.build(phone_type: 'home', phone: '785-555-1234')
     #
     #expect(other_contact).to be_valid

     create(:phone, phone_type: 'home', phone: "785-555-1234")
     expect(build(:phone, phone_type: 'home', phone: "785-555-1234")).to be_valid

   end
 end
