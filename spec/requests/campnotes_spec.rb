 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/campnotes", type: :request do
  # Campnote. As you add validations to Campnote, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Campnote.create! valid_attributes
      get campnotes_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      campnote = Campnote.create! valid_attributes
      get campnote_url(campnote)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_campnote_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      campnote = Campnote.create! valid_attributes
      get edit_campnote_url(campnote)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Campnote" do
        expect {
          post campnotes_url, params: { campnote: valid_attributes }
        }.to change(Campnote, :count).by(1)
      end

      it "redirects to the created campnote" do
        post campnotes_url, params: { campnote: valid_attributes }
        expect(response).to redirect_to(campnote_url(Campnote.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Campnote" do
        expect {
          post campnotes_url, params: { campnote: invalid_attributes }
        }.to change(Campnote, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post campnotes_url, params: { campnote: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested campnote" do
        campnote = Campnote.create! valid_attributes
        patch campnote_url(campnote), params: { campnote: new_attributes }
        campnote.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the campnote" do
        campnote = Campnote.create! valid_attributes
        patch campnote_url(campnote), params: { campnote: new_attributes }
        campnote.reload
        expect(response).to redirect_to(campnote_url(campnote))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        campnote = Campnote.create! valid_attributes
        patch campnote_url(campnote), params: { campnote: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested campnote" do
      campnote = Campnote.create! valid_attributes
      expect {
        delete campnote_url(campnote)
      }.to change(Campnote, :count).by(-1)
    end

    it "redirects to the campnotes list" do
      campnote = Campnote.create! valid_attributes
      delete campnote_url(campnote)
      expect(response).to redirect_to(campnotes_url)
    end
  end
end
