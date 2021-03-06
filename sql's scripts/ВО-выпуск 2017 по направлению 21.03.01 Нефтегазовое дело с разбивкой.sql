/****** Скрипт для команды SelectTopNRows из среды SSMS  ******/
SELECT
 --EB.Sh_spec as [Шифр специальности] 
--,EB.Cname_spec as [Специальность]
--,
Gr.Cname_grup as [Группа]
,P.PersonFullName as [ФИО]
--,P.ctelefon as [Телефон1]
--,P.cSotTel as [Телефон2]
,isNull(P.ctelefon, '') + ' ' + isNull(P.cSotTel, '') as [Телефон]
--,P.ctelefon + ' ' + P.cSotTel as [Телефон3]

  FROM [UGTU].[dbo].[Person] as P
  inner join [UGTU].[dbo].[Zach] as Za on P.nCode = Za.nCode 
  inner join [UGTU].[dbo].[StudGrup] as SG on Za.Ik_zach = SG.Ik_zach
  inner join  [UGTU].[dbo].[Grup] as Gr on SG.Ik_grup = Gr.Ik_grup
  inner join [UGTU].[dbo].[Relation_spec_fac] as RSF on Gr.ik_spec_fac = RSF.ik_spec_fac
  inner join [UGTU].[dbo].[EducationBranch]  as EB on RSF.ik_spec = EB.ik_spec
  

  where 
  Gr.DateExit Like '%2017%'
  AND (SG.ik_pricOtch IS NULL OR SG.ik_pricOtch = 3)
  AND EB.Sh_spec like '%21.03.01%'

order by --EB.Sh_spec, EB.Cname_spec, 
Gr.Cname_grup, P.PersonFullName