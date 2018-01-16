/****** Скрипт для команды SelectTopNRows из среды SSMS  ******/

SELECT distinct E.EmployeeName [ФИО]
--,FS.DateEnd [Дата увольнения]
  FROM [Kadr].[dbo].[FactStaff] FS  inner join [Kadr].[dbo].[Employee] E on FS.idEmployee = E.id
  where FS.DateEnd between '20170901' and '20180116'
order by E.EmployeeName


