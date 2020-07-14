require 'rails_helper'
RSpec.describe Answer, type: :model do
  describe "#create" do
    context 'can save' do
      it 'is valid with answer' do
        expect(build(:answer)).to be_valid
      end
    end
    
    context "can not save" do
      it 'is invalid without answer' do
        answer = build(:answer, answer: nil)
        answer.valid?
        expect(answer.errors[:answer]).to include('を入力してください')
      end

      it 'is invalid without user' do
        answer = build(:answer, user_id: nil)
        answer.valid?
        expect(answer.errors[:user]).to include('を入力してください')
      end

      it 'is invalid without question' do
        answer = build(:answer, question_id: nil)
        answer.valid?
        expect(answer.errors[:question]).to include('を入力してください')
      end
    end
  end
end