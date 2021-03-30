require 'rails_helper'

RSpec.describe Cat, type: :model do
  before do
    @cat = FactoryBot.build(:cat)
  end

  describe '猫プロフィールの保存' do 
    context '猫プロフィールが保存できるとき' do
      it '写真、名前、誕生日、性別、好きな物があれば登録できる' do
        expect(@cat).to be_valid
      end

      it '好きな物がなくても、写真、名前、誕生日、性別があれば登録できる' do
        @cat.favorite = ''
        expect(@cat).to be_valid
      end
    end
    context '猫プロフィールが保存できない時' do
      it '写真が空では保存できない' do 
        @cat.image = nil 
        @cat.valid?
        expect(@cat.errors.full_messages).to include("Image can't be blank")
      end

      it '名前が空では保存できない' do
        @cat.name = ''
        @cat.valid?
        expect(@cat.errors.full_messages).to include("Name can't be blank")
      end

      it '誕生日が空では保存できない' do
        @cat.birthday = ''
        @cat.valid?
        expect(@cat.errors.full_messages).to include("Birthday can't be blank")
      end

      it '性別が空では保存できない' do
        @cat.gender_id = ''
        @cat.valid?
        expect(@cat.errors.full_messages).to include("Gender can't be blank", "Gender is not a number")
      end

      it '性別は１を選ぶと保存できない' do
        @cat.gender_id = 1
        @cat.valid?
        expect(@cat.errors.full_messages).to include("Gender must be other than 1")
      end  

      it 'ユーザーが紐付いていなければ保存できない' do
        @cat.user = nil
        @cat.valid?
        expect(@cat.errors.full_messages).to include("User must exist")
      end
    end
  end
end
