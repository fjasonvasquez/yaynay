require_relative "../../app/services/score_cache"

class CachedScore
end

describe ScoreCache do
	it "returns cached yay if they exist" do
		CachedScore.stub(:for_term).with("microsoft") { 5.5 }
		YayCache.for_term("microsoft").should == 5.5
	end


	it "recomputes yay if they don't exist"
	it "stores new yay in the database"
end