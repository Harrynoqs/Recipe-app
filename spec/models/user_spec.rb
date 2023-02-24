require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.create!(name: 'harry', email: 'harry@mail.com', password: 'noqs123')
  end

  before { subject.save }

  it 'should have username harry' do
    expect(subject.name).to eql('harry')
  end

  it 'should have email present' do
    expect(subject.email).to eql('harry@mail.com')
  end

  it 'email should be present' do
    subject.email = nil
    expect(subject).to_not be_valid
  end
end
63
