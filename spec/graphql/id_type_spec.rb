require 'spec_helper'

describe GraphQL::ID_TYPE do
  let(:result) { DummySchema.execute(query_string)}

  describe 'coercion for int inputs' do
    let(:query_string) { %|query getMilk { cow: milk(id: 1) { id } }| }

    it 'coerces IDs from ints and serializes as strings' do
      expected = {"data" => {"cow" => {"id" => "1"}}}
      assert_equal(expected, result)
    end
  end

  describe 'coercion for string inputs' do
    let(:query_string) { %|query getMilk { cow: milk(id: "1") { id } }| }

    it 'coerces IDs from strings and serializes as strings' do
      expected = {"data" => {"cow" => {"id" => "1"}}}
      assert_equal(expected, result)
    end
  end
end
