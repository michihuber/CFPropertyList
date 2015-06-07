require 'minitest/autorun'
$LOAD_PATH.unshift(File.expand_path("../../lib", __FILE__))
require_relative '../lib/cfpropertylist'

class TestIntegration < Minitest::Test
  def test_parse_corrupted_number_field_as_minus_1
    plist = CFPropertyList::List.new(file: "test/fixtures/corrupted.plist")
    data = CFPropertyList.native_types(plist.value)
    assert_equal data, {"mindMap"=>{"mainNodes"=>[{"subnodes"=>[{"subnodes"=>[{"subnodes"=>[{"subnodes"=>[{"title"=>{"fontStyle"=>{"good"=>-1, "corrupt"=>-1, "corrupt - copy"=>9223372036854775807}}}]}]}]}]}]}}
  end
end

