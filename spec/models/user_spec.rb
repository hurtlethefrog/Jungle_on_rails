require 'rails_helper'

RSpec.describe User, type: :model do
    
    subject {described_class.new(
      id: "1",
      first_name: "duncan", 
      last_name: "haran",
      password: "password",
      password_confirmation: "password",
      email: "duncan.haran@email.com"
      )}
      
    describe "Validations" do
      let(:test_user) {User.create(
        id: "3",
        first_name: "rich", 
        last_name: "dick",
        password: "password",
        password_confirmation: "password",
        email: "fghjk@email.com"
        )}
      it "is valid when given valid params" do
        expect(subject).to be_valid
      end

      it "is not valid when not given a first name" do
        subject.first_name = nil
        subject.valid?
        expect(subject.errors[:first_name]).to eq(["can't be blank"])
      end

      it "is not valid when not given a last name" do
        subject.last_name = nil
        subject.valid?
        expect(subject.errors[:last_name]).to eq(["can't be blank"])
      end

      it "is not valid when given a non unique email during creation" do
        subject.email = test_user.email
        subject.valid?
        expect(subject.errors[:email]).to eq(["has already been taken"])
      end

      it "is not valid when password is too short" do
        subject.password = "pass"
        subject.password_confirmation = "pass"
        subject.valid?
        expect(subject.errors[:password]).to eq(["is too short (minimum is 7 characters)"])
      end

      it "is not valid when passwords do not match" do
        subject.password = "passwordzz"
        subject.password_confirmation = "passwrod"
        subject.valid?
        expect(subject.errors[:password_confirmation]).to eq(["doesn't match Password", "doesn't match Password"])
      end

    end

end
