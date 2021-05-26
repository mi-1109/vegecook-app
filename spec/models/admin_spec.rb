require 'rails_helper'

RSpec.describe Admin, type: :model do
  let!(:admin) { create(:admin) }
  describe 'guestメソッドのテスト' do
    it "ゲスト管理者のアカウントが正常に生成される" do
      expect(admin.email).to eq 'guest@example.com'
    end
  end
end