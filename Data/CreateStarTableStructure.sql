CREATE TABLE CountriesDimension (
	CountryDimensionPK INT PRIMARY KEY IDENTITY(1,1),
	CountryCode NVARCHAR(255),
	CountryName NVARCHAR(400),
	Region NVARCHAR(255),
	IncomeGroup NVARCHAR(255),
	SpecialNotes NVARCHAR(4000),
	[Current] NVARCHAR(50)
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

CREATE TABLE PrematureDeathsFacts (
	[CountryDimensionFK] [int] NOT NULL,
	[TimeIndicatorFK] [int] NOT NULL,
	[Number of infant deaths] [int],
	[Number of under-five deaths] [int],
	[Number of neonatal deaths] [int],
	CONSTRAINT fk_PrematureDeaths_CountryDimension FOREIGN KEY (CountryDimensionFK) REFERENCES CountriesDimension(CountryDimensionPK) ON DELETE CASCADE,
	CONSTRAINT fk_PrematureDeaths_IndicatorDimension FOREIGN KEY ([TimeIndicatorFK]) REFERENCES TimeIndicator(TimeIndicatorPK) ON DELETE CASCADE,
);

CREATE TABLE PopulationFacts (
	[CountryDimensionFK] [int] NOT NULL,
	[TimeIndicatorFK] [int] NOT NULL,
	[PopulationTotal] [bigint],
	[PopulationFemaleRate] [float],
	[Population ages 0 - 14] [float],
	[Population ages 15-65] [float],
	[Population ages 65 - above] [float],
	CONSTRAINT fk_PopulationFacts_CountryDimension FOREIGN KEY (CountryDimensionFK) REFERENCES CountriesDimension(CountryDimensionPK) ON DELETE CASCADE,
	CONSTRAINT fk_PopulationFacts_IndicatorDimension FOREIGN KEY ([TimeIndicatorFK]) REFERENCES TimeIndicator(TimeIndicatorPK) ON DELETE CASCADE,
);

CREATE TABLE GasolineFacts (
	[CountryDimensionFK] [int] NOT NULL,
	[TimeIndicatorFK] [int] NOT NULL,
	[PopulationTotal] [float],
	CONSTRAINT fk_GasolineFacts_CountryDimension FOREIGN KEY (CountryDimensionFK) REFERENCES CountriesDimension(CountryDimensionPK) ON DELETE CASCADE,
	CONSTRAINT fk_GasolineFacts_IndicatorDimension FOREIGN KEY ([TimeIndicatorFK]) REFERENCES TimeIndicator(TimeIndicatorPK) ON DELETE CASCADE,
);