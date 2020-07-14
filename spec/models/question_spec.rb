require 'rails_helper'
RSpec.describe Question, type: :model do
  describe "#create" do
    context "can save" do
      it 'is valid with title, question and subject' do
        expect(build(:question)).to be_valid
      end
    end
    context "can not save" do
      it 'is invalid without title' do
        question = build(:question, title: nil)
        question.valid?
        expect(question.errors[:title]).to include('を入力してください')
      end

      it 'is invalid without question' do
        question = build(:question, question: nil)
        question.valid?
        expect(question.errors[:question]).to include('を入力してください')
      end

      it 'is invalid without user' do
        question = build(:question, user_id: nil)
        question.valid?
        expect(question.errors[:user]).to include('を入力してください')
      end
    end
  end
end