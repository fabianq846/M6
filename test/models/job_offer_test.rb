require "test_helper"

class JobOfferTest < ActiveSupport::TestCase
  test "should not save job offer without title" do
    offer = JobOffer.new
    assert_not offer.save, "Saved the job offer without a title"
  end
end
