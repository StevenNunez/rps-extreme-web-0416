describe Judge do
  let(:judge) {Judge.new}
  it "knows winning combinations" do
    expect(judge.judge(:rock, :scissors)).to eq(:win)
    expect(judge.judge(:scissors, :paper)).to eq(:win)
    expect(judge.judge(:paper, :rock)).to eq(:win)
  end

  it "knows how ties works" do
    expect(judge.judge(:rock, :rock)).to eq(:tie)
  end

  it "knows losing combinations" do
    expect(judge.judge(:scissors, :rock)).to eq(:lose)
    expect(judge.judge(:rock, :paper)).to eq(:lose)
    expect(judge.judge(:paper, :scissors)).to eq(:lose)
  end

  it "knows how to deal with bogus types" do
    expect(judge.judge(:trumpet, :shoe)).to eq(:fail)
    expect(judge.judge(:rock, :shoe)).to eq(:fail)
    expect(judge.judge(:trumpet, :paper)).to eq(:fail)
  end
end
