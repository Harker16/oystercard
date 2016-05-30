require "oystercard"

describe "Feature test" do
  it "feature tests" do
    oystercard = Oystercard.new
    oystercard.top_up(30)
    oystercard.balance
    oystercard.withdraw(20)
  end
end
