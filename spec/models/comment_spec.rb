require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment= FactoryBot.build(:comment)
  end

  describe 'コメントの保存' do

    context 'コメントが保存できる場合' do
      it '登録する全ての情報が正しい場合、保存できる' do
        expect(@comment).to be_valid
      end
    end

    context 'コメントが保存できない場合' do
      it  'good_pointが空の場合、保存できない'  do
        @comment.good_point = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("良い点を入力してください")
      end

      it 'textが空の場合、保存できない' do
        @comment.text = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("コメントを入力してください")
      end

      it 'ユーザーが紐づいていないと保存できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Userを入力してください")
      end

      it '投稿が紐づいていないと登録できない' do
        @comment.post = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Postを入力してください")
      end

    end

  end

end
