require 'spec_helper'

#describe ContactsController do
#  let(:admin) { build_stubbed(:admin) }
#  let(:user) { build_stubbed(:user) }
#
#  let(:contact) { build_stubbed(:contact, firstname: 'Lawrence', lastname: 'Smith') }
#  let(:phones) {
#    [
#      attributes_for(:phone, phone_type: "home"),
#      attributes_for(:phone, phone_type: "office"),
#      attributes_for(:phone, phone_type: "mobile")
#    ]
#  }
#  let(:valid_attributes) { attributes_for(:contact) }
#  let(:invalid_attributes) { attributes_for(:invalid_contact) }
#
#  before :each do
#    allow(Contact).to receive(:persisted?).and_return(true)
#    allow(Contact).to receive(:order).with('lastname, firstname').and_return([contact])
#    allow(Contact).to receive(:find).with(contact.id.to_s).and_return(contact)
#    allow(contact).to receive(:save).and_return(true)
#  end
#
#  shared_examples("public access to contacts") do
#    describe 'GET #index' do
#      before :each do
#        get :index
#      end
#
#      it "populates an array of contacts" do
#        expect(assigns(:contacts)).to match_array [contact]
#      end
#
#      it "renders the :index view" do
#        expect(response).to render_template :index
#      end
#    end
#
#    describe 'GET #show' do
#      before :each do
#        allow(Contact).to receive(:find).with(contact.id.to_s).and_return(contact)
#        get :show, id: contact
#      end
#
#      it "assigns the requested contact to @contact" do
#        expect(assigns(:contact)).to eq contact
#      end
#
#      it "renders the :show template" do
#        expect(response).to render_template :show
#      end
#    end
#  end
#
#  shared_examples("full access to contacts") do
#    describe 'GET #new' do
#      before :each do
#        get :new
#      end
#
#      it "assigns a new Contact to @contact" do
#        expect(assigns(:contact)).to be_a_new(Contact)
#      end
#
#      it "assigns a home, office, and mobile phone to the new contact" do
#        phones = assigns(:contact).phones.map do |p|
#          p.phone_type
#        end
#        expect(phones).to match_array %w(home office mobile)
#      end
#
#      it "renders the :new template" do
#        expect(response).to render_template :new
#      end
#    end
#
#    describe 'GET #edit' do
#      it "assigns the requested contact to @contact" do
#        get :edit, id: contact
#        expect(assigns(:contact)).to eq contact
#      end
#
#      it "renders the :edit template" do
#        get :edit, id: contact
#        expect(response).to render_template :edit
#      end
#    end
#
#    describe "POST #create" do
#      context "with valid attributes" do
#        before :each do
#          post :create, contact: attributes_for(:contact,
#            phones_attributes: phones)
#        end
#
#        it "creates a new contact" do
#          expect(Contact.exists?(assigns[:contact])).to be_true
#        end
#
#        it "redirects to the new contact" do
#          expect(response).to redirect_to Contact.last
#        end
#      end
#
#      context "with invalid attributes" do
#        before :each do
#          post :create, contact: attributes_for(:invalid_contact)
#        end
#
#        it "does not save the new contact" do
#          expect(Contact.exists?(contact)).to be_false
#        end
#
#        it "re-renders the new method" do
#          expect(response).to render_template :new
#        end
#      end
#    end
#
#    describe 'PATCH #update' do
#      context "valid attributes" do
#        it "located the requested @contact" do
#          allow(contact).to receive(:update).with(valid_attributes.stringify_keys) { true }
#          patch :update, id: contact, contact: valid_attributes
#          expect(assigns(:contact)).to eq(contact)
#        end
#
#        it "redirects to the updated contact" do
#          patch :update, id: contact, contact: attributes_for(:contact)
#          expect(response).to redirect_to contact
#        end
#      end
#
#      context "invalid attributes" do
#        before :each do
#          allow(contact).to receive(:update).with(invalid_attributes.stringify_keys) { false }
#          patch :update, id: contact, contact: invalid_attributes
#        end
#
#        it "locates the requested @contact" do
#          expect(assigns(:contact)).to eq contact
#        end
#
#        it "does not change @contact's attributes" do
#          expect(assigns[:contact].attributes).to eq contact.attributes
#        end
#
#        it "re-renders the edit method" do
#          expect(response).to render_template :edit
#        end
#      end
#    end
#
#    describe 'DELETE destroy' do
#      before :each do
#        allow(contact).to receive(:destroy).and_return(true)
#        delete :destroy, id: contact
#      end
#
#      it "deletes the contact" do
#        expect(Contact.exists?(contact)).to be_false
#      end
#
#      it "redirects to contacts#index" do
#        expect(response).to redirect_to contacts_url
#      end
#    end
#  end
#
#  describe "admin access" do
#    before :each do
#      allow(controller).to receive(:current_user).and_return(admin)
#    end
#
#    it_behaves_like "public access to contacts"
#    it_behaves_like "full access to contacts"
#  end
#
#
#  describe "user access" do
#    before :each do
#      allow(controller).to receive(:current_user).and_return(user)
#    end
#
#    it_behaves_like "public access to contacts"
#    it_behaves_like "full access to contacts"
#  end
#
#
#  describe "guest access" do
#    it_behaves_like "public access to contacts"
#
#    describe 'GET #new' do
#      it "requires login" do
#        get :new
#        expect(response).to require_login
#      end
#    end
#
#    describe "POST #create" do
#      it "requires login" do
#        post :create, contact: attributes_for(:contact)
#        expect(response).to require_login
#      end
#    end
#
#    describe 'PATCH #update' do
#      it "requires login" do
#        patch :update, id: contact, contact: attributes_for(:contact)
#        expect(response).to require_login
#      end
#    end
#
#    describe 'DELETE #destroy' do
#      it "requires login" do
#        delete :destroy, id: contact
#        expect(response).to require_login
#      end
#    end
#  end
#end



#my code

describe ContactsController do

  describe 'GET #index' do
     context 'with params[:letter]' do
       it "populates an array of contacts starting with the letter" do
         smith = create(:contact,lastname: 'Smith')
         jones = create(:contact, lastname: 'Jones')
         get :index, letter: 'S'
         expect(assigns(:contacts)).to match_array [smith]
       end
       it "renders the :index view" do
         get :index, letter: 'S'
         expect(response).to render_template :index
       end
    end

     context 'without params[:letter]' do
       it "populates an array of all contacts"  do
         smith = create(:contact,lastname: 'Smith')
         jones = create(:contact, lastname: 'Jones')
         get :index #, letter: ""
         expect(assigns(:contacts)).to match_array [smith,jones]
       end
       it "renders the :index view"  do
         get :index #, letter: ""
         expect(response).to render_template :index
       end
     end
  end

  describe 'GET #show' do
     it "assigns the requested message to @contact"   do
       contact = create(:contact)
       get :show, id: contact
       expect(assigns(:contacts)).to eq contact
     end
     it "renders the :show template"  do
       contact = create(:contact)
        get :show, id: contact
        expect(response).to render_template :show
     end
  end

 describe 'GET #new' do
    it "assigns a new Contact to @contact"  do
      get :new
      expect(assigns(:contact)).to be_a_new(Contact)
    end
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
 end

 describe 'GET #edit' do
     it "assigns the requested contact to @contact"  do
       contact = create(:contact)
        get :edit, id: contact
        expect(assigns(:contact)).to eq contact
     end
     it "renders the :edit template"  do
       contact = create(:contact)
       get :edit, id: contact
       expect(response).to render_template :edit
     end
 end

 describe "POST #create" do

       before :each do
          @phones = [
              attributes_for(:phone),
              attributes_for(:phone),
              attributes_for(:phone)
          ]
       end

   context "with valid attributes" do
     it "saves the new contact in the database" do
       expect{
         post :create, contact: attributes_for(:contact,
                                                  phones_attributes: @phones)
         }.to change(Contact, :count).by(1)
       end

     it "redirects to contacts#show" do
       post :create, contact: attributes_for(:contact,
                                                phones_attributes: @phones)
       expect(response).to redirect_to contact_path(assigns[:contact])
       end
   end


       context "with invalid attributes" do
          it "does not save the new contact in the database" do
            #:invalid_contact
            expect{
              post :create,
              contact: attributes_for(:contact, firstname: nil)
              }.to_not change(Contact, :count)
          end

          it "re-renders the :new template" do
            post :create,
            contact: attributes_for(:invalid_contact)
            expect(response).to render_template :new
            end
       end

 end

 describe 'PUT/PATCH #update' do

   before :each do
     @contact = create(:contact,
                        firstname: 'Lawrence', lastname: 'Smith')
   end

    context "with valid attributes" do
      it "located the requested @contact"   do
        post :update, id: @contact, contact: attributes_for(:contact)
        expect(assigns(:contact)).to eq(@contact)
      end

      #it "located the requested @contact"   do
      #  contact = create(:contact)
      #  post :update, id: contact, contact: attributes_for(:contact)
      #  expect(assigns(:contact)).to eq(contact)
      #end

      it "changes @contact's attributes" do
         patch :update, id: @contact,
         contact: attributes_for(:contact,
                                    firstname: "Larry", lastname: "Smith")
         @contact.reload
         expect(@contact.firstname).to eq("Larry")
         expect(@contact.lastname).to eq("Smith")
      end

      it "redirects to the updated contact" do
         patch :update, id: @contact, contact: attributes_for(:contact)
         expect(response).to redirect_to @contact
      end

    end

     context "with invalid attributes" do
       it "does not change the contact's attributes" do
          patch :update, id: @contact,
          contact: attributes_for(:contact,
                                    firstname: "Larry", lastname: nil)
          @contact.reload
          expect(@contact.firstname).to_not eq("Larry")
          expect(@contact.lastname).to eq("Smith")
       end

       it "re-renders the edit template" do
          patch :update, id: @contact,
          contact: attributes_for(:invalid_contact)
          expect(response).to render_template :edit
       end
     end
 end

 describe 'DELETE #destroy' do
   before :each do
      @contact = create(:contact)
   end

   #my own testing
   it "located the requested @contact"   do
    # contact = create(:contact)
     post :destroy, id: @contact
     expect(assigns(:contact)).to eq(@contact)
   end


   it "deletes the contact" do
      expect{
        delete :destroy, id: @contact
        }.to change(Contact,:count).by(-1)
   end
 end

end     #describe contacts controller end

