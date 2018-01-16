/****** Скрипт для команды SelectTopNRows из среды SSMS  ******/
SELECT --App.[IDPerson]
		Direction,
	  COUNT(Direction)
      --,[Year]

  FROM [UGTU].[FIS].[ApplicationView] App
  INNER JOIN [UGTU].[FIS].[AddressView] Adr ON App.IDPerson = Adr.IDPerson
  WHERE [Year] = 2017 AND Adr.Raion like'%Вук%'
  GROUP BY Direction