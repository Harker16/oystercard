require 'oystercard'

describe Oystercard do

  context "balance" do
    it "has a balance of 0 by default" do
      expect(subject.balance).to eq 0
    end
  end

  context "transaction" do

    describe "#top_up" do

      it { is_expected.to respond_to(:top_up).with(1).argument }

      it "tops up when method #top_up is invoked" do
        subject.balance = 0
        subject.top_up(10)
        expect(subject.balance).to eq 10
      end
    end
  end

end
