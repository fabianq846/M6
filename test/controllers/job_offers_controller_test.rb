require "test_helper"

class JobOffersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get job_offers_url
    assert_response :success
  end

  test "should show job offer" do
    offer = job_offers(:one) # Assuming you have a fixture for this
    get job_offer_url(offer)
    assert_response :success
  end
end
