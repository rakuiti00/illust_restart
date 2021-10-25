require 'rails_helper'

RSpec.describe Like, type: :model do
  before do
    @like = FactoryBot.build(:like)
  end

  describe 'いいねデータの保存' do

    context 'いいねデータが保存できる場合' do
      it '登録する全ての情報が正しい場合、保存できる' do
        expect(@like).to be_valid
      end
    end

    context 'いいねデータが保存できない場合' do
      it 'ユーザーが紐づいていないと保存できない' do
        @like.user = nil
        @like.valid?
        expect(@like.errors.full_messages).to include("Userを入力してください")
      end

      it '投稿が紐づいていないと保存できない' do
        @like.post = nil
        @like.valid?
        expect(@like.errors.full_messages).to include("Postを入力してください")
      end




    end
  end

end
