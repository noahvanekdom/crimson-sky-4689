require 'rails_helper'

RSpec.describe 'the chef show page' do
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
    caccio.ingredients << pepper
    caccio.ingredients << parmesan
    caccio.ingredients << pasta

    mapo.ingredients << pepper
    mapo.ingredients << pork
    mapo.ingredients << gochujang
    mapo.ingredients << tofu

    rainbow.ingredients << mango
    rainbow.ingredients << bamboo
    rainbow.ingredients << cabbage

    visit chef_path(marcos)
  end

  describe "As a visitor, when I access a chef show page" do
    it 'displays the name of the chef' do
    end

    it 'has a link to direct me to an index of all ingredients the chef uses' do
    end
  end
end



