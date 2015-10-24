require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
 
 def setup
  @chef = Chef.create(name: "Bob", email: "bob@example.com")
  @recipe = @chef.recipes.build(name: "Chicken Parm", summery: "Best Chicken Parm Ever",
     description: "Add Chicken, Add Parm and eat the god damn thing")
 end
 
 test "recipe should be valid" do
  assert @recipe.valid?
 end
 
 test "should have chef id" do
  @recipe.chef_id = nil
  assert_not @recipe.valid?
 end 
 
 test "name should be present" do
  @recipe.name = " "
  assert_not @recipe.valid?
 end
 
 test "name length is too long" do 
  @recipe.name = "a" * 101
  assert_not @recipe.valid?
 end
 
 test "name length is too short" do 
  @recipe.name = "aaaa"
  assert_not @recipe.valid?
 end
 
 test "summery required" do 
  @recipe.summery = " "
  assert_not @recipe.valid?
 end
 
 test "summery length too long" do 
  @recipe.summery = "a" * 151
  assert_not @recipe.valid?
 end
 
 test "summery length too short" do 
    @recipe.summery = "a" * 9
    assert_not @recipe.valid?
 end
 
 test "description required" do 
  @recipe.description = " "
  assert_not @recipe.valid?
 end
 
 test "description length too long" do 
  @recipe.description = "a" * 501
  assert_not @recipe.valid?
 end
 
 test "description length too short" do 
  @recipe.description = "a" * 19
  assert_not @recipe.valid?
 end
 
end
