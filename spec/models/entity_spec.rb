require 'rails_helper'

RSpec.describe Entity, type: :model do
  before(:each) do
    @user = User.create(name: 'farouq', email: 'farouq@gmail.com', password: '123455')
    expect(@user).to be_valid
    @category = Group.create(name: 'hello', icon: 'icon',
                             user_id: @user.id)
    @expense = Entity.create(name: 'expense', amount: 4,
                             user_id: @user.id, group_id: @category.id)
  end

  it 'spec for create a expense' do
    expect(@expense).to be_valid
    expect(@expense.name).to eq 'expense'
    expect(@expense.amount).to eq 4
  end
end
