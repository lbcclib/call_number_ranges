# frozen_string_literal: true

EXAMPLE_CALL_NUMBERS = {
  'HF5635 .E33 2000' => ['Accounting', 'Business'],
  'S591.P584 2014' => %w[Agriculture Biology],
  'E99.A35 S75 2018' => %w[Anthropology History],
  'QH91.M59 2020' => ['Biology'],
  'TT922 .K56 2018' => ['Ceramics', 'Visual arts'],
  'TX747 .N54 2019' => ['Culinary arts'],
  'PS3607.A694 T48 2020' => ['English and writing'],
  'QA39.3.M384 2011' => ['Math'],
  'ML3477 .S75 2019' => ['Music'],
  'RT120.I5 C766 2020' => ['Nursing'],
  'TS227 .M268 2002' => ['Welding']
}.freeze

RSpec.describe CallNumberRanges do
  it 'has a version number' do
    expect(CallNumberRanges::VERSION).not_to be nil
  end

  EXAMPLE_CALL_NUMBERS.each do |call_number, expected_disciplines|
    it "knows that #{call_number} belongs in #{expected_disciplines.join ' and '}" do
      expect(CallNumberRanges::CallNumber.disciplines(call_number)).to eql(expected_disciplines)
    end
  end

  it "does not put Death and Dying into Women's studies" do
    expect(CallNumberRanges::CallNumber.disciplines('HQ1073 .D68 2019'))
           .not_to include("Women's studies")
  end
end
