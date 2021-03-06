FactoryGirl.define do

  factory :office, class: Office do
    before(:create) do |office|
      office.attributes = {
        "id": 4,
        "P_NAME": "BRIARCLIFF RD#4805/NORTHLAKE PROMENADE",
        "PROJECT_TYPE": "S",
        "P_STREET_NUMBER": "4805",
        "P_STREET_NAME": "BRIARCLIFF RD",
        "P_CROSS_STREET_NAME": "HENDERSON MILL/LAVISTA RD",
        "P_CITY": "ATLANTA",
        "P_ZIP": "30345",
        "COUNTY": "DEKALB",
        "DISTRICT2": "",
        "SQUARE": "4",
        "PARCEL": "59",
        "ZONING": "",
        "ZONING_PERMITTING_DATE": "",
        "SF_LAND": "63641.16",
        "land_sale_date": '2017-01-01',
        "LAND_SALE_PRICE": 0,
        "PRICE_PER_ACRE": "",
        "PRICE_PER_SF_LAND": "",
        "sale_date": "2016-12-28",
        "SALE_PRICE": "4200000.00",
        "PRICE_PER_SF_BUILDING": "253.012",
        "TAX_OWNER": "MALAKSHMI LLC",
        "O_STREET_NAME": "QUAIL PINE DR",
        "O_CITY": "LEESBURG",
        "O_PHONE": "(229) 883-8657",
        "O_REP": "SAMRAJYA GOGINENI",
        "B_STREET_NAME": "PEACHTREE RD",
        "B_CITY": "ATLANTA",
        "ARCHITECT": "",
        "PLANNER": "1",
        "PREVIOUS_INSIDER_DATE_1": "9/14/12",
        "PREVIOUS_INSIDER_DATE_2": "4/20/99",
        "PREVIOUS_INSIDER_DATE_3": "2/12/92",
        "YEARLY_INCOME": "",
        "SELLER": "PWREO BRIARCLIFF/PACIFIC WEST LAND",
        "S_STREET_NAME": "MADISON AVE NORTH",
        "S_CITY": "BAINBRIDGE ISLAND",
        "S_STATE": "GA",
        "BROKER": "CBRE",
        "BROKER_PHONE": "(404) 504-7900",
        "PERMANENT_LOAN": "2100000",
        "LENDER": "GENWORTH LIFE",
        "L_STREET_NUMBER": "6620",
        "L_CITY": "RICHMOND",
        "L_PHONE": "(888) 436-9678",
        "CONSTRUCTION_LOAN": "",
        "C_LENDER": "",
        "C_L_STREET_NUMBER": "",
        "C_L_CITY": "",
        "C_L_PHONE": "",
        "C_L_REP": "",
        "LEASING_REP": "SAMRAJHA GOGINENI,ETAL",
        "EQUITY": "2100000",
        "PERCENTAGE_EQUITY": "",
        "DOWNPAYMENT": "2100000",
        "PERCENTAGE_DOWNPAYMENT": "",
        "UNDERLYING": "",
        "PURCHASE_NOTE": "",
        "ASKING_PRICE": "",
        "DESCRIPTION": "RETAIL/SHOPPING SALE",
        "AKA": "LAVISTA PROMENADE",
        "SURVEY": "SURVEY",
        "PERMITTED": "10/6/87",
        "INSIDER_SORT": "6",
        "insider_date": "2016-12-30",
        "LEASING_PHONE": "(229) 883-8657",
        "O_STREET_NUMBER": "135",
        "O_STATE": "GA",
        "O_ZIP": "31763",
        "LEASING_STREET_NUMBER": "135",
        "LEASING_STREET_NAME": "QUAIL PINE DR",
        "LEASING_CITY": "LEESBURG",
        "LEASING_ZIP": "31763",
        "LEASING_SUITE_NUMBER": "",
        "O_SUITE_NUMBER": "",
        "LEASING_STATE": "GA",
        "P_STATE": "GA",
        "OCCUPIED": "",
        "VACANT": "",
        "LOW_RENT": "22",
        "START": "",
        "LEASED_PREVIOUS_90_DAYS": "",
        "M1": "CB RICHARD ELLIS(CRAIG TAYLOR)BROKERED 12/28/16,",
        "M2": "PACIFIC WEST LAND/PWL TO MALAKSHMI LLC;",
        "M3": "16,600*SF,BLT 1986, 1.461*ACS;97%OCCUP;NO INFO:CAP.",
        "M4": "PRICE:$4.2MIL($253/SF);$2.1MIL EQ+NEW LN:$2.1MIL,10?YR;",
        "M5": "LENDER:UNKNOWN TO US;DDBK?,PG? *PACIFIC WEST BOUGHT IT",
        "HIGH_RENT": "22",
        "LEASING_P_O_BOX_NUMBER": "",
        "O_P_O_BOX_NUMBER": "",
        "M6": "AS PART OF 25,388 SF 9/6/12($3.4MIL(134/SF); 8,530 SF",
        "M7": "OF IT WAS SOLD TO ENVISION ATLANTA 4/23/13($1.83MIL",
        "2ND_97": "",
        "AFTER_3_YEARS": "",
        "MARKET_AREA": "8",
        "LEASING_REP2": "",
        "O_REP2": "",
        "ANCHOR1": "AT\u0026T/BELLSOUTH MOBILITY",
        "ANCHOR2": "FEDEX-KINKOS,COAST DENTAL,ETAL",
        "B_STREET_NUMBER": "3280",
        "B_P_O_BOX_NUMBER": "",
        "B_REP2": "FAISAL SUPARIWALA REAL ESTATE",
        "B_REP": "CRAIG TAYLOR",
        "S_STREET_NUMBER": "403",
        "S_P_O_BOX_NUMBER": "",
        "S_ZIP": "98110",
        "S_PHONE": "(206) 780-4040",
        "S_REP2": "JOSH TREYVE;MARTIN SLEVER,DENNIS JOHNSON,ETAL",
        "L_REP": "DANIEL SHEEHAN,ETAL",
        "L_REP2": "",
        "L_P_O_BOX_NUMBER": "",
        "L_STREET_NAME": "WEST BROAD ST",
        "L_STATE": "VA",
        "L_ZIP": "23230",
        "C_L_REP2": "",
        "C_L_STREET_NAME": "",
        "C_L_P_O_BOX_NUMBER": "",
        "C_L_STATE": "",
        "C_L_ZIP": "",
        "S_REP": "BRUCE GALLOWAY,ETAL",
        "S_SUITE_NUMBER": "#230",
        "B_SUITE_NUMBER": "#1400",
        "B_STATE": "GA",
        "B_ZIP": "30305",
        "L_SUITE_NUMBER": "",
        "#_ACRES": 1,
        "#_SQ_FT_BUILT": "16600",
        "PREVIOUS_OCCUPIED": "",
        "PREVIOUS_VACANT": "",
        "UNBUILT_PHASE_2_SF": "",
        "PHASE_3_SF": "",
        "DISTRICT": "18",
        "LANDLOT2": "",
        "PARCEL2": "",
        "PREVIOUS_SQ_FT_BUILT": "35000",
        "SECTION": "",
        "2ND_OWNER_PHONE": "",
        "LEASING_PHONE2": "(229) 883-1536",
        "LANDLOT": "209",
        "CLASSIFICATION": "",
        "C_L_SUITE_NUMBER": "",
        "#_OF_BUILDINGS": "",
        "2ND_OWNER": "",
        "CLASSIFICATION2": "",
        "CLASSIFICATION3": "",
        "LOAN_PER_SQ_FT": "126.5",
        "C_LOAN_PER_SQ_FT": "",
        "1ST_98": "",
        "OCCTEST": "0",
        "foreclosure_date": '2017-01-01',
        "ASSUMED_LOAN": "",
        "O_PHONE2_FAX": "(229) 883-1536",
        "M8": "($215/SF);THUS,THE ORIGINAL PROP IS NOW 16,600 SF;",
        "M9": "DEKALB ASSESSORS ESTIM 2016 VALUE ON THE 16,600 SF:",
        "M10": "$2.298MIL($138/SF). *NOW 1.461 ACS;ORIGINAL:2.86 ACS.",
        "2ND_95": "",
        "PHASE_4_SF": "",
        "MEDIAN_RENTAL_RATE": "14",
        "LEASE_TERMS": "",
        "LOAN_START_DATE": "12/29/16",
        "LOAN_COMPLETE_DATE": "1/1/27",
        "LOAN_TERMS": "",
        "C_LOAN_START_DATE": "",
        "C_LOAN_COMPLETE_DATE": "",
        "C_LOAN_TERMS": "",
        "OWNER": "MALAKSHMI LLC/GOGINENI",
        "LEASING_COMPANY": "MALAKSHMI LLC",
        "LEASE_TERMS_ALLOWANCE": "",
        "2ND_OWNER_REP": "",
        "2ND_OWNER_REP2": "",
        "2ND_OWNER_STREET_NUMBER": "",
        "2ND_OWNER_P_O_BOX_NUMBER": "",
        "2ND_OWNER_STREET_NAME": "",
        "2ND_OWNER_SUITE_NUMBER": "",
        "2ND_OWNER_CITY": "",
        "2ND_OWNER_STATE": "",
        "2ND_OWNER_ZIP": "",
        "2ND_OWNER_PHONE2_FAX": "",
        "FAX": "(404) 698-2222",
        "PERCENTAGE_VACANCY": "",
        "MANAGEMENT_COMPANY": "MALAKSHMI",
        "MANAGEMENT_REP": "SAMRAJHA GOGINENI,ETAL",
        "MANAGEMENT_REP2": "",
        "MANAGEMENT_STREET_NUMBER": "135",
        "MANAGEMENT_P_O_BOX_NUMBER": "",
        "MANAGEMENT_STREET_NAME": "QUAIL PINE DR",
        "MANAGEMENT_SUITE_NUMBER": "",
        "MANAGEMENT_CITY": "LEESBURG",
        "MANAGEMENT_STATE": "GA",
        "MANAGEMENT_ZIP": "31763",
        "MANAGEMENT_PHONE": "(229) 883-8657",
        "MANAGEMENT_PHONE2_FAX": "(229) 883-1536",
        "ATTENTION": "SAMRAJYA GOGINENI",
        "built_complete": "1986-01-01",
        "ORIGINALLY_BUILT": "",
        "ATTENTION2": "",
        "S_PHONE2_FAX": "",
        "B_PHONE2_FAX": "",
        "L_PHONE2_FAX": "",
        "C_L_PHONE2_FAX": "",
        "1ST_96": "",
        "UNITS": nil,
        "RESULTS": "",
        "INSIDER_DESCRIPTION": "RETAIL/SHOPPING SALE",
        "PURCHASE_NOTE_START_DATE": "",
        "PURCHASE_NOTE_DUE_DATE": "",
        "CAP_RATE": "",
        "GROSS_NET": "",
        "2ND_96": "",
        "FLOORS": "",
        "1ST_97": "",
        "FORECLOSED_PRICE": "",
        "ATTORNEY": "KITCHENS-KELLEY,BARBARA LINCOLN",
        "ATTORNEY_PHONE": "(404) 237-4100",
        "EXISTING_PERMANENT_LOAN": "4.23E-307",
        "EXISTING_CONSTRUCITON_LOAN": "133193.5319",
        "KEY_PLAYER": "TE"
      }
    end
  end

  factory :office2, class: Office do
    before(:create) do |office|
      office.attributes = {
        "id": 387,
        "P_NAME": "CHILDRENS HEALTHCARE",
        "PROJECT_TYPE": "O",
        "P_STREET_NUMBER": "2580",
        "P_STREET_NAME": "BRIARCLIFF RD",
        "P_CROSS_STREET_NAME": "TULLIE CIRCLE/WOODCLIFF DR",
        "P_CITY": "ATLANTA",
        "P_ZIP": "30329",
        "COUNTY": "DEKALB",
        "DISTRICT2": "",
        "SQUARE": "1",
        "PARCEL": "1",
        "ZONING": "",
        "ZONING_PERMITTING_DATE": "",
        "SF_LAND": "168141.6",
        "land_sale_date": "2016-08-01",
        "LAND_SALE_PRICE": 6900000,
        "PRICE_PER_ACRE": "1787564.767",
        "PRICE_PER_SF_LAND": "41.03",
        "sale_date": '2017-01-01',
        "SALE_PRICE": "",
        "PRICE_PER_SF_BUILDING": "",
        "TAX_OWNER": "CHILDREN'S HEALTHCARE OF ATLANTA",
        "O_STREET_NAME": "TULLIE CIRCLE",
        "O_CITY": "ATLANTA",
        "O_PHONE": "(404) 785-7600",
        "O_REP": "DONNA HYLAND,ETAL",
        "B_STREET_NAME": "",
        "B_CITY": "",
        "ARCHITECT": "",
        "PLANNER": "",
        "PREVIOUS_INSIDER_DATE_1": "",
        "PREVIOUS_INSIDER_DATE_2": "",
        "PREVIOUS_INSIDER_DATE_3": "",
        "YEARLY_INCOME": "",
        "SELLER": "EXECUTIVE PARK APARTMENTS/KENCO/CLAY EDWARDS",
        "S_STREET_NAME": "BRIARCLIFF RD",
        "S_CITY": "ATLANTA",
        "S_STATE": "GA",
        "BROKER": "UNKNOWN TO US",
        "BROKER_PHONE": "",
        "PERMANENT_LOAN": "",
        "LENDER": "",
        "L_STREET_NUMBER": "",
        "L_CITY": "",
        "L_PHONE": "",
        "CONSTRUCTION_LOAN": "",
        "C_LENDER": "",
        "C_L_STREET_NUMBER": "",
        "C_L_CITY": "",
        "C_L_PHONE": "",
        "C_L_REP": "",
        "LEASING_REP": "",
        "EQUITY": "",
        "PERCENTAGE_EQUITY": "",
        "DOWNPAYMENT": "",
        "PERCENTAGE_DOWNPAYMENT": "",
        "UNDERLYING": "",
        "PURCHASE_NOTE": "",
        "ASKING_PRICE": "",
        "DESCRIPTION": "OFFICE LAND SALE",
        "AKA": "",
        "SURVEY": "",
        "PERMITTED": "",
        "INSIDER_SORT": "3",
        "insider_date": "2016-08-12",
        "LEASING_PHONE": "",
        "O_STREET_NUMBER": "1600",
        "O_STATE": "GA",
        "O_ZIP": "30329",
        "LEASING_STREET_NUMBER": "",
        "LEASING_STREET_NAME": "",
        "LEASING_CITY": "",
        "LEASING_ZIP": "",
        "LEASING_SUITE_NUMBER": "",
        "O_SUITE_NUMBER": "",
        "LEASING_STATE": "",
        "P_STATE": "GA",
        "OCCUPIED": "",
        "VACANT": "",
        "LOW_RENT": "",
        "START": "",
        "LEASED_PREVIOUS_90_DAYS": "",
        "M1": "IS THE 8/1/16 LAND SALE,KENCO MGMNT/CLAY EDWARDS",
        "M2": "TO CHILDRENS HEALTHCARE;BROKER:UNKNOWN TO US YET;",
        "M3": "3.86*ACS;TO BUILD ? SF;TO BUILD SOMETIME 2017-2020;",
        "M4": "LAND PRICE:$6.9MIL($41/LAND SF),CASH;NO NEW LOAN.",
        "M5": "LENDER:NONE;DDBK25708,PG596;*THIS PROP IS 3.86 ACS;",
        "HIGH_RENT": "",
        "LEASING_P_O_BOX_NUMBER": "",
        "O_P_O_BOX_NUMBER": "",
        "M6": "PRESENTLY,IT HAS 50 APT UTS KNOWN AS EXECUTIVE",
        "M7": "PARK APTS;HOWEVER,WE BELIEVE IT IS PART OF AN",
        "2ND_97": "",
        "AFTER_3_YEARS": "",
        "MARKET_AREA": "9",
        "LEASING_REP2": "",
        "O_REP2": "LESLIE JONES,RUTH FOWLER,REX ADAMS,PATTY GREGORY",
        "ANCHOR1": "CHILDREN'S HEALTHCARE OF ATLANTA",
        "ANCHOR2": "",
        "B_STREET_NUMBER": "",
        "B_P_O_BOX_NUMBER": "",
        "B_REP2": "",
        "B_REP": "",
        "S_STREET_NUMBER": "2219",
        "S_P_O_BOX_NUMBER": "",
        "S_ZIP": "30329",
        "S_PHONE": "(404) 633-0401",
        "S_REP2": "",
        "L_REP": "",
        "L_REP2": "",
        "L_P_O_BOX_NUMBER": "",
        "L_STREET_NAME": "",
        "L_STATE": "",
        "L_ZIP": "",
        "C_L_REP2": "",
        "C_L_STREET_NAME": "",
        "C_L_P_O_BOX_NUMBER": "",
        "C_L_STATE": "",
        "C_L_ZIP": "",
        "S_REP": "CLAY EDWARDS,ETAL",
        "S_SUITE_NUMBER": "OFFICE",
        "B_SUITE_NUMBER": "",
        "B_STATE": "",
        "B_ZIP": "",
        "L_SUITE_NUMBER": "",
        "#_ACRES": 4,
        "#_SQ_FT_BUILT": "",
        "PREVIOUS_OCCUPIED": "",
        "PREVIOUS_VACANT": "",
        "UNBUILT_PHASE_2_SF": "",
        "PHASE_3_SF": "",
        "DISTRICT": "18",
        "LANDLOT2": "",
        "PARCEL2": "",
        "PREVIOUS_SQ_FT_BUILT": "",
        "SECTION": "",
        "2ND_OWNER_PHONE": "",
        "LEASING_PHONE2": "",
        "LANDLOT": "157",
        "CLASSIFICATION": "",
        "C_L_SUITE_NUMBER": "",
        "#_OF_BUILDINGS": "",
        "2ND_OWNER": "",
        "CLASSIFICATION2": "",
        "CLASSIFICATION3": "",
        "LOAN_PER_SQ_FT": "",
        "C_LOAN_PER_SQ_FT": "",
        "1ST_98": "",
        "OCCTEST": "",
        "foreclosure_date": '2017-01-01',
        "ASSUMED_LOAN": "",
        "O_PHONE2_FAX": "(404)785-7771;785-4483;570-9717",
        "M8": "ASSEMBLEDGE THE BUYER HAS BEEN INVOLVED IN FOR SOME",
        "M9": "TIME;ESTIMATED VALUE FOR THIS PART:$2.123MIL($13/",
        "M10": "LAND SF.",
        "2ND_95": "",
        "PHASE_4_SF": "",
        "MEDIAN_RENTAL_RATE": "",
        "LEASE_TERMS": "",
        "LOAN_START_DATE": "",
        "LOAN_COMPLETE_DATE": "",
        "LOAN_TERMS": "",
        "C_LOAN_START_DATE": "",
        "C_LOAN_COMPLETE_DATE": "",
        "C_LOAN_TERMS": "",
        "OWNER": "CHILDRENS HEALTHCARE OF ATLANTA",
        "LEASING_COMPANY": "",
        "LEASE_TERMS_ALLOWANCE": "",
        "2ND_OWNER_REP": "",
        "2ND_OWNER_REP2": "",
        "2ND_OWNER_STREET_NUMBER": "",
        "2ND_OWNER_P_O_BOX_NUMBER": "",
        "2ND_OWNER_STREET_NAME": "",
        "2ND_OWNER_SUITE_NUMBER": "",
        "2ND_OWNER_CITY": "",
        "2ND_OWNER_STATE": "",
        "2ND_OWNER_ZIP": "",
        "2ND_OWNER_PHONE2_FAX": "",
        "FAX": "",
        "PERCENTAGE_VACANCY": "",
        "MANAGEMENT_COMPANY": "CHILDREN'S HEALTHCARE OF ATLANTA",
        "MANAGEMENT_REP": "DONNA HYLAND,ETAL",
        "MANAGEMENT_REP2": "LESLIE JONES,RUTH FOWLER,ETAL",
        "MANAGEMENT_STREET_NUMBER": "1600",
        "MANAGEMENT_P_O_BOX_NUMBER": "",
        "MANAGEMENT_STREET_NAME": "TULLIE CIRCLE",
        "MANAGEMENT_SUITE_NUMBER": "",
        "MANAGEMENT_CITY": "ATLANTA",
        "MANAGEMENT_STATE": "GA",
        "MANAGEMENT_ZIP": "30329",
        "MANAGEMENT_PHONE": "(404) 785-7600",
        "MANAGEMENT_PHONE2_FAX": "(404)785-7771;785-4483;570-9717",
        "ATTENTION": "DONNA HYLAND,ETAL",
        "built_complete": "2017-12-31",
        "ORIGINALLY_BUILT": "12/31/18",
        "ATTENTION2": "",
        "S_PHONE2_FAX": "",
        "B_PHONE2_FAX": "",
        "L_PHONE2_FAX": "",
        "C_L_PHONE2_FAX": "",
        "1ST_96": "",
        "UNITS": nil,
        "RESULTS": "",
        "INSIDER_DESCRIPTION": "OFFICE LAND SALE",
        "PURCHASE_NOTE_START_DATE": "",
        "PURCHASE_NOTE_DUE_DATE": "",
        "CAP_RATE": "",
        "GROSS_NET": "",
        "2ND_96": "",
        "FLOORS": "",
        "1ST_97": "",
        "FORECLOSED_PRICE": "",
        "ATTORNEY": "MORRIS-MANNING,JUSTIN BARRY",
        "ATTORNEY_PHONE": "(404) 233-7000",
        "EXISTING_PERMANENT_LOAN": "",
        "EXISTING_CONSTRUCITON_LOAN": "",
        "KEY_PLAYER": ""
      }
    end
  end

end
