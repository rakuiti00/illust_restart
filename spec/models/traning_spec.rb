require 'rails_helper'

RSpec.describe Traning, type: :model do
  before do
    @traning= FactoryBot.build(:traning)
  end

  describe '練習用お題登録' do
    context '練習用お題が新規登録できる場合' do
      it '全ての情報が正しい場合、登録できること' do
        expect(@traning).to be_valid
      end

      it '画像がなくても登録できること' do
        @traning.image = nil
        expect(@traning).to be_valid
      end
    end

    context '練習用お題が新規登録できない場合' do
      it 'テキストがないと登録できないこと' do
        @traning.theme_text = ""
        @traning.valid?
        expect(@traning.errors.full_messages).to include("ランダム練習用お題を入力してください")
      end
    end

  end

end
