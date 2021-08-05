require 'test_helper'

class MessageTest < ActiveSupport::TestCase

  def setup
    @message = users(:example).messages.build(content: "Lorem ipsum")
  end

  test "should be valid" do
    assert @message.valid?, @message.errors.full_messages
  end

  test "should not be blank" do
    @message.content = " "
    assert !@message.valid?
  end

  test "Mentions returns users" do
    @message = users(:example).messages.build(content:"@example")
    assert_not_nil @message.mentions
  end

  test "doesnt return a user when none is mentioned" do
    assert_empty @message.mentions
  end
end
