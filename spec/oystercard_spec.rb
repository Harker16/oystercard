require 'oystercard'

describe Oystercard do

  context "Information on the card by default" do
    it "has a balance of 0 by default" do
      expect(subject.balance).to eq 0
    end

    it "is not in journey by default" do
      expect(subject).not_to be_in_journey
    end

  end

  it { is_expected.to respond_to(:in_journey?)}

  context "transaction" do

    describe "#top_up" do

      it { is_expected.to respond_to(:top_up).with(1).argument }

      it "tops up when method #top_up is invoked" do
        expect{ subject.top_up(10)}.to change{ subject.balance }.by 10
      end

      it "raises an error if top up exceeds balance limit" do
        expect{subject.top_up(91)}.to raise_error("top up exceeds balance limit")
      end

    describe "#withdraw" do

      it { is_expected.to respond_to(:withdraw).with(1).argument }

      it "withdraws when method #withdraw is invoked" do
        subject.top_up(10)
        expect{ subject.withdraw(5)}.to change{subject.balance}.by -5
      end
    end
    end
  end

  context "card touch ability" do

    it { is_expected.to respond_to(:touch_in)}

    it "allows owner to touch in" do
      subject.touch_in
      expect(subject).to be_in_journey
    end

    it "Raises an error if your balance is too low" do
      expect{subject.touch_in}.to raise_error("Balance too low")
    end


    it { is_expected.to respond_to(:touch_out)}

    it "allows owner to touch out" do
      subject.touch_in
      subject.touch_out
      expect(subject).not_to be_in_journey
    end


  end

end
