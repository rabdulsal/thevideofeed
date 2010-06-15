require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "make" do
    u = User.make
    assert u.valid?
  end

  test "validates presence of name, username" do
    u = User.new(:name => nil)
    assert !u.valid?
    assert u.errors[:name]
    u = User.new(:username => nil)
    assert !u.valid?
    assert u.errors[:username]
  end

  test "validates unique of username" do
    u1 = User.make(:username => 'test')
    assert u1.valid?
    u2 = User.new(:username => 'test')
    assert !u2.valid?
    assert u2.errors[:username]
  end

  test "validates unique email" do
    u1 = User.make(:email => 'test@example.com')
    assert u1.valid?
    u2 = User.new(:email => 'test@example.com')
    assert !u2.valid?
    assert u2.errors[:email]
  end

  test "validates login login less than 15 chars" do
    u = User.new(:username => '1234567890123456')
    assert !u.valid?
    assert u.errors[:username]
  end

  test "validates login begins with a number or underscore" do
    u = User.new(:username => '1a'); assert !u.valid?; assert u.errors[:username]
    u = User.new(:username => '_a'); assert !u.valid?; assert u.errors[:username]
  end

  test "validates login isn't all letters, numbers, and underscores" do
    u = User.new(:username => '@'); assert !u.valid?; assert u.errors[:username]
    u = User.new(:username => '!'); assert !u.valid?; assert u.errors[:username]
    u = User.new(:username => '~'); assert !u.valid?; assert u.errors[:username]
  end

  test "to_param" do
    u = User.make
    assert_equal u.username, u.to_param
  end

  test "to_s" do
    u = User.make
    assert_equal u.username, u.to_s
  end

end
