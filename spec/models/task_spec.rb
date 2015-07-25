require 'spec_helper'

describe Task do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:user_id) }

  describe "creation" do
    context "valid attributes" do
      it "should be valid" do
        task = FactoryGirl.build(:task)
        task.should be_valid
      end
    end

    context "invalid attributes" do
      it "should not be valid" do
        task = FactoryGirl.build(:task, name: "", user_id: "")
        task.should_not be_valid
      end
    end
  end
end