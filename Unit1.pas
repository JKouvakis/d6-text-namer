unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Grids, FileCtrl, DBCtrls, StrUtils;

type
  TForm1 = class(TForm)
    Button2: TButton;
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    ListBox1: TListBox;
    Memo1: TMemo;
    SaveDialog1: TSaveDialog;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Myfiles: array of string;
  Filenames: string;
  maxfiles: integer;
  F: file;
const
        subject='subject:';
implementation

{$R *.dfm}

function clearnm(namen:string):string;
begin
     namen:= AnsiReplaceText(namen,':','-');
     namen:= AnsiReplaceText(namen,'/','-');
     namen:= AnsiReplaceText(namen,'*','-');
     namen:= AnsiReplaceText(namen,'<','-');
     namen:= AnsiReplaceText(namen,'>','-');
     namen:= AnsiReplaceText(namen,'?','-');
     namen:= AnsiReplaceText(namen,':','-');
     namen:= AnsiReplaceText(namen,'"','-');
     namen:= AnsiReplaceText(namen,'|','-');
     Result:= AnsiReplaceText(namen,'\','-');
end;

procedure TForm1.Button1Click(Sender: TObject);

var
  I: integer;
  F: TextFile;
  FirstLine, newname: string;

begin
  OpenDialog1.Options := [ofAllowMultiSelect, ofFileMustExist];
  OpenDialog1.Filter := 'Text files (*.txt)|*.txt|All files (*.*)|*.*';
  OpenDialog1.FilterIndex := 2; { start the dialog showing all files }
  memo1.Clear;
  listbox1.Clear;
  if OpenDialog1.Execute then
    with OpenDialog1.Files do
    begin
      setlength(Myfiles,Count);
      for I:=0 to Count -1 do
          Myfiles[I]:='';
      for I := 0 to Count - 1 do
      begin
        AssignFile(F, Strings[I]);  { next file in Files property }
        listbox1.AddItem(strings[I],listbox1);
        Reset(F);
        while not Eof(F) do
        begin
                Readln(F,FirstLine);  { Read the first line out of the file }
                if AnsiContainsText(FirstLine , subject) then
                begin

                        newname:=midstr(FirstLine,9,length(FirstLine));
                        newname:=clearnm(newname);
                        Myfiles[I] := newname;
                        memo1.Lines.Append(myfiles[I]);
                end;
        end;
    CloseFile(F);
    end;
  end;
end;


procedure TForm1.FormCreate(Sender: TObject);
begin
memo1.Clear;
end;

procedure TForm1.Button2Click(Sender: TObject);
var F: file;
    I: integer;
    clearname,newname: string;
begin


       for I:= 0 to listbox1.Items.Count -1 do
       begin
//        assignfile(F,listbox1.Items.Strings[I]);
        newname:=Myfiles[I];
        Clearname:= midstr(extractfilename( listbox1.Items.Strings[I]),1,length(extractfilename( listbox1.Items.Strings[I]))-4);
        if fileexists(listbox1.Items.Strings[I]) then
//                renameFile(F,Clearname + ' - ' + newname + '.txt');
        if not RenameFile(listbox1.Items.Strings[I],Clearname + ' - ' + newname + '.txt') then
          MessageDlg('Error renaming file!',mtError,[mbOK],0);
        end;

end;
end.
