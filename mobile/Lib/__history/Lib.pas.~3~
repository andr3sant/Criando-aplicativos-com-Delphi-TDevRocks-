unit Lib;

interface

uses
  System.SysUtils;

type
  TLib = class
    private

    public
      constructor Create;
      destructor Destroy;
      function GetObjectID: String;
    published

  end;

implementation

{ TLib }

constructor TLib.Create;
begin
  inherited Create;
end;

destructor TLib.Destroy;
begin
  inherited Destroy;
end;

function TLib.GetObjectID: String;
var
  UID : TGuid;
begin
  Result := '';
  CreateGUID(UID);
  Result := Copy(GUIDToString(UID), 2, Length(GUIDToString(UID))-2);
end;

end.
