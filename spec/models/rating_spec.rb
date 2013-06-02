require 'spec_helper'

describe Rating do
  subject{ rating }

  let(:rating) { FactoryGirl.build :rating }

  its(:valid?) { should be_true }

  describe 'validations' do
    it 'user should be required' do
      expect{ rating.user = nil }.to change{ rating.valid? }.from(true).to(false)
    end

    it 'book should be required' do
      expect{ rating.book = nil }.to change{ rating.valid? }.from(true).to(false)
    end

    it 'grade should be required' do
      expect{ rating.grade = nil }.to change{ rating.valid? }.from(true).to(false)
    end

    it 'book should be numeric' do
      expect{ rating.grade = 'a' }.to change{ rating.valid? }.from(true).to(false)
    end

    it 'book should be in (0..5)' do
      expect{ rating.grade = 6 }.to change{ rating.valid? }.from(true).to(false)
    end
  end
end
