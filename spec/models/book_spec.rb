# frozen_string_literal: true

require 'rails_helper'

describe Book, type: :model do
  it do
    should validate_presence_of(:genre)
  end

  #it do
  #  should validate_presence_of(:author)
  #end
#
#  #it do
#  #  should validate_presence_of(:image)
#  #end
#
#  #it do
#  #  should validate_presence_of(:tittle)
#  #end
# #
# # #it do
# # #  should validate_presence_of(:publisher)
# # #end
# #
# # #it do
# # #  should validate_presence_of(:year)
  #end

  subject(:book) do
    Book.new(genre: genre, author: author, image: image, tittle: tittle,
      publisher: publisher, year: year)
  end

  let(:genre) { Faker::Book.genre }
  #let(:author) { Faker::Book.author }
  #let(:image) { Faker::Avatar.image }
  #let(:tittle) { Faker::Book.tittle }
  #let(:publisher) { Faker::Book.publisher }
  #let(:year) { Faker::Number.between(1, 2018) }

  it do
    is_expected.to be_valid
  end

  describe '#generate_verification_code' do
    context 'When the book is created' do
      it 'generates a random verification code' do
        book.save!
        expect(book.verification_code).to be_present
      end
    end
  end

  describe '#create' do
    context 'When the genre is nil' do
      let(:genre) { nil }

      it do
        is_expected.to be_invalid
      end
    end

    #context 'When the author is nil' do
    #  let(:author) { nil }
#
#    #  it do
#    #    is_expected.to be_invalid
#    #  end
#    #end
#
#    #context 'When the image is nil' do
#    #  let(:image) { nil }
#
#    #  it do
#    #    is_expected.to be_invalid
#    #  end
#    #end
#
#    #context 'When the tittle is nil' do
#    #  let(:tittle) { nil }
#
#    #  it do
#    #    is_expected.to be_invalid
#    #  end
#    #end
#
#    #context 'When the publisher is nil' do
#    #  let(:publisher) { nil }
#
#    #  it do
#    #    is_expected.to be_invalid
#    #  end
#    #end
#
#    #context 'When the year is nil' do
#    #  let(:year) { nil }
#
#    #  it do
#    #    is_expected.to be_invalid
#    #  end
    #end
  end
end