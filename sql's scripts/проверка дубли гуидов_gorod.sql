/****** Script for SelectTopNRows command from SSMS  ******/
SELECT GG.Ik_gorod
,GG.Cgorod
,GG.Ik_raion
,GG.ik_type_gorod
,GG.GUID
,G.Ik_gorod
,G.Cgorod
,G.Ik_raion
,G.ik_type_gorod
,RR.Ik_raion
,RR.Craion
,RR.Ik_region
,RR.GUID
,R.Ik_raion
,R.Craion
,R.Ik_region
,RReg.Ik_region
,RReg.Cregion
,RReg.Ik_strana
,RReg.GUID
,Reg.Ik_region
,Reg.Cregion
,Reg.Ik_strana 
  FROM [UGTU_TEST].[dbo].[Gorod] as GG inner join [UGTU].[dbo].[Gorod] as G
  on GG.Ik_gorod = G.Ik_gorod inner join [UGTU_TEST].[dbo].[Raion] as RR 
  on GG.ik_raion = RR.Ik_raion inner join [UGTU].[dbo].[Raion] as R
  on RR.Ik_raion = R.Ik_raion inner join [UGTU_TEST].[dbo].[Region] as RReg 
  on RR.Ik_region = RReg.Ik_region inner join [UGTU].[dbo].[Region] as Reg 
  on RR.Ik_region = Reg.Ik_region 
  
  where GG.GUID in (
'067B4CEF-E128-4D5A-8305-FECF53E7B7E8',
'29312A11-22A4-467D-B400-C32B5D49473A',
'555E7D61-D9A7-4BA6-9770-6CAA8198C483',
'BB035CC3-1DC2-4627-9D25-A1BF2D4B936B',
'7DFA745E-AA19-4688-B121-B655C11E482F',
'9DB452CB-452A-4373-9610-A265B3B55653',
'D2944A73-DAF4-4A08-9B34-D9B0AF7785A1',
'6552FA92-269F-4B6A-BEE5-FE9204463D99',
'21AC8A44-02B7-4396-80B5-69B3D707BBF6',
'E00FC47E-A1DB-4D67-A4F0-F7668ADE75A0',
'93ADB246-540E-40A2-A0FD-E96CA6796589',
'3CC888ED-0196-4E14-B72D-D45162576995',
'78A546B6-196D-407F-A082-E7E85FF4ACAD',
'1D9C4A21-0DF7-4635-B0F8-B76E8D30D24D',
'636FA2F2-87ED-45AC-8DFD-9BE906ADA145',
'DCA2121F-5B6B-4D6C-9BC4-A1ED9982CE28',
'5DDCBF88-5097-4B0A-9EEA-D00675338333',
'D4B7D828-EC68-4C8B-8AAB-73CDBCFB48D0',
'4B4650C5-5B70-4B37-88AD-1BC581822DE7',
'0C1B7F05-9FD9-4EC9-A2CC-5EE2799BE1E6',
'F055503A-6735-4B0B-AD38-85611BBBBFBD',
'4B77B4D0-07D2-4EBE-A7D4-19FF7DE40903',
'F16C23E0-8A6D-485E-B59D-8E013FC8CFD6',
'32747C72-C08B-4440-B340-91F48D72F9DB',
'C2D95FE6-F723-4423-BCE3-070F252E2894',
'B0122C31-EB1C-40AE-B998-08F9E99A0FA1',
'31F6C7DE-2410-4654-BB24-053B48706DA0',
'E552CDB1-E948-4859-8C93-0DE45732BE39',
'46F3FC4A-AAF9-496A-9BFD-0E41301C3617',
'EB703765-3936-48FE-9079-279775195FF7',
'6461763A-553D-449A-B161-3D7E4FDE52EB',
'0A263374-C92E-4306-AFA7-40F9A1A43F90',
'82A4DA80-0ADD-4626-9373-427C520502F7',
'1F9BDA6F-45A5-4BF5-B1D8-434D763EA834',
'1D4A99B7-5C07-4404-A567-455F6F682A9E',
'9A2AD46C-4293-4C54-B0CA-4878AFC95AB8',
'7A0CE3C4-AA03-486E-AA4C-4C0A219D2852',
'5A8B5AEB-4C53-4B71-BBE7-50800DACFABD',
'74A26D75-38A6-485A-9468-52DD7C6711FA',
'A309E4CE-2F36-4106-B1CA-53E0F48A6D95',
'DD8CAEAB-C685-4F2A-BF5F-550ACA1BBC48',
'93F4E543-1C52-425D-8BCC-55D964BABAAA',
'AFEEA607-0207-467F-8C59-562FC634F924',
'735AC47E-A59A-44CC-B96E-5DB35674C09B',
'C396B631-5AD4-4BD0-A3B6-2C87721007B0',
'A8695CCE-C623-4451-BB47-2D69AB22092A',
'643EAECD-14B2-4C34-ADC6-2E1F253B5052',
'BEBFD75D-A0DA-4BF9-8307-2E2C85EAC463',
'0BF0F4ED-13F8-446E-82F6-325498808076',
'ADE7A649-719F-4E66-8099-35C6280A8C8E',
'14BBBA42-7AED-4D67-9C35-367189A34630',
'099E1F30-1EAA-47E2-A8A8-38AEC34E0384',
'9E22DC47-E0DF-407B-8448-39CA682E3FD6',
'CB0F531D-4831-41C0-A859-3AD1F2E0F70B',
'824E2E4F-4BE1-4710-AC28-0F75B70AFFD6',
'1CA4E6CE-2BC8-40A9-BDF5-113449C3A172',
'12E39F15-83B1-4A5A-8196-134C9DB10882',
'49846FFF-046E-4CEE-944B-137CB833D67F',
'1A52E6E4-8075-41BD-8CA0-18F4E8909BF9',
'99D5E8AC-8117-481F-82F5-0DF2E9F258E7',
'053B25B4-E6D0-4447-9455-05E3727D627B',
'F3C2F9A8-9DBA-4296-B809-09CCCC7B7664',
'FD6B890D-0F59-4317-BA52-0A2B5B69EA04',
'0044ABF3-5794-46E3-ACC1-00CFAFFDBCF1',
'CAD32019-C6D5-4563-B700-02C960C506EF',
'7E58FCB2-C68A-4FFB-A888-03C726BC8931',
'9A691998-8204-45DD-86ED-9399A99525F3',
'5CFD53D8-A919-4EED-B269-9527EAEC5DCA',
'01BF718C-2E67-4F2E-9207-972D5EAAA928',
'1AEE180A-17F6-460C-91AF-989FEAA76CBA',
'6428CBF6-40E3-47DF-8C90-98F8E3876B5B',
'76CB0CF6-49A5-4852-B45D-99E4CE12A7EA',
'6F1A17F9-0D73-45F4-A169-99FE4EC6776F',
'79DA737A-603B-4C19-9B54-9114C96FB912',
'17DFE46B-BC71-4D87-A050-1ADC686F8827',
'452A2DDF-88A1-4E35-8D8D-8635493768D4',
'D000A169-1029-489E-9261-86B576766043',
'875910CF-E470-4E6C-86D5-86F2B883AE23',
'994A6E55-DA98-4D2D-975A-893BB5639C7B',
'3FE134E2-4DE5-41AC-8F38-8D25AB041194',
'ABFED39C-160A-4291-817C-61BA5D320507',
'6E8F7201-B45A-4FED-841A-6687E6215328',
'0742BAAC-8739-4712-A6BA-682B7A95888F',
'B28B6F6F-1435-444E-95A6-68C499B0D27A',
'DF0A24C1-D44A-482D-AABF-1C2EFE701326',
'F876974F-2FA4-4372-BAB2-1CC3C524B147',
'7339E834-2CB4-4734-A4C7-1FCA2C66E562',
'41A2851D-887D-420D-8FCE-216D4CB4DFCA',
'4C7F8A60-417B-4E2D-9618-23100FAAB245',
'8B698775-FE5E-4FC0-9F0D-272855D82D15',
'BEFAA2FE-958F-4253-B8C2-75CF7081BDBB',
'748D7AFA-7407-4876-9F40-764ECDD09BBD',
'1B4B6A7A-37F6-4633-8A3A-7963C71D7236',
'6E9EAF80-D0D1-48B2-91E8-7F50B9B1F582',
'8294B97C-7553-499E-8369-821D6EB0FDC7',
'1638A780-D4F8-4199-B234-84E88300F9C2',
'7353F5B0-0DBF-48D4-8336-6E0A81D6A9F5',
'D414A2E8-9E1E-48C1-94A4-7308D5608177',
'2262A513-C9DD-469F-BCF9-730F5A2A659A',
'AC4369D3-65C1-43AC-B643-73634B040AFB',
'650E9C69-34D2-4BBF-9C5D-73736803B11B',
'9AE64229-9F7B-4149-B27A-D1F6EC74B5CE',
'A56A44EE-F79D-4E51-B219-C3C828C7E0C0',
'8F9FAAD4-FF93-471D-B0C0-C8E5C0162DEE',
'CEAED415-4254-4FA1-8267-CCF80F4DC0FE',
'71051070-FCE3-4A4D-A9D9-CD50F6DC6310',
'0D3DCD7B-362C-402A-B8FA-CDC77C2E946B',
'6069FA40-5B2B-4BC0-8A88-CFB1C6DE4E44',
'727CDF1E-1B70-4E07-8995-9BF7CA9ABEFB',
'B3D2E10F-752D-4B90-B54B-9D6545F38AE0',
'98B1EC30-6107-4F99-AE3A-9D82492F30A1',
'C5EED64D-4E2F-4D78-A893-B7C5C46128E2',
'82D4C783-5080-4FAA-9CEC-BA9152BC9FC8',
'C1FB8915-4100-4245-AAF7-BDF67D95FBA3',
'DF6EB47E-1E5B-41D7-A8DB-BE7A68F6DF23',
'C3A35399-C5EA-4F12-BF34-C2CC21E1CC60',
'9D1FFA88-2367-4DA1-8FA2-A38B24C9E721',
'FF9A4EB9-99C7-4302-B8CD-A4DEB1D15D7E',
'816AD83C-7CAB-4FAA-8B35-A57DA6670706',
'782ACB50-DDFA-4483-BCBD-A5E667976036',
'B6D87657-827C-40E4-84FE-A7B00E0B5BE4',
'71E7CB45-F365-4E6B-B068-A7D35349C3BA',
'242E87C1-584D-4360-8C4C-AAE2FE90048E',
'49CB98DE-20B8-44D6-9C5B-ADD650596C82',
'9039BBB5-93A8-4172-B97C-AF2B9ABBB614',
'77DAAEA8-1E57-4C95-A8C3-B0A138E4AA9C',
'759037C3-6408-4466-AFE4-B10ADC4EDFF4',
'C58D0505-54EB-4C34-8216-B14F7CDB0ECB',
'74B8318F-C0C9-437C-827C-B15FFBED849C',
'067F5E50-261D-4712-95EF-B384960F0BE3',
'6D3EE7BB-47E1-429E-A510-B4F74D1273AB',
'FE252D16-E57E-477E-8153-B55C5A7061E1',
'C5991FEE-B6AB-4CA8-9B1F-B5838025B26F',
'BE15D43E-430E-4CE6-AB93-B5AB8DEE9325',
'703BEF9F-2DF3-45E9-9B25-B6444587C39C',
'2144CA72-EA8D-4AD6-90BC-E8443944087A',
'E3A88932-C76E-4158-842C-D710A9856DF1',
'35257082-1A94-4851-A948-D97CA2EA5549',
'198F3D42-20C9-4052-A7C6-DF7F23562927',
'85B11232-42AF-4F5C-A14C-E1D4075073CF',
'2402307D-3A10-4351-A69C-E4C68F966643',
'F658A2C0-1F7D-4423-9465-E55D3553BF86',
'9DCB09AC-AD67-4583-A974-E6FF9BC24E40',
'550914FC-1EE1-4B5D-B693-E74C858DA1D3',
'665B8637-7951-4551-A0D6-ED848957A021',
'8B7CFDB0-BAAB-436D-BA71-EF025C9F85C0',
'9F7EF4FF-8DDE-4AFE-B7D3-F25D237947AD',
'F06B53F1-368A-4D0B-A2B7-F555241D4F9F',
'9B3ADB64-C913-49EF-8F85-F6BB44677DD7',
'4136D0C1-3FF7-44C0-AA30-FA2E7EB96EF7',
'1B327933-0E26-406F-8650-FB29FA9AFC05'
  )-- and RR.Ik_region in (select Ik_region from [UGTU_TEST].[dbo].[Region] as Reg where Reg.Ik_strana =2 )
order by GG.GUID