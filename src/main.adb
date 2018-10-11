with Ada.Text_IO;      use Ada.Text_IO;
with Functions;    use Functions;

procedure Main is
   Decimal : Integer;
begin
   
   Decimal := BinaryToDecimal( (false,false,false,false,false,false,
                             false,false,false,false,false,False,
                             false,false,false,false,false,False,
                             false,false,false,false,false,False,
                             false,false,false,false,true,false,
                             true,false) );
   Put_Line(Decimal'Image);


end Main;
