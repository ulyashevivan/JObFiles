update test
set test.Cstrana = act.Cstrana 
,test.GUID = NULL
from [UGTU_TEST].[dbo].[Strana] test
inner join [UGTU].[dbo].[Strana] act
on
 test.Ik_strana =act.Ik_strana
 
 go
 
 update test
set test.Cregion = act.Cregion 
,test.GUID = NULL
from [UGTU_TEST].[dbo].[Region] test
inner join [UGTU].[dbo].[Region] act
on
 test.Ik_region =act.Ik_region
 
 go
 
 update test
set test.Craion = act.Craion 
,test.GUID = NULL
from [UGTU_TEST].[dbo].[Raion] test
inner join [UGTU].[dbo].[Raion] act
on
 test.Ik_raion =act.Ik_raion
 
 go
 
 update test
set test.Cgorod = act.Cgorod 
,test.GUID = NULL
from [UGTU_TEST].[dbo].[Gorod] test
inner join [UGTU].[dbo].[Gorod] act
on
 test.Ik_gorod =act.Ik_gorod
 
 go
 
 update test
set test.CStreet = act.CStreet 
,test.GUID = NULL
from [UGTU_TEST].[dbo].[Street] test
inner join [UGTU].[dbo].[Street] act
on
 test.Ik_street =act.Ik_street