--DROP TABLE FinancialFacts;

--DROP TABLE IndicatorDimension;

--DROP TABLE CountriesDimension;

CREATE TABLE CountriesDimension (
	CountryDimensionPK INT PRIMARY KEY IDENTITY(1,1),
	CountryCode NVARCHAR(255),
	CountryName NVARCHAR(400),
	Region NVARCHAR(255),
	IncomeGroup NVARCHAR(255),
	SpecialNotes NVARCHAR(4000)
);

CREATE TABLE IndicatorDimension (
	IndicatorDimensionPK INT PRIMARY KEY IDENTITY(1,1),
	IndicatorCode NVARCHAR(100),
	IndicatorName NVARCHAR(400),
	SourceNote NVARCHAR(4000)
);

CREATE TABLE TimeIndicator (
	TimeIndicatorPK INT PRIMARY KEY IDENTITY(1,1),
	CorrespondingYear INT
);

CREATE TABLE FinancialFacts (
	CountryDimensionFK INT,
	IndicatorDimensionFK INT,
	TimeIndicatorFK INT,
	Value FLOAT,
	CONSTRAINT fk_CountryDimension FOREIGN KEY (CountryDimensionFK) REFERENCES CountriesDimension(CountryDimensionPK) ON DELETE CASCADE,
	CONSTRAINT fk_IndicatorDimension FOREIGN KEY (IndicatorDimensionFK) REFERENCES IndicatorDimension(IndicatorDimensionPK) ON DELETE CASCADE,
	CONSTRAINT fk_TimeIndicator FOREIGN KEY (TimeIndicatorFK) REFERENCES TimeIndicator(TimeIndicatorPK) ON DELETE CASCADE,
);