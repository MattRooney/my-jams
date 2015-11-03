require 'test_helper'

class SongTest < ActiveSupport::TestCase

  def valid_attributes
    {
      title: "The Less I Know the Better",
      artist: "Tame Impala"
    }
  end

  test "song created with valid attributes" do
    song = Song.new(valid_attributes)

    assert song.valid?
  end

  test "song is invalid without title" do
    song = Song.new(artist: "Bonnie Prince Billy")

    refute song.valid?
  end

  test "song is invalid without artist" do
    song = Song.new(title: "pulp")

    refute song.valid?
  end


end
