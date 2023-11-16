require 'rails_helper'

RSpec.describe Animal, type: :model do
  it 'is valid with valid attributes' do
    cat = Animal.create(name: 'Kevin', age: 9, phone: '5551234')
    expect(cat).to be_valid
  end

  it 'is not valid without a name' do
    cat = Animal.create(age: 5, phone: '5551234')
    expect(cat.errors[:name]).to_not be_empty
  end

  it 'is not valid without an age' do
    cat = Animal.create(name: 'Wilbur', phone: '5551234')
    expect(cat.errors[:age]).to_not be_empty
  end

  it 'is not valid if name is outside of 2-20 characters' do
    cat = Animal.create(name:"K", age:5, phone: '5551234')
    expect(cat.errors[:name]).to_not be_empty

    long_cat = Animal.create(name:'Kevin the One-Armed Wonder Cat', age: 2, phone: '5551234')
    expect(cat.errors[:name]).to_not be_empty
  end

  it 'is not valid without a phone number' do
    cat = Animal.create(name:'Kev', age: 8)
    expect(cat.errors[:phone]).to_not be_empty
  end

  it 'is not valid with duplicate phone number' do
    cat = Animal.create(name: "Moose", age: 2, phone: '5551212')
    dupe = Animal.create(name: "Moose", age: 2, phone: '5551212')
    expect(dupe.errors[:phone]).to_not be_empty
  end

end
