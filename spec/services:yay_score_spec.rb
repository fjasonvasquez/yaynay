require_relative "../../app/services/yay_score"
require_relative "../../app/services/search_engine"

describe YayScore do
	it "returns 0 for unpopular terms" do
		SearchEngine.stub(:count_results).with("apple yay") { 0 }
		SearchEngine.stub(:count_results).with("apple nay") { 1 }
		YayScore.for_term("apple").should == 0.0
	end
	it "returns 10 for popular terms" do
		SearchEngine.stub(:count_results).with("apple yay") { 0 }
		SearchEngine.stub(:count_results).with("apple nay") { 1 }
		YayScore.for_term("apple").should == 10.0
	end

	it "returns mediocre results for mediocre terms" do
		SearchEngine.stub(:count_results).with("apple yay") { 9 }
		SearchEngine.stub(:count_results).with("apple nay") { 11 }
		YayScore.for_term("apple").should == 4.5
	end

	it "does not divide by zero" do
		SearchEngine.stub(:count_results).with("apple yay") { 0 }
		SearchEngine.stub(:count_results).with("apple nay") { 0 }
		YayScore.for_term("apple").should == YayScore::NoScore
	end
end