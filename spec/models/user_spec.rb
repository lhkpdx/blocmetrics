require 'rails_helper'

RSpec.describe User, type: :model do
   let(:user) { User.create!(email: "anyone@anywhere.com", password: "password") }

   describe "attributes" do
     it "has a password" do
       expect(user).to have_attributes(password: "password")
     end

     it "has an email" do
       expect(user).to have_attributes(email: "anyone@anywhere.com")
     end
   end
end
