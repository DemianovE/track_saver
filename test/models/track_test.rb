require "test_helper"

class TrackTest < ActiveSupport::TestCase
=begin
  test "should be valid" do
    track = Track.new(name: "Example", startdate: DateTime.new(2022, 1, 1, 0, 0, 0))
    assert track.valid?
  end

  test "should be invalid without name" do
    model = Track.new(startdate: DateTime.new(2022, 1, 1, 0, 0, 0))
    assert_not track.valid?
  end

  test "should be invalid without startdate" do
    track = Track.new(name: "Example")
    assert_not track.valid?
  end
=end
end
