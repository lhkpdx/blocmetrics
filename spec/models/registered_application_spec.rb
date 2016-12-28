require 'rails_helper'

RSpec.describe RegisteredApplication, type: :model do

  it { is_expected.to belong_to(:user) }

  let(:user) { User.create!(email: "anyone@anywhere.com", password: "password") }
  let(:registered_application) {RegisteredApplication.create!(name: "name", url: "http://www.anywhere.com")}


  describe "attributes" do
    it "has a name and url" do

     expect(registered_application).to have_attributes(name: registered_application.name, url: registered_application.url)
    end
 end
end
