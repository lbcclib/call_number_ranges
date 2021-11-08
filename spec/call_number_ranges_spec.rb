# frozen_string_literal: true

EXAMPLE_CALL_NUMBERS = {
  'BF692.L476 2017' => ['Psychology', 'Queer studies', "Women's studies"],
  'E99.A35 S75 2018' => %w[Anthropology History],
  'HF5635 .E33 2000' => %w[Accounting Business],
  'HQ76.96 .J37 2019' => ['Queer studies', 'Sociology'],
  'ML3477 .S75 2019' => ['Music'],
  'NB1220 .H3' => ['Welding', 'Visual arts'],
  'QH91.M59 2020' => ['Biology'],
  'PS3607.A694 T48 2020' => ['English and writing'],
  'QA39.3.M384 2011' => ['Math'],
  'QP306 .D558 2018' => %w[Biology Music Nursing],
  'RT120.I5 C766 2020' => ['Nursing'],
  'S591.P584 2014' => %w[Agriculture Biology],
  'TH6711.E38 2006' => ['Welding'],
  'TJ184 .L39 2018' => ['Engineering', 'Machine tool'],
  'TK4660 .J39 2015' => %w[Engineering Welding],
  'TP359.B46 E87 2015' => ['Automotive technology'],
  'TS227 .M268 2002' => ['Welding'],
  'TS280 .G72 1979' => ['Welding'],
  'TT922 .K56 2018' => ['Ceramics', 'Visual arts'],
  'TX747 .N54 2019' => ['Culinary arts']
}.freeze

RSpec.describe CallNumberRanges do
  it 'has a version number' do
    expect(CallNumberRanges::VERSION).not_to be nil
  end

  EXAMPLE_CALL_NUMBERS.each do |call_number, expected_disciplines|
    it "knows that #{call_number} belongs in #{expected_disciplines.join ' and '}" do
      expect(CallNumberRanges::CallNumber.disciplines(call_number)).to match_array(expected_disciplines)
    end
  end

  it "does not put Death and Dying into Women's studies" do
    expect(CallNumberRanges::CallNumber.disciplines('HQ1073 .D68 2019'))
      .not_to include("Women's studies")
  end
end
