require(File.dirname(__FILE__) + "/test_helper")

module FriendlyId

  module Test

    class FriendlyIdTest < ::Test::Unit::TestCase

      test "should parse a friendly_id name and sequence" do
        assert_equal ["test", "2"], "test--2".parse_friendly_id
      end

      test "should parse a friendly_id name and 10 as a sequence" do
        assert_equal ["test", "10"], "test--10".parse_friendly_id
      end

      test "should parse a friendly_id name and 11 as a sequence" do
        assert_equal ["test", "11"], "test--11".parse_friendly_id
      end

      test "should parse a friendly_id name and 29 as a sequence" do
        assert_equal ["test", "29"], "test--29".parse_friendly_id
      end

      test "should parse with a default sequence of 1" do
        assert_equal ["test", "1"], "test".parse_friendly_id
      end

      test "should be parseable with a custom separator" do
        assert_equal ["test", "2"], "test:2".parse_friendly_id(":")
      end

      test "should be parseable with a custom separator and a double digit sequence" do
        assert_equal ["test", "12"], "test:12".parse_friendly_id(":")
      end

      test "should parse when default sequence separator occurs in friendly_id name" do
        assert_equal ["test--test", "2"], "test--test--2".parse_friendly_id
      end

      test "should parse when custom sequence separator occurs in friendly_id name" do
        assert_equal ["test:test", "2"], "test:test:2".parse_friendly_id(":")
      end

      test "should parse when sequence separator and number occur in friendly_id name" do
        assert_equal ["test--2--test", "1"], "test--2--test".parse_friendly_id
      end

      test "should parse when sequence separator, number and sequence occur in friendly_id name" do
        assert_equal ["test--2--test", "2"], "test--2--test--2".parse_friendly_id
      end

      test "should parse when double digit sequence separator, number and sequence occur in friendly_id name" do
        assert_equal ["test--2--test", "12"], "test--2--test--12".parse_friendly_id
      end


    end
  end
end
