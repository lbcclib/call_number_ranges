# frozen_string_literal: true

require 'call_number_ranges/version'

DISCIPLINES = {
  'Accessibility' => Regexp.new('^(HV155[3-9]|HV15[6-9][0-9]|HV1[6-9][0-9]{2}|HV2[0-9]{3}|HV300[0-4]|'\
                                'KF480|LC481[2-9]|LC48[2-9][0-9]|LC49[01][0-9]|LC492[0-8]|'\
                                'NA2547|'\
                                'RA440|RC553.A88|RC569\.[7-9]|RC57[0-4])'),
  'Accounting' => /^HF(56[0-9]{2})(\.|\s)/,
  'Agriculture' => Regexp.new('^(HD140[1-9]|HD14[1-9][0-9]|HD1[5-9][0-9]{2}|HD2[01][0-9]{2}|HD220[0-9]|HD2210|'\
                              'S[0-9]+|SF1?[0-9]{,2}|SF2[0-48-9][0-9]|SF27[6-9]|'\
                              'TJ148[0-9]|TJ149[0-6])'),
  'Anthropology' => /^(CC|GN|GR|GT|E[5-9][0-9](\.|\s)|PM[0-9]{1,3}(\.|\s)|PM[1-7][0-9]{3}(\.|\s))/,
  'Automotive technology' => /^TL(\.|\s)/,
  'Aviation science' => /^(TL[56][0-9]{2}|7[0-7][0-9]|78[0-5])(\.|\s)/,
  'Biology' => Regexp.new('^(GE[0-9]|'\
                          'Q[12]?[0-9]{,2}(\.|\s)|QH[0-9]|QK[0-9]|QL[0-9]|QM[0-9]|QP[0-9]|QR[0-9]|'\
                          'S59[0-9]|S6[0-5][0-9]|S66[0-7]|SB|SD|SH|'\
                          'TP248\.1[3-9]|TP248\.[2-5]|TP248\.6[0-5])'),
  'Business' => /^(HB[0-9]|HC[0-9]|HD[0-9]|HE[0-9]|HF[0-9]|HG[0-9]|HJ[0-9])/,
  'Ceramics' => /^(NK3[7-9][0-9]{2}|NK4[0-5][0-9]{2}|NK46[0-8][0-9]|NK469[0-4]|TT919|TT92[0-7])(\.|\s)/,
  'Communication' => /^(GN345\.6|HM258|P8[7-9]|P9[0-6]|PN4[0-2][0-9]{2}|PN43[01][0-9]|PN432[01])(\.|\s)/,
  'Computer science' => Regexp.new('^(HD69\.P75|HF5548\.[45]|'\
                                   'Q3[3-9][0-9]|QA7[56]\.[5-9][0-9]*|QA16[4-9]|'\
                                   'T14\.5|T36|T57|T58\.[56][0-9]*|TJ211|TJ223|TK5105)(\.|\s)'),
  'Counseling' => /^(BF636|LB2343)(\.|\s)/,
  'Criminal justice' => Regexp.new('^(HV[678][0-9]{3}|HV9[0-8][0-9]{2}|HV99[01][0-9]|HV9920|'\
                                   'KF9[67][0-9]{2}|KF98[01][0-9]|KF982[0-7])'),
  'Culinary arts' => Regexp.new('^(SF2[56][0-9]|SF27[0-5]|'\
                                'TP5[0-9]{2}|TP6[0-7][0-9]|TP68[0-4]|'\
                                'TX(537|545|63[1-9]|6[4-9][0-9]|[78][0-9]{2}|9[0-4][0-9]|95[0-3]))'),
  'Dental assisting' => /^(RK[0-9]+|QM535)(\.|\s)/,
  'Developmental studies' => /^LB2331\.2/,
  'Diagnostic imaging' => /^RC78\.7/,
  'Drafting and engineering graphics' => /^(T35[1-9]|T36[0-9]|T37[01]|TA174)(\.|\s)/,
  'Earth sciences' => /^(Q[12]?[0-9]{,2}(\.|\s)|GE|QE|SD|SH|SK)/,
  'Education and HDFS' => Regexp.new('^(GN480|GT24[6-8][0-9]|GT2490|'\
                                     'HV699|HV[7-9][0-9]{2}|HV1[0-3][0-9]{2}|14[0-4][0-9]|'\
                                     'HQ75\.27|HQ75\.53|HQ77[789]|HQ78[01]|HQ79[3-9]|'\
                                     'L[ABC]?[0-9]+)(\.|\s)'),
  'Engineering' => /^(T[AJK][0-9]+|TP15[56])(\.|\s)/,
  'English and writing' => /^(LB2360|P[0-9EN-Z]|T11(\.|\s)|T11\.[0-5]|ZA3075)/,
  'English Language Acquisition' => Regexp.new('^(LB1572|LB1576|'\
                                               'P51|P11[89]|P12[01]|PE110[89]|PE111[0-4]|PE1128\.A2|PE113[1-9]|PE1404)'\
                                               '(\.|\s)'),
  'Equine science' => /^SF3[0-9]{2}(\.|\s)/,
  'Equity, diversity, and inclusion' => Regexp.new('^(BF575\.P9|'\
                                                   'E184\.A1|E185\.6|'\
                                                   'GN345\.6|GN469|GN495\.8|'\
                                                   'HF5549\.5\.A34|HF5549\.5\.M5|'\
                                                   'HM146|HM671|'\
                                                   'HN90\.(E4|M26|M84|P57|P6|S6)|'\
                                                   'HT150[1-9]|HT151[0-9]|HT152[01]|'\
                                                   'K3242|'\
                                                   'LB237[56]|'\
                                                   'LC19[1-9]|LC20[0-9]|LC21[0-3]|LC214\.[0-4]|LC214\.5[0-3]|'\
                                                   'LC1099|LC1[1-9][0-9]{2}|LC[234][0-9]{3}|LC50[0-9]{2}|LC51[0-5][0-9])'\
                                                   '(\.|\s)'),
  'Film studies' => /^(PN199[3-8]|TR84[5-9]|TR8[5-9][0-9]|TR9[01][0-9]|TR92[0-3])(\.|\s)/,
  'Health, Human Performance, Athletics and PE' => Regexp.new('^(GV20[1-9]|GV2[1-9][0-9]|GV[3-9][0-9]{2}|'\
                                                   'GV10[0-9]{2}|GV11[0-8][0-9]|GV119[0-8]|'\
                                                   'RC12[0-3][0-9]|RC124[0-5])(\.|\s)'),
  'Health informatics' => /^R85[89]|R86[0-4](\.|\s)/,
  'Heavy equipment/diesel' => /^TJ(\.|\s)/,
  'History' => /^([CDEF][0-9]+)(\.|\s)/,
  'International admissions' => /^LB237[56]/,
  'Journalism' => /^PN(4699|4[7-9][0-9]{2}|5[0-5][0-9]{2}|56[0-5][0-9])/,
  'Machine tool' => /^(TJ11[89][0-9]|TJ1[012][0-9]{2}|TJ130[0-9]|TJ131[0-3])/,
  'Math' => /^(HA|QA[1-6]|QA7[0-5]|QA7[89]|QA[89])/,
  'Mechatronics' => /^(TJ163\.12|TK7875)/,
  'Medical assisting' => Regexp.new('^(HG937[1-9]|HG93[89][0-9]|QM[0-9]+|'\
                                    'R118|R123|R728\.8|'\
                                    'RA[1-9]|RA[1-9][0-9]|RA[123][0-9]{2}|RA40[0-9]|RA41[0-5]|'\
                                    'RC683.5.E5|RS[0-9]+)(\.|\s)'),
  'Music' => /^(M|ML|MT)[0-9]+/,
  'Non-destructive testing' => /^TA417\.[2-5]/,
  'Nursing' => Regexp.new('^((GN484\.38)|'\
                          '(QM|R[GST])[0-9]+|'\
                          'QP([0-9]|[123][0-9]|4[01]|91|249|267|'\
                          '3[035][1-6]|32[1-9]|361|50[1-9]|51[0-8]|55[1-9]|5[6-9][0-9]|'\
                          '6[0-9]{2}|7[0-4][0-9]|75[0-2])(\.|\s))'),
  'Occupational therapy' => /^(BF71[2-9]|BF72[1-3]|BF724|QM[0-9]+|RM69[5-9]|RM[78][0-9]{2}|RM9[0-4][0-9]|RM950)(\.|\s)/,
  'Philosophy' => /^(B[0-9]+|BJ[1-9]|BJ[1-9][0-9]{1,2}|BJ1[0-5][0-9]{2}|BJ16[0-8][0-9]|BJ169[0-7])(\.|\s)/,
  'Physical sciences' => /^(Q[12]?[0-9]{,2}(\.|\s)|Q[BCD]?[0-9]+|TX545(\.|\s))/,
  'Polysomnographic technology' => /^(BF(106[89]|107[0-3])|QP42[5-7]|RA78[56]|RC54[7-9]|RC737\.5)(\.|\s)/,
  'Psychology' => /^(BF[0-9]+|R726\.[5-8]|RA785|RC32[1-9]|RC3[3-9][0-9]|RC4[0-9]{2}|RC5[0-6][0-9]|RC57[01])(\.|\s)/,
  'Public safety' => /^(HV8290|LB2866|QE53[1-9]|QE54[01])(\.|\s)/,
  'Queer studies' => /^(BF692|HQ7[5-7])/,
  'Religion' => Regexp.new('^(B[LMPQRSTVX][0-9]+|DS1[0-4][0-9]|KB[0-9]+|'\
                           'LC32[1-9]|LC3[3-9][0-9]|LC[4-8][0-9]{2}|LC9[012][0-9])(\.|\s)'),
  'Small business' => /^(HD67\.2|HD2340\.[89]|HD234[0-5]|HD2346\.[0-5]|HF5679)/,
  'Sociology' => /^(E184|H[MNQSTV][0-9]+)/,
  'Spanish' => Regexp.new('^(PC407[3-9]|PC4[1-8][0-9]{2}|PC49[0-6][0-9]|PC497[01]|'\
                          'PQ603[7-9]|PQ60[4-9][0-9]|PQ6[1-7][0-9]{2}|PQ8[0-4][0-9]{2}|PQ85[01][0-9])'),
  'Surgery' => /^(RD\n+|QM\n+|QR[1-9]|QR[1-6][0-9]|QR7[0-4]|R72[3-6])(\.|\s)/,
  'Visual arts' => /^(N[0-9]|NA|NB|NC|ND|NE|NK|NX|TR|TT919|TT92[0-7])/,
  'Visual communication' => /^(NC99[7-9]|NC100[0-3]|N7433\.8|NC915\.C65|NK15[2-4][0-9]|TK5105\.888|Z246|Z250)(\.|\s)/,
  'Water, Environment and Technology' => /^TD7(4[1-9]|[5-7][0-9]|80)(\.|\s)/,
  'Web technologies' => Regexp.new('(QA76\.76\s?\.H94|QA76\.73\s?\.J39|'\
                                   'QA76\.73\s?\.P224|QA76\.73\s?\.R83|QA76\.73\s?\.S67|'\
                                   'TK5105\.888)'),
  'Welding' => /^(NB1220|TH6711|TK4660|TS21[5-9]|TS22[0-8]|TS280|TT211)(\.|\s)/,
  "Women's studies" => /^BF692|HQ(11[1-9]|1[2-9][0-9]|[2-9][0-9]{2}|10[0-57-9][0-9]{2}|1[1-9][0-9]{2})(\.|\s)/
}.freeze

module CallNumberRanges
  # Helpful if you have a call number, but want to see
  # what disciplines match
  class CallNumber
    def self.disciplines(call_number)
      DISCIPLINES.select { |_name, range| call_number.match? range }.keys
    end
  end
end
