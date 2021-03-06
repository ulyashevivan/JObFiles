--select * from dbo.Gorod
--where GUID is null
--and Ik_gorod in (select Ik_gorod from dbo.Zaved_stud)
--go 
SELECT          dbo.Strana.Ik_strana as [��������], 
				dbo.Strana.Cstrana as [������], 
				dbo.Strana.GUID as [GUID������], 
				dbo.Region.Ik_region as [���������], 
				dbo.Region.Cregion as [������], 
				dbo.Region.GUID as [GUID�������], 
				dbo.Raion.Ik_raion as [��������], 
				dbo.Raion.Craion as [�����], 
				dbo.Raion.GUID as [GUID������], 
                dbo.Gorod.Ik_gorod as [��������], 
				dbo.Gorod.Cgorod as [�����], 
				dbo.type_gorod.ctype_gorod as [���������], 
				dbo.Gorod.GUID as [GUID������]
FROM            dbo.Raion INNER JOIN
                         dbo.Gorod ON dbo.Raion.Ik_raion = dbo.Gorod.Ik_raion INNER JOIN
                         dbo.Region ON dbo.Raion.Ik_region = dbo.Region.Ik_region INNER JOIN
                         dbo.Strana ON dbo.Region.Ik_strana = dbo.Strana.Ik_strana INNER JOIN
                         dbo.type_gorod ON dbo.Gorod.ik_type_gorod = dbo.type_gorod.ik_type_gorod
where  
dbo.Strana.Ik_strana = 2
and
dbo.Gorod.GUID is null 
and 
(dbo.Gorod.ik_gorod in (select Ik_gorod from dbo.Zaved_stud)
or dbo.Gorod.ik_gorod in (select id_gorod from ShemaCZS.AddressCZS))