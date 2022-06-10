require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.create!(name: 'farouq', email: 'farouq@mail.com', password: 'password')
  end

  before { subject.save }

  it 'should have name farouq' do
    expect(subject.name).to eql('farouq')
  end
  it 'should have email farouq@mail.com' do
    expect(subject.email).to eql('farouq@mail.com')
  end

  it 'email should be present' do
    subject.email = nil
    expect(subject).to_not be_valid
  end
end
