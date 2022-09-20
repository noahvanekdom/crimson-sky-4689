require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :dish_ingredients}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  describe "methods" do
    let!(:marcos) { Chef.create!(name: "Marcos") }
    let!(:mapo) { marcos.dishes.create(name: "Mapo Tofu", description: "Fire and Tingle") }
    let!(:pork) { Ingredient.create!(name: "pork", calories: 130) }
    let!(:gochujang) { Ingredient.create!(name: "gochujang", calories: 30) }
    let!(:tofu) { Ingredient.create!(name: "tofu", calories: 60) }
    let!(:pepper) { Ingredient.create!(name: "black pepper", calories: 2) }

    it "#total_calories" do
      mapo.ingredients << pork
      mapo.ingredients << pepper
      mapo.ingredients << tofu
      mapo.ingredients << gochujang

      expect(mapo.total_calories).to eq(222)
    end
  end
end