require 'test_helper'

class ChefTest < ActiveSupport::TestCase
 
 def setup
  @chef = Chef.new(name: "John", email: "John@example.com")
 end
 
 test 'Chef Should be valid' do
  assert @chef.valid?
 end
 
 test 'Chef name should be present' do
  @chef.name = " "
  assert_not @chef.valid?
 end
 
 test " should have name too long" do
  @chef.name = "a" * 41
  assert_not @chef.valid?
 end
 
 test "should have name too short" do
  @chef.name = "aa" 
  assert_not @chef.valid?
 end
 
 test "should have email" do
  @chef.email = " "
  assert_not @chef.valid?
 end
 
 test "should have email within bounds" do
  @chef.email = "a" * 101 + "example.com"
  assert_not @chef.valid?
 end

 test "should have unique email" do
  dup_chef = @chef.dup
  dup_chef.email = @chef.email.upcase
  @chef.save
  assert_not dup_chef.valid?
 end
 
 test "should have valid email" do
  valid_addresses = %w[user@eee.com R_TTD-DS@eee.hello.org user@example.com first.last@eem.au laura+joe@monk.cm]
  valid_addresses.each do |val|
   @chef.email = val
   assert @chef.valid?, '#{va.inspect} should be valid'
  end
 end
 
 test "should reject invalid email" do
  invalid_addresses = %w[user@example,com user_at_eee.org user_name@example. eee@i_am_.com foo@ee+aar.com]
  invalid_addresses.each do |inval|
   @chef.email = inval
   assert_not @chef.valid?, '#{va.inspect} should be invalid'
  end
 end
end