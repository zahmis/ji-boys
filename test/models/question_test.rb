require 'test_helper'

class QuestionTest < ActiveSupport::TestCase

  def setup
    @user = users(:sizma)
    @question = @user.questions.build(title: "入隊後はすぐ厳しいのですか？",  content: "厳しくないです")
  end

  test "should be valid" do
    assert @question.valid?
  end
end
