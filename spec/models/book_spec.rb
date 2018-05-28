# frozen_string_literal: true

require 'rails_helper'

describe Book, type: :model do
  subject(:book) { create(:book) }

  it { should validate_presence_of(:genre) }
  it { should validate_presence_of(:author) }
  it { should validate_presence_of(:image) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:publisher) }
  it { should validate_presence_of(:year) }

  it { is_expected.to be_valid }
end
