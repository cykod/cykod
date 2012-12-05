require "spec_helper"


describe Stormy::PagesController do
  render_views

  context "#show" do

    describe "404" do
      it "should raise an exception for a missing page" do
        expect { 
          get :show, page: "about"
        }.to raise_error
      end
    end

    describe "valid page" do
      let!(:about_page) { create(:post, name: "About This Fake Site", permalink: "about") }

      it "should render the page" do
        get :show, page: "about"
        response.body.should match("About This Fake Site")
      end
    end

  end
end
