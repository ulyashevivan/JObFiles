/****** Скрипт для команды SelectTopNRows из среды SSMS  ******/
SELECT distinct --FSWH.[id]
--      ,[StaffCount]
--      ,[HourCount]
--      ,[HourSalary]
--      ,[idPlanStaff]
[idEmployee]
--      ,[idBeginPrikaz]
--      ,FSWH.[idEndPrikaz]
--      ,[idTypeWork]
--      ,[DateBegin]
--      ,FSWH.[DateEnd]
--      ,[IsReplacement]
--      ,[idFactStaffHistory]
--      ,[IDShedule]
--      ,[idSalaryKoeff]
--      ,[idlaborcontrakt]
--      ,[idreason]
--      ,[HourStaffCount]
--      ,[CalcStaffCount]
--      ,[idOKVED]
--      ,[idFundingCenter]
--      ,FSWH.[idDepartment]
--      ,[WorkHoursInWeek]
--      ,[InclInTabel]
--      ,[idFactStaffHistory2]
  FROM [Kadr].[dbo].[FactStaffWithHistory] FSWH
  inner join [dbo].[PlanStaff] PS
  on FSWH.idPlanStaff = PS.id
  inner join [dbo].[Post] P
  on PS.idPost = P.id
  where P.idCategory = 2 and (FSWH.DateEnd is null or FSWH.DateEnd > GETDATE() )