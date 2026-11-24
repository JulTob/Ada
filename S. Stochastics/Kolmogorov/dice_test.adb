--# Prueba del espacio de probabilidad de Kolmogorov con un dado.
--# Compilar con -gnata para que los contratos (Pre, Post, Type_Invariant)
--# se comprueben en ejecucion.
with Ada.Text_IO;
with Ada.Assertions;
with Kolmogorov_Spaces;

procedure Dice_Test is

    use Ada.Text_IO;

    ------------------------------------------------------------------
    -- El espacio muestral: las seis caras.
    ------------------------------------------------------------------

    type Die_Face is range 1 .. 6;

    package Die is new Kolmogorov_Spaces (Omega => Die_Face);
    use Die;

    ------------------------------------------------------------------
    -- Eventos
    ------------------------------------------------------------------

    Even : constant Event := (2 | 4 | 6 => True, others => False);
    Odd  : constant Event := not Even;
    Low  : constant Event := (1 | 2 | 3 => True, others => False);
    Six  : constant Event := (6 => True, others => False);

    ------------------------------------------------------------------
    -- Variables aleatorias
    ------------------------------------------------------------------

    --# X(w) = el valor de la cara.
    function Face_Value (W : Die_Face) return Real is
        (Real (W));

    --# Indicadora de "sacar un seis": vale 1 si sale seis, 0 si no.
    function Indicator_Of_Six (W : Die_Face) return Real is
        (if W = 6 then 1.0 else 0.0);

    ------------------------------------------------------------------
    -- Un comprobador minimo
    ------------------------------------------------------------------

    Failures : Natural := 0;

    procedure Check (
            Name     : in String;
            Got      : in Real;
            Expected : in Real
            ) is
        begin
        if Almost_Equal (Got, Expected) then
            Put_Line ("  PASS  " & Name & " = " & Real'Image (Got));
        else
            Failures := Failures + 1;
            Put_Line ("  FAIL  " & Name
                      & " got " & Real'Image (Got)
                      & " expected " & Real'Image (Expected));
            end if;
        end Check;

    procedure Check (
            Name     : in String;
            Got      : in Boolean;
            Expected : in Boolean
            ) is
        begin
        if Got = Expected then
            Put_Line ("  PASS  " & Name);
        else
            Failures := Failures + 1;
            Put_Line ("  FAIL  " & Name);
            end if;
        end Check;

    ------------------------------------------------------------------
    -- Las pruebas
    ------------------------------------------------------------------

    procedure Test_Event_Algebra is
        begin
        Put_Line ("Algebra de eventos");
        Check ("Even and Odd son disjuntos",      Are_Disjoint (Even, Odd), True);
        Check ("Even and Low no son disjuntos",   Are_Disjoint (Even, Low), False);
        Check ("Six esta contenido en Even",      Is_Subset (Six, Even),    True);
        Check ("Even or Odd = Omega",             (Even or Odd) = Certain_Event, True);
        Check ("Even and Odd = vacio",            (Even and Odd) = Impossible_Event, True);
        Check ("not (not Even) = Even",           (not (not Even)) = Even,  True);
        end Test_Event_Algebra;

    procedure Test_Fair_Die is
        Fair : constant Measure := Uniform;
        begin
        Put_Line ("Dado justo");
        Check ("P(Omega)",            Real (Probability_Of (Fair, Certain_Event)),    1.0);
        Check ("P(vacio)",            Real (Probability_Of (Fair, Impossible_Event)), 0.0);
        Check ("P(Even)",             Real (Probability_Of (Fair, Even)),             0.5);
        Check ("P(Low)",              Real (Probability_Of (Fair, Low)),              0.5);
        Check ("P(Even and Low)",     Real (Probability_Of (Fair, Even and Low)),     1.0 / 6.0);
        Check ("P(Even or Low)",      Real (Probability_Of (Fair, Even or Low)),      5.0 / 6.0);
        Check ("P(Even or Odd) axioma 3",
               Real (Probability_Of_Union (Fair, Even, Odd)),  1.0);
        Check ("P(not Six)",          Real (Probability_Of_Complement (Fair, Six)),   5.0 / 6.0);
        Check ("E[X]",                Expectation (Fair, Face_Value'Access),          3.5);
        Check ("Var[X]",              Variance (Fair, Face_Value'Access),             35.0 / 12.0);
        Check ("E[1_Six] = P(Six)",   Expectation (Fair, Indicator_Of_Six'Access),    1.0 / 6.0);
        end Test_Fair_Die;

    procedure Test_Loaded_Die is
        --# Un dado trucado: el seis sale la mitad de las veces.
        Loaded : constant Measure := Make (
            (6 => 0.5, others => 0.1)
            );
        begin
        Put_Line ("Dado trucado");
        Check ("P(Six)",   Real (Probability_Of (Loaded, Six)),  0.5);
        Check ("P(Even)",  Real (Probability_Of (Loaded, Even)), 0.7);
        Check ("E[X]",     Expectation (Loaded, Face_Value'Access), 0.1 * 15.0 + 0.5 * 6.0);
        end Test_Loaded_Die;

    procedure Test_Axiom_Violation_Is_Rejected is
        --# Una masa que suma 1.1 viola el Axioma 2. Make debe rechazarla.
        begin
        Put_Line ("Rechazo de medidas invalidas");
        declare
            Bad : constant Measure := Make ((1 => 0.6, others => 0.1));
            begin
            Failures := Failures + 1;
            Put_Line ("  FAIL  Make acepto una masa que suma 1.1: P(Six) ="
                      & Probability'Image (Probability_Of (Bad, Six)));
            end;
        exception
            when Ada.Assertions.Assertion_Error =>
                Put_Line ("  PASS  Make rechazo una masa que suma 1.1 (Pre fallida)");
        end Test_Axiom_Violation_Is_Rejected;

    procedure Test_Additivity_Needs_Disjoint_Events is
        --# Even y Low comparten el 2. Pedir la union aditiva viola la Pre.
        Fair : constant Measure := Uniform;
        begin
        Put_Line ("La aditividad exige eventos disjuntos");
        declare
            P : constant Probability := Probability_Of_Union (Fair, Even, Low);
            begin
            Failures := Failures + 1;
            Put_Line ("  FAIL  acepto eventos no disjuntos: " & Probability'Image (P));
            end;
        exception
            when Ada.Assertions.Assertion_Error =>
                Put_Line ("  PASS  Probability_Of_Union rechazo eventos no disjuntos (Pre fallida)");
        end Test_Additivity_Needs_Disjoint_Events;

    begin
    Test_Event_Algebra;
    Test_Fair_Die;
    Test_Loaded_Die;
    Test_Axiom_Violation_Is_Rejected;
    Test_Additivity_Needs_Disjoint_Events;

    New_Line;
    if Failures = 0 then
        Put_Line ("Todas las pruebas pasaron.");
    else
        Put_Line ("Fallos:" & Natural'Image (Failures));
        raise Program_Error with "pruebas fallidas";
        end if;
    end Dice_Test;
