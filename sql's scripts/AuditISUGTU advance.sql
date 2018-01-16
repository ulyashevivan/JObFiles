/****** Скрипт для команды SelectTopNRows из среды SSMS  ******/
SELECT [OperationTypeID]
      ,[ObjectID]
      ,[AuditDateTime]
      ,[UserName]
      ,[Description]
  FROM [UGTU].[dbo].[Audit_Event]
  where UserName = 'UGTU\iulyashev'
  and 
  AuditDateTime between '01.09.2016' and  GETDATE()
  order by [AuditDateTime]