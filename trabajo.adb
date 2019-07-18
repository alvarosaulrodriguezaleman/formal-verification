package body trabajo with SPARK_Mode => On is
   
   procedure changeC (Str : in out String;
                      charOn, charOff : Character) is
   begin
      for J in Str'Range loop
         if Str(J) = charOff then
            Str(J) := charOn; 
         end if;
         
         pragma Loop_Invariant(for all K in Str'First .. J =>
                                  (if Str'Loop_Entry(K) = charOff then Str(K) = charOn else
                                  Str(K) = Str'Loop_Entry(K)));
      end loop;  
      
   end changeC;
     
   procedure replaceEven (Arr : in out N_Array) is
      J : Integer := Arr'First;
   begin     
      loop
         if (Arr(J) mod 2) = 0 then
            Arr(J) := 0;  
         end if;
         
         pragma Loop_Variant(Increases => J);
         pragma Loop_Invariant(J in Arr'Range);

         pragma Loop_Invariant
           (for all K in Arr'First .. J =>
              (if (Arr'Loop_Entry(K) rem 2) = 0 then 
                    Arr(K) = 0 
               else
                    Arr(K) = Arr'Loop_Entry(K)));

         pragma Loop_Invariant
           (for all K in J .. Arr'Last =>
              (if K /= J then 
                  Arr(K) = Arr'Loop_Entry(K)));

         exit when J = Arr'Last;
         J := J + 1;
      end loop;
      
   end replaceEven;
 
   
   function Substring (Str : String; pos : Integer) return String is
      aux : Integer := pos;
      Straux : String (pos..Str'Last) := (others=>' ');  
   begin
      while aux <= Straux'Last loop   
         Straux(aux) := Str(aux);
         
         pragma Loop_Invariant(aux in Straux'Range);
         pragma Loop_Invariant(for all K in Straux'First..aux =>
                                  Straux(K) = Str(K));
         pragma Loop_Variant (Increases => aux);  
         
         aux := aux + 1;
      end loop;
      return Straux;
      
   end Substring;
   
end trabajo;
