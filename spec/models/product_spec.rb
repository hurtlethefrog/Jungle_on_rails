require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:toy_category) { Category.new(
    :id => 1, 
    :name => "toys", 
    :created_at => DateTime.now,
    :updated_at => DateTime.now - 1.week)}

  subject {described_class.new(
    id: "1",
    name: "toy car", 
    description: "a real fast toy car forsure",
    image: "an image url",
    price_cents: 10000,
    quantity: 25,
    created_at: DateTime.now,
    updated_at: DateTime.now - 1.week,
    category: toy_category
    )}

  describe "Validations" do

  it "is valid with valid atribs" do
    expect(subject).to be_valid
  end

  it "is not valid when not given a name" do
    subject.name = nil
    subject.valid?
    expect(subject.errors[:name]).to eq(["can't be blank"])
  end

  it "is not valid when not given a price" do
    subject.price_cents = nil
    subject.valid?
    expect(subject.errors[:price_cents]).to eq(["is not a number"])
  end

  it "is not valid when given no quantity" do
    subject.quantity = nil
    subject.valid?
    expect(subject.errors[:quantity]).to eq(["can't be blank"])
  end

  it "is not valid when given no category" do
    subject.category = nil
    subject.valid?
    expect(subject.errors[:category]).to eq(["can't be blank"])
  end
end

end
