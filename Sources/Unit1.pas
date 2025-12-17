unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, StdCtrls, Buttons;

const
  hatar = 120;    //120 embernek adnak, fejenként 10 jegyet
  delta = 10;     //ennyivel nõ a timer intervalluma, hívásonként
  timerTo = 200;  //eddig nõ a timer intervalluma
  eltolas = 6;    //a sorsjegyek kiosztása ([6..15], [16..25], stb...)

type
  TForm1 = class(TForm)
    Image1: TImage;
    BitBtn1: TBitBtn;
    Timer1: TTimer;
    Timer2: TTimer;
    Timer3: TTimer;
    Timer4: TTimer;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Timer5: TTimer;
    procedure Timer5Timer(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    indit1 : boolean;
    indit2 : boolean;
    indit3 : boolean;
    indit4 : boolean;
    szamok : array of integer;
  public
    szam : string;  //kisorsolt szám
    x1 : integer;   //1-es számláló
    x2 : integer;   //2-es számláló
    x3 : integer;   //3-as számláló
    x4 : integer;   //4-es számláló
    procedure setSzamok;
    function sorsol(value: integer) : integer;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  setSzamok;
  Randomize();
  self.ClientWidth := 1024;
  self.ClientHeight := 768;

  x1 := 0;
  x2 := 0;
  x3 := 0;
  x4 := 0;
  indit1 := false;
  indit2 := false;
  indit3 := false;
  indit4 := false;
  timer1.Enabled := false;
  timer2.Enabled := false;
  timer3.Enabled := false;
  timer4.Enabled := false;
  timer5.Enabled := false;
  Label1.Caption := IntToStr(x1);
  Label2.Caption := IntToStr(x2);
  Label3.Caption := IntToStr(x3);
  Label4.Caption := IntToStr(x4);
  self.DoubleBuffered := true;
end;

procedure TForm1.setSzamok;
var i : integer;
begin
  SetLength(szamok, 0);
  SetLength(szamok, hatar);
  for i:=low(szamok) to high(szamok) do szamok[i] := i;
end;

function TForm1.sorsol(value: integer): integer;
var i : integer;
    temp : array of integer;
begin
  result := 0;
  SetLength(temp, 0);
  for i:=low(szamok) to high(szamok) do
  begin
    if (i <> value) then
    begin
      SetLength(temp, length(temp)+1);
      temp[high(temp)] := szamok[i];
    end
    else result := (szamok[i]*10)+Random(10)+eltolas;
  end;
  SetLength(szamok, 0);
  for i:=low(temp) to high(temp) do
  begin
    SetLength(szamok, i+1);
    szamok[high(szamok)] := temp[i];
  end;
  SetLength(temp, 0);
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  if (length(szamok) = 0) then exit;
  x1 := 0;
  x2 := 0;
  x3 := 0;
  x4 := 0;
  indit1 := false;
  indit2 := false;
  indit3 := false;
  indit4 := false;
  timer1.Interval := 10;
  timer2.Interval := 10;
  timer3.Interval := 10;
  timer4.Interval := 10;
  timer1.Enabled := true;
  timer2.Enabled := true;
  timer3.Enabled := true;
  timer4.Enabled := true;
  timer5.Interval := 2000;
  timer5.Enabled := true;
  Label1.Caption := IntToStr(x1);
  Label2.Caption := IntToStr(x2);
  Label3.Caption := IntToStr(x3);
  Label4.Caption := IntToStr(x4);
  szam := IntToStr(sorsol(random(high(szamok))));
  case Length(szam) of
    1 : szam := '000'+szam;
    2 : szam := '00'+szam;
    3 : szam := '0'+szam;
  end;
  application.ProcessMessages;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var s : string;
    b : boolean;
begin
  if (indit1) then
  begin
    timer1.Interval := timer1.Interval + delta;
  end;
  inc(x1);
  if (x1 > 9) then x1 := 0;
  Label1.Caption := IntToStr(x1);
  s := szam[1];
  b := (x1 = StrToInt(s));
  if (timer1.Interval >= timerTo) and b then
  begin
    indit1 := false;
    timer1.Enabled := false;
    indit2 := true;
  end;
  application.ProcessMessages;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
var s : string;
    b : boolean;
begin
  if (indit2) then
  begin
    timer2.Interval := timer2.Interval + delta;
  end;
  inc(x2);
  if (x2 > 9) then x2 := 0;
  Label2.Caption := IntToStr(x2);
  s := szam[2];
  b := (x2 = StrToInt(s));
  if (timer2.Interval >= timerTo) and b then
  begin
    indit2 := false;
    timer2.Enabled := false;
    indit3 := true;
  end;
  application.ProcessMessages;
end;

procedure TForm1.Timer3Timer(Sender: TObject);
var s : string;
    b : boolean;
begin
  if (indit3) then
  begin
    timer3.Interval := timer3.Interval + delta;
  end;
  inc(x3);
  if (x3 > 9) then x3 := 0;
  Label3.Caption := IntToStr(x3);
  s := szam[3];
  b := (x3 = StrToInt(s));
  if (timer3.Interval >= timerTo) and b then
  begin
    indit3 := false;
    timer3.Enabled := false;
    indit4 := true;
  end;
  application.ProcessMessages;
end;

procedure TForm1.Timer4Timer(Sender: TObject);
var s : string;
    b : boolean;
begin
  if (indit4) then
  begin
    timer4.Interval := timer4.Interval + delta;
  end;
  inc(x4);
  if (x4 > 9) then x4 := 0;
  Label4.Caption := IntToStr(x4);
  s := szam[4];
  b := (x4 = StrToInt(s));
  if (timer4.Interval >= timerTo) and b then
  begin
    indit4 := false;
    timer4.Enabled := false;
  end;
  application.ProcessMessages;
end;

procedure TForm1.Timer5Timer(Sender: TObject);
begin
  indit1 := true;
  timer5.Enabled := false;
end;

end.

