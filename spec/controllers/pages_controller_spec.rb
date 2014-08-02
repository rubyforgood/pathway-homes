require 'rails_helper'

RSpec.describe PagesController, :type => :controller do
  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to be_success
    end
  end

  describe "GET about" do
    it "returns http success" do
      get :about
      expect(response).to be_success
    end
  end

  describe "GET contact" do
    it "returns http success" do
      get :contact
      expect(response).to be_success
    end
  end
end
