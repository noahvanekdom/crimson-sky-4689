require 'rails_helper'

RSpec.describe 'the chef ingredient index page' do
  let!(:rachel) { Chef.create!(name: "Rachel") }
  let!(:kiko) { Chef.create!(name: "Kiko") }
  let!(:marcos) { Chef.create!(name: "Marcos") }

  let!(:caccio) { rachel.dishes.create(name: "Caccio E Pepe", description: "Cheese Pepper and Pasta") }
  let!(:mapo) { marcos.dishes.create(name: "Mapo Tofu", description: "Fire and Tingle")}
  let!(:rainbow) { marcos.dishes.create(name: "Rainbow Salad", description: "Pretty Colors")}


  let!(:pepper) { Ingredient.create!(name: "black pepper", calories: 2) }
  let!(:parmesan) { Ingredient.create!(name: "parmesan", calories: 150) }
  let!(:pasta) { Ingredient.create!(name: "pasta", calories: 100) }
  let!(:pork) { Ingredient.create!(name: "pork", calories: 130) }
  let!(:gochujang) { Ingredient.create!(name: "gochujang", calories: 30) }
  let!(:tofu) { Ingredient.create!(name: "tofu", calories: 60) }
  let!(:bamboo) { Ingredient.create!(name: "bamboo shoots", calories: 25)}
  let!(:mango) { Ingredient.create!(name: "mango", calories: 40)}
  let!(:cabbage) {Ingredient.create!(name: "cabbage", calories: 35)}

  before(:each) do
    mapo.ingredients << pepper
    mapo.ingredients << pork
    mapo.ingredients << gochujang
    mapo.ingredients << tofu

    rainbow.ingredients << mango
    rainbow.ingredients << bamboo
    rainbow.ingredients << cabbage
    visit chef_ingredients_path(marcos)
  end

  describe "when I visit a chef ingredient index page for a specific chef" do
    it "displays all of the distinct ingredients a chef uses in their dishes" do

      expect(page).to have_content(bamboo.name, count: 1)
      expect(page).to have_content(mango.name, count: 1)
      expect(page).to have_content(pork.name, count: 1)
      expect(page).to_not have_content(parmesan.name)
      expect(page).to_not have_content(pasta.name)
    end
  end
end

