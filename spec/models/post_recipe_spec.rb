require 'rails_helper'

RSpec.describe PostRecipe, type: :model do
  let!(:user) { create(:user) }
  let!(:post_recipe) { FactoryBot.create(:post_recipe) }

  describe 'PostRecipeモデルのメソッドのテスト' do
    it "いいねしていない場合、liked_by?メソッドでFALSEが返る" do
      expect(post_recipe.liked_by?(user)).to eq false
    end
    it "ブックマークしていない場合、saved_by?メソッドでFALSEが返る" do
      expect(post_recipe.saved_by?(user)).to eq false
    end
  end
end