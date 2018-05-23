require 'rails_helper'

describe Book, type: :model do
  it { should validate_presence_of(:genre) }
  it { should validate_presence_of(:author) }
  it { should validate_presence_of(:image) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:publisher) }
  it { should validate_presence_of(:year) }

  subject(:book) { create(:book) } 

  it { is_expected.to be_valid }

  describe '#generate_verification_code' do
    context 'When the book is created' do
      it 'generates a random verification code' do
        book.save! 
      end
    end
  end
end
