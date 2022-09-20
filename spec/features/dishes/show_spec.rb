require 'rails_helper'

Rspec.describe 'dish show page' do
  let!(:rachel) { Chef.create!(name: "Rachel") }
  let!(:kiko) { Chef.create!(name: "Kiko") }
  let!(:marcos) { Chef.create!(name: "Marcos") }

  let!(:caccio) { rachel.dishes.create(name: "Caccio E Pepe", description: "Cheese Pepper and Pasta") }
  let!(:mapo) { marcos.dishes.create(name: "Mapo Tofu", description: "Fire and Tingle")}


  let!(:pepper) { Ingredient.create!(name: "black pepper", calories: 2) }
  let!(:parmesan) { Ingredient.create!(name: "parmesan", calories: 150) }
  let!(:pasta) { Ingredient.create!(name: "pasta", calories: 100) }
  let!(:pork) { Ingredient.create!(name: "pork", calories: 130) }
  let!(:gochujang) { Ingredient.create!(name: "gochujang", calories: 30) }
  let!(:tofu) { Ingredient.create!(name: "tofu", calories: 60) }


  describe "as a visitor, when I visit a dish show page" do
     before(:each) do
      caccio.ingredients << pepper
      caccio.ingredients << parmesan
      caccio.ingredients << pasta

      mapo.ingredients << pepper
      mapo.ingredients << pork
      mapo.ingredients << gochujang
      mapo.ingredients << tofu
      # visit dishes show path
     end

     it "I see the name of the dish and the description" do
     end

     it "and I see a list of ingredients for that dish" do
     end

     it "and I see the chef's name" do
     end
  end
end