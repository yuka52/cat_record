require 'rails_helper'

RSpec.describe Health, type: :model do
  before do
    @health = FactoryBot.build(:health)
    @cat = FactoryBot.build(:cat)
    @cat.save
    @health.cat_id = @cat.id
  end

  describe '健康記録の保存' do 
    context '健康記録が保存できるとき' do
      it '日付、ごはん、ちゅーる、遊び、体重、おしっこ、うんち、コメント、cat_id 、があれば登録できる' do
        expect(@health).to be_valid
      end
      
      it '体重が空でも、日付、ごはん、ちゅーる、遊び、おしっこ、うんち、コメント、cat_id、があれば登録できる' do
        @health.weight = ''
        expect(@health).to be_valid   
      end

      it 'コメントが空でも、日付、ごはん、ちゅーる、遊び、体重、おしっこ、うんち、cat_id、があれば登録できる' do
        @health.comment = ''
        expect(@health).to be_valid   
      end
    end
    context '健康記録が保存できないとき' do
      it '日付が空だと登録できない' do
        @health.recorded_date = ''
        @health.valid?
        expect(@health.errors.full_messages).to include("Recorded date can't be blank")
      end

      it 'ごはんが空だと登録できない' do
        @health.food_id = ''
        @health.valid?
        expect(@health.errors.full_messages).to include("Food can't be blank")
      end

      it 'ごはんは１を選ぶと登録できない' do
        @health.food_id = 1
        @health.valid?
        expect(@health.errors.full_messages).to include("Food must be other than 1")
      end

      it 'ちゅーるが空だと登録できない' do
        @health.tulle_id = ''
        @health.valid?
        expect(@health.errors.full_messages).to include("Tulle can't be blank")
      end

      it 'ちゅーるは１を選ぶと登録できない' do
        @health.tulle_id = 1
        @health.valid?
        expect(@health.errors.full_messages).to include("Tulle must be other than 1")
      end

      it '遊びが空だと登録できない' do
        @health.play_id = ''
        @health.valid?
        expect(@health.errors.full_messages).to include("Play can't be blank")
      end

      it '遊びは１を選ぶと登録できない' do
        @health.play_id = 1
        @health.valid?
        expect(@health.errors.full_messages).to include("Play must be other than 1")
      end

      it 'おしっこが空だと登録できない' do
        @health.pee_id = ''
        @health.valid?
        expect(@health.errors.full_messages).to include("Pee can't be blank")
      end

      it 'おしっこは１を選ぶと登録できない' do
        @health.pee_id = 1
        @health.valid?
        expect(@health.errors.full_messages).to include("Pee must be other than 1")
      end

      it 'うんちが空だと登録できない' do
        @health.poop_id = ''
        @health.valid?
        expect(@health.errors.full_messages).to include("Poop can't be blank")
      end

      it 'うんちは１を選ぶと登録できない' do
        @health.poop_id = 1
        @health.valid?
        expect(@health.errors.full_messages).to include("Poop must be other than 1")
      end

      it 'cat_idが空だと登録できない' do
        @health.cat_id = ''
        @health.valid?
        expect(@health.errors.full_messages).to include("Cat can't be blank")
      end

      it 'userが紐付いていないと登録できない' do
        @health.user = nil
        @health.valid?
        expect(@health.errors.full_messages).to include("User must exist")
      end

      it 'catが紐付いていないと登録できない' do
        @health.cat = nil
        @health.valid?
        expect(@health.errors.full_messages).to include("Cat must exist")
      end
    end
  end
end
