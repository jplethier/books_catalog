require 'spec_helper'

describe Book do
  subject { book }

  let(:book) { FactoryGirl.build :book }

  its(:valid?) { should be_true }

  describe 'validations' do
    it 'isbn should be required' do
      expect{ book.isbn = nil }.to change{ book.valid? }.from(true).to(false)
    end

    it 'isbn should be unique' do
      existing_book = FactoryGirl.create :book, isbn: 'duplicated_isbn'
      expect{ book.isbn = existing_book.isbn }.to change{ book.valid? }.from(true).to(false)
    end

    it 'title should be required' do
      expect{ book.title = nil }.to change{ book.valid? }.from(true).to(false)
    end
  end
end
