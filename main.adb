with Ada.Text_IO;     use Ada.Text_IO;
with Test_Assertions; use Test_Assertions;
with Trabajo;         use Trabajo;

procedure Main is

   procedure Test_1 is
      changeC1 : String := "hala";
      changeC2 : String := "esto es Programacion Tres";
      changeC3 : String := "345 785 284 574 555";
      changeC4 : String := "";
   begin
      changeC(changeC1, 'o','a');
      Assert_True(changeC1 = "holo", "Prueba changeC 1");
      changeC(changeC2, 'z','e');
      Assert_True(changeC2 = "zsto zs Programacion Trzs", "Prueba changeC 2");
      changeC(changeC3, '0','5');
      Assert_True(changeC3 = "340 780 284 074 000", "Prueba changeC 3");
      changeC(changeC4, '0','5');
      Assert_True(changeC4 = "", "Prueba changeC 4");
      changeC(changeC2, '-' , ' ');
      Assert_True(changeC2 = "zsto-zs-Programacion-Trzs", "Prueba changeC 5");
      changeC(changeC2, ' ' , '-');
      Assert_True(changeC2 = "zsto zs Programacion Trzs", "Prueba changeC 6");

   exception
      when others =>
         null;
   end Test_1;

   procedure Test_2 is
      Arr1 : N_Array := (1,3,5,7,9,11,13);
      Arr11 : N_Array := (1,3,5,7,9,11,13);
      Arr2 : N_Array := (1,2,3,4,5,6,7,8,9,10);
      Arr22 : N_Array := (1,0,3,0,5,0,7,0,9,0);
      Arr3 : N_Array := (0,0,0,0,0,0,0,0,0,0,0);
      Arr33 : N_Array := (0,0,0,0,0,0,0,0,0,0,0);
      Arr333 : N_Array := (2,4,6,8,10,12,14,16,18,20,22);
   begin
      replaceEven(Arr1);
      Assert_True(Arr1 = Arr11, "Prueba replaceEven 1");
      replaceEven(Arr2);
      Assert_True(Arr2 = Arr22, "Prueba replaceEven 2");
      replaceEven(Arr3);
      Assert_True(Arr3 = Arr33, "Prueba replaceEven 3");
      replaceEven(Arr333);
      Assert_True(Arr333 = Arr3, "Prueba replaceEven 4");
   exception
      when others =>
         null;
   end Test_2;

   procedure Test_3 is
   begin
      Assert_True(Substring("Prueba",1) = "Prueba" , "Prueba Substring 1");
      Assert_True(Substring("Prueba",2) = "rueba" , "Prueba Substring 2");
      Assert_True(Substring("Prueba",3) = "ueba","Prueba Substring 3");
      Assert_True(Substring("Hola esto es una prueba",18) = "prueba","Prueba Substring 4");
      Assert_True(Substring(" ",1) = " ","Prueba Substring 5");

   exception
      when others =>
        null;
   end Test_3;


begin
   Test_1;
   Test_2;
   Test_3;
end Main;
