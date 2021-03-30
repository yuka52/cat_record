require 'rails_helper'

RSpec.describe Health, type: :model do
  before do
    @health = FactoryBot.build(:health)
  end

  describe '健康記録の保存' do 
    context '健康記録が保存できるとき' do
      it '日付、ごはん、ちゅーる、遊び、体重、おしっこ、うんち、コメント、cat_id 、があれば登録できる' do
        expect(@health).to be_valid
      end
      
      # it '体重が空でも、日付、ごはん、ちゅーる、遊び、体重、おしっこ、うんち、コメント、cat_id、があれば登録できる' do
        
      # end
    end
  end
end
