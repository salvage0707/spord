require 'rails_helper'

RSpec.describe BoardUser, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe "バリデーションの確認" do
  	it "commentの空での保存に失敗" do
  		request = BoardUser.create
   		expect(request.errors.messages[:comment]).to include %(can't be blank)
  	end
  end
end
