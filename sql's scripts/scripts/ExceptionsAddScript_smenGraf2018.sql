USE [Kadr]
GO

INSERT INTO [ShemaTabel].[Exception]
           ([ExceptionName], [DateException], [idDayStatus], [idPrikaz], [KolHourMPS], [KolHourMNS], [KolHourGPS], [KolHourGNS], [idWorkShedule])
     VALUES --����� ��� + ��������� [idWorkShedule]=1
            ('����� ���', '2018-01-01'              , 17,        1,           0,              0,           0,            0,           3),
            ('����� ���', '2018-01-02'              , 17,        1,           0,              0,           0,            0,           3),
            ('����� ���', '2018-01-03'              , 17,        1,           0,              0,           0,            0,           3),
            ('����� ���', '2018-01-04'              , 17,        1,           0,              0,           0,            0,           3),
            ('����� ���', '2018-01-05'              , 17,        1,           0,              0,           0,            0,           3),
            ('����� ���', '2018-01-06'              , 17,        1,           0,              0,           0,            0,           3),
            ('���������', '2018-01-07'              , 17,        1,           0,              0,           0,            0,           3),
            ('����� ���', '2018-01-08'              , 17,        1,           0,              0,           0,            0,           3),
            -- ���
            ('���� ��������� ���������', '2018-02-23',17,        1,           0,              0,           0,            0,           3),
            --���
            ('������������� ������� ����', '2018-03-08',17,        1,           0,              0,           0,            0,           3),
            --����������                                                                                                                
            ('�������� ����� � �����', '2018-05-01'    ,17,        1,           0,              0,           0,            0,           3),
            --�������                                                                                                                   
            ('���� ������', '2018-05-09'               ,17,        1,           0,              0,           0,            0,           3),
            --��������                                                                                                                  
            ('���� ������', '2018-06-12'               ,17,        1,           0,              0,           0,            0,           3),
            --�����������                                                                                                               
            ('���� ��������� ��������', '2018-11-04'   ,17,        1,           0,              0,           0,            0,           3)
           
          -- (<ExceptionName, varchar(50),>,<DateException, date,>,<idDayStatus, int,> ,<idPrikaz, int,>,<KolHourMPS, real,>,<KolHourMNS, real,>,<KolHourGPS, real,>,<KolHourGNS, real,>,<idWorkShedule, int,>) 
          --idWorkShedule=1->5 
          --idWorkShedule=2->6 
          --idWorkShedule=3 ->~
          --idDayStatus=17 ->��������(7) � �����������
          --idDayStatus=22 ->���� ����������� ����
GO