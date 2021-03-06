/****** Script for SelectTopNRows command from SSMS  ******/
--Название документа	Вид документа	Статус документа	Подтверждение утраты	Подтверждение обмена	Уровень образования	Серия документа	Номер документа	Дата выдачи	Регистрационный номер	Код специальности, 
--направления подготовки	Наименование специальности, направления подготовки	Наименование квалификации	Образовательная программа	
--Год поступления	Год окончания	Срок обучения, лет	Фамилия получателя	Имя получателя	Отчество получателя	Дата рождения получателя 	Пол получателя	
--Гражданин иностранного государства	Форма обучения 	Высшее образование, получаемое впервые	Источник финансирования обучения

DECLARE @yearGrad int, @UsinskFac int, @VorkutaFac int , @DiplDate DATE
set @yearGrad=2017
set @UsinskFac=17
set @VorkutaFac=15
set @DiplDate = '24.06.2017'--'25.06.2016'--'27.06.2015'




SELECT distinct 'Диплом' as [Название Документа]
, IIF(IsExcellent=0,'Диплом бакалавра','Диплом бакалавра с отличием') [DiplKind] --[Вид документа]
, 'Оригинал' -- [Статус документа]
, 'Нет' --[Потверждение утраты]
, 'Нет' -- [Подтверждение обмена]
, 'Высшее образование - бакалавриат' [ObrKind] --[Уровень образования]
, ISNULL([Diplom].DiplSeries,'') -- [Серия документа]
, ISNULL( [Diplom].DiplNumber, '')-- [Номер документа] ISNULL( iif(len(sh.[Номер документа])=6,'0'+sh.[Номер документа],sh.[Номер документа]) , IIF(len([Diplom].DiplNumber)=6, '0'+[Diplom].DiplNumber,ISNULL( [Diplom].DiplNumber,'')))
, CONVERT(VARCHAR(10),  @DiplDate,104) -- [Дата выдачи]
, ISNULL([RegNumber],'') --[Регистрационный номер]
, ISNULL(CONVERT(VARCHAR(20),[Spec_stud].[Sh_spec]),'') -- [Код специальности, направления подготовки]
, [Spec_stud].[Cname_spec] -- [Наименование специальности, направления подготовки]
, ISNULL([Spec_stud].[Cname_qualif],'') -- [Наименование квалификации]
, '' --[Образовательная программа]
, YearPost -- [Год поступления]
, @yearGrad as YearGrad -- [Год окончания]
, [TREE_specialties].YearObuch -- [Срок обучения]
, [Clastname] -- [Фамилия получателя]
, [Cfirstname] -- [Имя получателя]
, ISNULL([Cotch],'') -- [Отчество получателя]
, ISNULL(CONVERT(VARCHAR(10), [Dd_birth], 104),'') [Dd_birth] -- [Дата рождения получателя]
, IIF(lSex=1,'Муж','Жен') -- [Пол получателя]
, ISNULL(IIF(Strana.ik_type_grazd=1,'РФ', IIF(Strana.[bit_SNG]=1, 'ближнее (из стран СНГ, Балтии, Грузии, Абхазии и Южной Осетии)', 'дальнее (других иностранных - кроме стран СНГ, Балтии, Грузии, Абхазии и Южной Осетии)')),'лица без гражданства') -- [Гражданин иностранного государства]
, [TREE_specialties].Cname_form_ed -- [Форма обучения]
, IIF(attest.[Ik_vid_doc] = 9 , 'Нет','Да') -- [Высшее образование, получаемое впервые]
, IIF([Kat_zach].ik_type_kat=1, 'Обучение за счет бюджетных ассигнований',IIF([Kat_zach].ik_type_kat=2, 'Целевое обучение','Платное обучение')) -- [Источник финансирования обучения]




  FROM [dbo].[StudGrup]
  inner join [dbo].[Prikaz] ON [StudGrup].[Ik_prikazZach]=[Prikaz].[Ik_prikaz]
  inner join [dbo].[Kat_zach] on [StudGrup].ik_kat_zach=[Kat_zach].Ik_kat_zach
  inner join [dbo].[TREE_groups] [Grup] ON [StudGrup].Ik_grup=[Grup].Ik_grup
  inner join [dbo].[TREE_specialties] ON [Grup].ik_spec_fac=[TREE_specialties].ik_spec_fac
  inner join [dbo].[Spec_stud] ON [TREE_specialties].ik_spec=[Spec_stud].ik_spec
  inner join [dbo].[TREE_student] ON [StudGrup].Ik_zach=[TREE_student].Ik_zach
  inner join [dbo].[Diplom] ON [StudGrup].Ik_zach=[Diplom].Ik_zach and [Diplom].Cosenca >2 and  YEAR([Dd_dipl])=@yearGrad
  inner join (select [Ik_zach], MIN(YEAR([Dd_prikaz]))YearPost FROM [dbo].[StudGrup] inner join [dbo].[Prikaz] ON [StudGrup].[Ik_prikazZach]=[Prikaz].[Ik_prikaz] GROUP BY [Ik_zach])YearPostTable
  ON [StudGrup].Ik_zach=YearPostTable.Ik_zach and YEAR([Prikaz].[Dd_prikaz])=YearPostTable.YearPost
  left join dbo.Strana on [TREE_student].ik_grazd=Strana.Ik_strana
  left join [dbo].[Direction] on [TREE_specialties].ik_direction=[Direction].ik_direction

  LEFT JOIN 
		(SELECT nCode, MAX(Ik_vid_doc) Ik_vid_doc FROM dbo.Doc_stud WHERE Ik_vid_doc in
				 (SELECT Ik_vid_doc FROM [dbo].[documents] WHERE [IsEducational] =1)
			GROUP BY nCode			
					)attest
		ON attest.nCode=[TREE_student].nCode

--RegNumber=CONVERT(VARCHAR(10),sh.[Регистрационный номер]) 
--and ([TREE_student].Cotch=sh.[Отчество получателя] or sh.[Отчество получателя] is null)
 where 
  [Direction].id_type_direction in (1) -- бак
  and [TREE_specialties].ik_fac not in (@VorkutaFac, @UsinskFac) -- 15 воркута, 17 - усинск
  --and lSex=1
 
  --and IsExcellent=0

  --and [Diplom].DiplNumber is not null



  UNION
  SELECT distinct 'Диплом'
  , IIF(IsExcellent=0,'Диплом специалиста','Диплом специалиста с отличием') 
  , 'Оригинал'
  , 'Нет'
  , 'Нет'
  , 'Высшее образование - специалитет, магистратура' [DiplKind]
  , ISNULL([Diplom].DiplSeries,''),ISNULL( [Diplom].DiplNumber, '')
  , CONVERT(VARCHAR(10),  @DiplDate,104)
  , ISNULL([RegNumber],''),ISNULL(CONVERT(VARCHAR(20),[Spec_stud].[Sh_spec]),'')
  , [Spec_stud].[Cname_spec]
  , ISNULL([Spec_stud].[Cname_qualif],'')
  , ''
  , YearPost
  , @yearGrad as YearGrad
  , [TREE_specialties].YearObuch
  , [Clastname]
  , [Cfirstname]
  , ISNULL([Cotch],'')
  , ISNULL(CONVERT(VARCHAR(10), [Dd_birth], 104),'') [Dd_birth]
  , IIF(lSex=1,'Муж','Жен')
  , ISNULL(IIF(Strana.ik_type_grazd=1,'РФ', IIF(Strana.[bit_SNG]=1, 'ближнее (из стран СНГ, Балтии, Грузии, Абхазии и Южной Осетии)', 'дальнее (других иностранных - кроме стран СНГ, Балтии, Грузии, Абхазии и Южной Осетии)')),'лица без гражданства')
  , [TREE_specialties].Cname_form_ed
  , IIF(attest.[Ik_vid_doc] = 9 , 'Нет','Да')
  , IIF([Kat_zach].ik_type_kat=1, 'Обучение за счет бюджетных ассигнований'
  , IIF([Kat_zach].ik_type_kat=2, 'Целевое обучение','Платное обучение'))

  FROM [dbo].[StudGrup]
  inner join [dbo].[Prikaz] ON [StudGrup].[Ik_prikazZach]=[Prikaz].[Ik_prikaz]
  inner join [dbo].[Kat_zach] on [StudGrup].ik_kat_zach=[Kat_zach].Ik_kat_zach
  inner join [dbo].[TREE_groups] [Grup] ON [StudGrup].Ik_grup=[Grup].Ik_grup
  inner join [dbo].[TREE_specialties] ON [Grup].ik_spec_fac=[TREE_specialties].ik_spec_fac
  inner join [dbo].[Spec_stud] ON [TREE_specialties].ik_spec=[Spec_stud].ik_spec
  inner join [dbo].[TREE_student] ON [StudGrup].Ik_zach=[TREE_student].Ik_zach
  inner join [dbo].[Diplom] ON [StudGrup].Ik_zach=[Diplom].Ik_zach and [Diplom].Cosenca >2 and  YEAR([Dd_dipl])=@yearGrad
  inner join (select [Ik_zach], MIN(YEAR([Dd_prikaz]))YearPost FROM [dbo].[StudGrup] inner join [dbo].[Prikaz] ON [StudGrup].[Ik_prikazZach]=[Prikaz].[Ik_prikaz] GROUP BY [Ik_zach])YearPostTable
  ON [StudGrup].Ik_zach=YearPostTable.Ik_zach and YEAR([Prikaz].[Dd_prikaz])=YearPostTable.YearPost

  left join dbo.Strana on [TREE_student].ik_grazd=Strana.Ik_strana
  left join [dbo].[Direction] on [TREE_specialties].ik_direction=[Direction].ik_direction

  LEFT JOIN 
		(SELECT nCode, MAX(Ik_vid_doc) Ik_vid_doc FROM dbo.Doc_stud WHERE Ik_vid_doc in
				 (SELECT Ik_vid_doc FROM [dbo].[documents] WHERE [IsEducational] =1)
			GROUP BY nCode			
					)attest
		ON attest.nCode=[TREE_student].nCode

 where 
  [Direction].id_type_direction in (2) -- спецы
  --and lSex=1
  --and IsExcellent=0

  --and [Diplom].DiplNumber is not null
  and [TREE_specialties].ik_fac not in (@VorkutaFac, @UsinskFac) -- усинск и воркута




  UNION
  SELECT distinct 'Диплом'
  , IIF(IsExcellent=0,'Диплом магистра','Диплом магистра с отличием') 
  , 'Оригинал'
  , 'Нет'
  , 'Нет'
  , 'Высшее образование - специалитет, магистратура' [DiplKind]
  , ISNULL([Diplom].DiplSeries,'')
  , ISNULL( [Diplom].DiplNumber, '')
  , CONVERT(VARCHAR(10),  @DiplDate,104)
  , ISNULL([RegNumber],'')
  , ISNULL(CONVERT(VARCHAR(20)
  , [Spec_stud].[Sh_spec]),'')
  , [Spec_stud].[Cname_spec]
  , ISNULL([Spec_stud].[Cname_qualif],'')
  , ''
  , YearPost
  , @yearGrad as YearGrad
  , [TREE_specialties].YearObuch
  , [Clastname]
  , [Cfirstname]
  , ISNULL([Cotch],'')
  , ISNULL(CONVERT(VARCHAR(10), [Dd_birth], 104),'') [Dd_birth]
  , IIF(lSex=1,'Муж','Жен')
  , ISNULL(IIF(Strana.ik_type_grazd=1,'РФ', IIF(Strana.[bit_SNG]=1, 'ближнее (из стран СНГ, Балтии, Грузии, Абхазии и Южной Осетии)', 'дальнее (других иностранных - кроме стран СНГ, Балтии, Грузии, Абхазии и Южной Осетии)')),'лица без гражданства')
  , [TREE_specialties].Cname_form_ed
  , IIF(attest.[Ik_vid_doc] = 9 , 'Нет','Да')
  , IIF([Kat_zach].ik_type_kat=1, 'Обучение за счет бюджетных ассигнований',IIF([Kat_zach].ik_type_kat=2, 'Целевое обучение','Платное обучение'))

  FROM [dbo].[StudGrup]
  inner join [dbo].[Prikaz] ON [StudGrup].[Ik_prikazZach]=[Prikaz].[Ik_prikaz]
  inner join [dbo].[Kat_zach] on [StudGrup].ik_kat_zach=[Kat_zach].Ik_kat_zach
  inner join [dbo].[TREE_groups] [Grup] ON [StudGrup].Ik_grup=[Grup].Ik_grup
  inner join [dbo].[TREE_specialties] ON [Grup].ik_spec_fac=[TREE_specialties].ik_spec_fac
  inner join [dbo].[Spec_stud] ON [TREE_specialties].ik_spec=[Spec_stud].ik_spec
  inner join [dbo].[TREE_student] ON [StudGrup].Ik_zach=[TREE_student].Ik_zach
  inner join [dbo].[Diplom] ON [StudGrup].Ik_zach=[Diplom].Ik_zach and [Diplom].Cosenca >2 and  YEAR([Dd_dipl])=@yearGrad
  inner join (select [Ik_zach], MIN(YEAR([Dd_prikaz]))YearPost FROM [dbo].[StudGrup] inner join [dbo].[Prikaz] ON [StudGrup].[Ik_prikazZach]=[Prikaz].[Ik_prikaz] GROUP BY [Ik_zach])YearPostTable
  ON [StudGrup].Ik_zach=YearPostTable.Ik_zach and YEAR([Prikaz].[Dd_prikaz])=YearPostTable.YearPost
  left join dbo.Strana on [TREE_student].ik_grazd=Strana.Ik_strana
  left join [dbo].[Direction] on [TREE_specialties].ik_direction=[Direction].ik_direction

  LEFT JOIN 
		(SELECT nCode, MAX(Ik_vid_doc) Ik_vid_doc FROM dbo.Doc_stud WHERE Ik_vid_doc in
				 (SELECT Ik_vid_doc FROM [dbo].[documents] WHERE [IsEducational] =1)
			GROUP BY nCode			
					)attest
		ON attest.nCode=[TREE_student].nCode

 where 
  [Direction].id_type_direction in (3) -- магистры
  --and lSex=1
  --and IsExcellent=0
  and [TREE_specialties].ik_fac not in (@VorkutaFac, @UsinskFac) -- усинск и ухта
 -- and [Diplom].DiplNumber is not null


  order by  [ObrKind],[DiplKind], [Spec_stud].Cname_spec,
[TREE_student].[Clastname], [TREE_student].[Cfirstname]





--//27-06-2017 11:00 Уляшев ИИ

/*














go



/****** Script for SelectTopNRows command from SSMS  ******/
--Название документа	Вид документа	Статус документа	Подтверждение утраты	Подтверждение обмена	Уровень образования	Серия документа	Номер документа	Дата выдачи	Регистрационный номер	Код специальности, 
--направления подготовки	Наименование специальности, направления подготовки	Наименование квалификации	Образовательная программа	
--Год поступления	Год окончания	Срок обучения, лет	Фамилия получателя	Имя получателя	Отчество получателя	Дата рождения получателя 	Пол получателя	
--Гражданин иностранного государства	Форма обучения 	Высшее образование, получаемое впервые	Источник финансирования обучения

DECLARE @yearGrad int, @DiplDate DATE
set @yearGrad=2015
set @DiplDate = '21.06.2014'--'27.06.2015'




SELECT distinct 
sh.*,
ISNULL(IIF(Strana.ik_type_grazd=1,'РФ', IIF(Strana.[bit_SNG]=1, 'ближнее (из стран СНГ, Балтии, Грузии, Абхазии и Южной Осетии)', 'дальнее (других иностранных - кроме стран СНГ, Балтии, Грузии, Абхазии и Южной Осетии)')),'лица без гражданства')

, [TREE_specialties].Cname_form_ed, IIF(attest.[Ik_vid_doc] = 9 , 'Нет','Да'), IIF([Kat_zach].ik_type_kat=1, 'Обучение за счет бюджетных ассигнований',IIF([Kat_zach].ik_type_kat=2, 'Целевое обучение','Платное обучение'))

/*'Диплом', IIF(IsExcellent=0,'Диплом бакалавра','Диплом бакалавра с отличием') [DiplKind], 
'Оригинал', 'Нет', 'Нет', 'Высшее образование - бакалавриат' [ObrKind], ISNULL(sh.[Серия документа], ISNULL([Diplom].DiplSeries,'')),ISNULL( sh.[Номер документа], ISNULL( [Diplom].DiplNumber,''))
,CONVERT(VARCHAR(10),  @DiplDate,104), 



ISNULL([RegNumber],''),CONVERT(VARCHAR(20),[Spec_stud].[Sh_spec]), [Spec_stud].[Cname_spec], ISNULL([Spec_stud].[Cname_qualif],''), '', YearPost, @yearGrad as YearGrad, [TREE_specialties].YearObuch,
[Clastname], [Cfirstname], ISNULL([Cotch],''), 
ISNULL(CONVERT(VARCHAR(10), [Dd_birth], 104),'') [Dd_birth], IIF(lSex=1,'Муж','Жен'),
ISNULL(IIF(Strana.ik_type_grazd=1,'РФ', IIF(Strana.[bit_SNG]=1, 'ближнее (из стран СНГ, Балтии, Грузии, Абхазии и Южной Осетии)', 'дальнее (других иностранных - кроме стран СНГ, Балтии, Грузии, Абхазии и Южной Осетии)')),'лица без гражданства')

, [TREE_specialties].Cname_form_ed, IIF(attest.[Ik_vid_doc] = 9 , 'Нет','Да'), IIF([Kat_zach].ik_type_kat=1, 'Обучение за счет бюджетных ассигнований',IIF([Kat_zach].ik_type_kat=2, 'Целевое обучение','Платное обучение'))



,[Spec_stud].[Sh_spec]*/
  FROM [dbo].[StudGrup]
  inner join [dbo].[Kat_zach] on [StudGrup].ik_kat_zach=[Kat_zach].Ik_kat_zach
  inner join [dbo].[TREE_groups] [Grup] ON [StudGrup].Ik_grup=[Grup].Ik_grup
  inner join [dbo].[TREE_specialties] ON [Grup].ik_spec_fac=[TREE_specialties].ik_spec_fac
  inner join [dbo].[Spec_stud] ON [TREE_specialties].ik_spec=[Spec_stud].ik_spec
  inner join [dbo].[TREE_student] ON [StudGrup].Ik_zach=[TREE_student].Ik_zach
  inner join [dbo].[Diplom] ON [StudGrup].Ik_zach=[Diplom].Ik_zach and [Diplom].Cosenca is not null
  inner join (select [Ik_zach], MIN(YEAR([Dd_prikaz]))YearPost FROM [dbo].[StudGrup] inner join [dbo].[Prikaz] ON [StudGrup].[Ik_prikazZach]=[Prikaz].[Ik_prikaz] GROUP BY [Ik_zach])YearPostTable
  ON [StudGrup].Ik_zach=YearPostTable.Ik_zach

  left join dbo.Strana on [TREE_student].ik_grazd=Strana.Ik_strana
  left join [dbo].[Direction] on [TREE_specialties].ik_direction=[Direction].ik_direction

  LEFT JOIN 
		(SELECT nCode, MAX(Ik_vid_doc) Ik_vid_doc FROM dbo.Doc_stud WHERE Ik_vid_doc in
				 (SELECT Ik_vid_doc FROM [dbo].[documents] WHERE [IsEducational] =1)
			GROUP BY nCode			
					)attest
		ON attest.nCode=[TREE_student].nCode
		right join [UGTU_COPY2].[dbo].[Шаблон$] sh on ([TREE_student].Clastname=CONVERT(VARCHAR(100),sh.[Фамилия получателя])
and [TREE_student].Dd_birth=sh.[Дата рождения получателя ]) 
--and ([TREE_student].Cotch=sh.[Отчество получателя] or sh.[Отчество получателя] is null)
 where 
  --[Direction].id_type_direction in (1,2,3)
  --and lSex=1
  --and 
  --[StudGrup].[ik_pricOtch]=3
  --and [StudGrup].[Ik_prikazOtch] IN
  --(select [Ik_prikaz] from [dbo].[Prikaz] where YEAR([Dd_prikaz])=@yearGrad)
  --and IsExcellent=0

  --and [Diplom].DiplNumber is not null

  --and 
  sh.[Статус документа]='Дубликат'
  */