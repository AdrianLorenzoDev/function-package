--  Anade mas tests para comprobar todas las combinaciones de
--  operadores positivos, negativos y el cero.

with Ada.Text_IO;     use Ada.Text_IO;
with Test_Assertions; use Test_Assertions;
with Functions;      use Functions;

procedure Test_Functions is

   -- Sucesion Function Tests
   procedure Test_S_1 is
      test :  T_Sucesion := (5,10,15,20,25,30,35,40,45);
   begin
      Assert_True (Sucesion (9, 5) = test,
                   "Array of 9 multiplies of 5");
   exception
      when others =>
         null;
   end Test_S_1;

   procedure Test_S_2 is
      test : T_Sucesion (1..1) := (1 => 1);
   begin
      Assert_True (Sucesion (1, 1) = test,
                   "Array of 1 multiply of 1");
   exception
      when others =>
         null;
   end Test_S_2;

   procedure Test_S_3 is
      test : T_Sucesion(1..27) := (others => 0);
   begin
      Assert_True (Sucesion (27, 0) = test,
                   "Array of 27 multiplies of 0");
   exception
      when others =>
         null;
   end Test_S_3;

   procedure Test_S_4 is
      test : T_Sucesion := (9,18,27,36,45,54,63,72,81,90);
   begin
      Assert_True (Sucesion (10,9) = test,
                   "Array of 10 multiplies of 9");
   exception
      when others =>
         null;
   end Test_S_4;


   -- Positive or Negative Function Tests
   procedure Test_PON_1 is
   begin
      Assert_True (PositiveOrNegative (1) = TRUE, "Value=1 Assert_True");
   exception
      when others =>
         null;
   end Test_PON_1;

   procedure Test_PON_2 is
   begin
      Assert_False (PositiveOrNegative (-1) = TRUE, "Value=-1 Assert_False");
   exception
      when others =>
         null;
   end Test_PON_2;

   procedure Test_PON_3 is
   begin
      Assert_False (PositiveOrNegative (0) = FALSE, "Value=0 Assert_False");
   exception
      when others =>
         null;
   end Test_PON_3;

   procedure Test_PON_4 is
   begin
      Assert_True (PositiveOrNegative (-90) = FALSE, "Value=-90 Assert_True");
   exception
      when others =>
         null;
   end Test_PON_4;

   -- Sucesion Function Tests
   procedure Test_PONV_1 is
   begin
      Assert_True (PositiveOrNegativeVector
                   ((1,5,7)) = (-1,-5,-7),"Vector (1,5,7)");
   exception
      when others =>
         null;
   end Test_PONV_1;

   procedure Test_PONV_2 is
   begin
      Assert_True (PositiveOrNegativeVector
                   ((1,5,7,9,-8)) = (-1,-5,-7,-9,8),"Vector (1,5,7,9,-8)");
   exception
      when others =>
         null;
   end Test_PONV_2;

   procedure Test_PONV_3 is
   begin
      Assert_True (PositiveOrNegativeVector
                   ((-1,-5,-7)) = (1,5,7),"Vector (-1,-5,-7)");
   exception
      when others =>
         null;
   end Test_PONV_3;

   procedure Test_PONV_4 is
   begin
      Assert_True (PositiveOrNegativeVector
                   ((0,1)) = (0,-1),"Vector (0,1)");
   exception
      when others =>
         null;
   end Test_PONV_4;


   -- MultVector Function Tests
   procedure Test_MV_1 is
   begin
      Assert_True (MultVector((1,3,6)) = 18, "1*3*6");
   exception
      when others =>
         null;
   end Test_MV_1;

   procedure Test_MV_2 is
   begin
      Assert_True (MultVector((5,5,1)) = 25, "5*5*1");
   exception
      when others =>
         null;
   end Test_MV_2;

   procedure Test_MV_3 is
   begin
      Assert_True (MultVector((1,1,1)) = 1, "1*1*1");
   exception
      when others =>
         null;
   end Test_MV_3;

   procedure Test_MV_4 is
   begin
      Assert_False (MultVector((1,3,6)) = 2, "1*3*6");
   exception
      when others =>
         null;
   end Test_MV_4;


   -- MidTerm Function Tests
   procedure Test_MT_1 is
      Array_Test_1 : B_Binary := (False, False, True, True);
   begin
      Assert_True (MidTerm ((1, 2, 3, 4), 3, 4) = Array_Test_1,
                   "Array with Four Elements, 2 in range");
   exception
      when others =>
         null;
   end Test_MT_1;

   procedure Test_MT_2 is
      Array_Test_2 : B_Binary := (False, False, False, False);
   begin
      Assert_True ( MidTerm ((1, 2, 3, 4), 5, 7) = Array_Test_2,
                    "Array with Four Elements, none in range");
   exception
      when others =>
         null;
   end Test_MT_2;

   procedure Test_MT_3 is
      Array_Test_3 : B_Binary := (True, True, True, True);
   begin
      Assert_True (MidTerm ((1, 2, 3, 4), 1, 4) = Array_Test_3,
                   "Array with Four Elements, all in range");
   exception
      when others =>
         null;
   end Test_MT_3;



begin

   Put_Line ("--- Test_Functions ---");
   New_Line;
   New_Line;

   Put_Line ("**Sucesion function tests**");
   New_Line;
   Test_S_1;
   Test_S_2;
   Test_S_3;
   Test_S_4;
   New_Line;
   New_Line;

   Put_Line ("**PositiveOrNegative function tests**");
   New_Line;
   Test_PON_1;
   Test_PON_2;
   Test_PON_3;
   Test_PON_4;
   New_Line;
   New_Line;

   Put_Line ("**PositiveOrNegativeVector function tests**");
   New_Line;
   Test_PONV_1;
   Test_PONV_2;
   Test_PONV_3;
   Test_PONV_4;
   New_Line;
   New_Line;

   Put_Line ("**MultVector function tests**");
   New_Line;
   Test_MV_1;
   Test_MV_2;
   Test_MV_3;
   Test_MV_4;
   New_Line;
   New_Line;

   Put_Line ("**MidTerm function tests**");
   New_Line;
   Test_MT_1;
   Test_MT_2;
   Test_MT_3;
   New_Line;
   New_Line;

end Test_Functions;
