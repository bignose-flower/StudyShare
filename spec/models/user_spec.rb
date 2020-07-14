require 'rails_helper'
RSpec.describe User, type: :model do
  describe '#create' do
    context 'can save' do
      it "is valid without image" do
        expect(build(:user, image: '')).to be_valid
      end

      it "is valid without notice" do
        expect(build(:user, notice: '')).to be_valid
      end

      it "is valid without notice and image" do
        expect(build(:user, image: '', notice: '')).to be_valid
      end

    end
    context 'can not save' do
      it "is invalid without name" do
        user = build(:user, name: '')
        user.valid?
        expect(user.errors[:name]).to include('を入力してください')
      end

      it "is invalid without email" do
        user = build(:user, email: '')
        user.valid?
        expect(user.errors[:email]).to include('を入力してください')
      end

      it "is invalid without birthday" do
        user = build(:user, birth_date: '')
        user.valid?
        expect(user.errors[:birth_date]).to include('を入力してください')
      end

      it "is invalid without default job" do
        user = build(:user, job: '職業を選んでください')
        user.valid?
        expect(user.errors[:job]).to include('を入力してください')
      end

      it "is invalid without password" do
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include('を入力してください')
      end

      it "is invalid without password_confirmation although with a password" do
        user = build(:user, password_confirmation: "")
        user.valid?
        expect(user.errors[:password_confirmation]).to include('とパスワードの入力が一致しません')
      end

      it "is invalid with password less than 7 words" do
        user = build(:user, password: 'tako')
        user.valid?
        expect(user.errors[:password]).to include('は8文字以上で入力してください')
      end
    end
  end
end