with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Calendar;
--with Ada.Strings.Unbounded;

procedure Day_List_File is

    --Renames--
    package T_IO renames Ada.Text_IO;
    package I_IO renames Ada.Integer_Text_IO;
    Package Cal renames Ada.Calendar;

    --Fnc&Prd--
    function Get_Date_Time( Year_In: Cal.Year_Number, Month_In: Cal.Month_Name) return Cal.Time is
      begin -- Get_Date_Time
        return Time_Of (Year => Year_In, Month=> Month_In, Hour=>0);
        end Get_Date_Time;

    --Variables--
    Date_String : String;
    Initial_Date_Time   : Cal.Time;
    Final_Date_Time     : Cal.Time;


  begin --Day_List_File
      T_IO.put("Fecha inicidal: [mm/dd] ");
      T_IO.Get(Date_String);
      Initial_Date_Time:=Get_Date_Time()
    end Day_List_File;
