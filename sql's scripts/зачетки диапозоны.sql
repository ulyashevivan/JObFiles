/****** Скрипт для команды SelectTopNRows из среды SSMS  ******/
SELECT TOP (1000) [ik_fac]
      ,[ik_year]
      ,[BeginDiapazon]
      ,[EndDiapazon]
  FROM [UGTU].[dbo].[Abit_Zach_Diapazons]
  where [ik_year] = 25 and [ik_fac] = 31

  go 

  select * from [UGTU].[dbo].[Zach] Z
  where Z.Nn_zach between '172201' and '173800'
  order by Z.Nn_zach desc

  go

  select * from [UGTU].[FIS].[ApplicationView]
where Year = 2017 and FullName like '%Ударцев%'