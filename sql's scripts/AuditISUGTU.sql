/****** Скрипт для команды SelectTopNRows из среды SSMS  ******/
SELECT 
REPLACE(AE.UserName,'UGTU\','') as [Пользователь]

,SUM(IIF(AOT.OperationName = 'Правка'
	, 1, 0)) as [Правка]
,SUM(IIF(AOT.OperationName = 'Вставка'
	, 1, 0)) as [Вставка]
,SUM(IIF(AOT.OperationName = 'Удаление'
	, 1, 0)) as [Удаление]
--,SUM(IIF(AOT.OperationName = 'Выборка'
--	, 1, 0)) as Выборка
--,SUM(IIF(AOT.OperationName = 'Выполнение'
--	, 1, 0)) as Выполнение

,Count(AE.AuditDateTime) as [Всего]

  FROM [UGTU].[dbo].[Audit_Event] as AE inner join [UGTU].[dbo].[Audit_OperationType] as AOT
  on AE.OperationTypeID = AOT.OperationTypeID
 
  where AE.AuditDateTime between '01.06.2017' and  GETDATE() and AE.UserName like '%UGTU\%'
 
  group by  AE.UserName
  order by AE.UserName