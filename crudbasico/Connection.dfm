object Conexao: TConexao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 150
  Width = 215
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\Users\Criacao\Desktop\crudbasico\database\dados.sdb3'
      'LockingMode=Normal'
      'DriverID=SQLite')
    Left = 48
    Top = 16
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 144
    Top = 16
  end
end
