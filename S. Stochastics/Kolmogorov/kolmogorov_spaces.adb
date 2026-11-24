package body Kolmogorov_Spaces is

    ------------------------------------------------------------------
    -- Auxiliares
    ------------------------------------------------------------------

    function Clamp_To_Probability (Value : Real) return Probability is
        begin
        if Value < 0.0 then
            return 0.0;
        elsif Value > 1.0 then
            return 1.0;
        else
            return Probability (Value);
            end if;
        end Clamp_To_Probability;

    ------------------------------------------------------------------
    -- F : el algebra de eventos
    ------------------------------------------------------------------

    function "not" (A : Event) return Event is
        Result : Event;
        begin
        for W in Omega loop
            Result (W) := not A (W);
            end loop;
        return Result;
        end "not";

    function "and" (A, B : Event) return Event is
        Result : Event;
        begin
        for W in Omega loop
            Result (W) := A (W) and B (W);
            end loop;
        return Result;
        end "and";

    function "or" (A, B : Event) return Event is
        Result : Event;
        begin
        for W in Omega loop
            Result (W) := A (W) or B (W);
            end loop;
        return Result;
        end "or";

    function Are_Disjoint (A, B : Event) return Boolean is
        ((A and B) = Impossible_Event);

    function Is_Subset (A, B : Event) return Boolean is
        ((A and B) = A);

    ------------------------------------------------------------------
    -- P : la medida de probabilidad
    ------------------------------------------------------------------

    --# Acumulamos en Real, no en Probability: una suma parcial puede
    --# pasar de 1.0 por redondeo y el tipo restringido lo rechazaria.
    function Total_Mass (M : Mass_Function) return Real is
        Sum : Real := 0.0;
        begin
        for W in Omega loop
            Sum := Sum + Real (M (W));
            end loop;
        return Sum;
        end Total_Mass;

    function Satisfies_Normalisation (P : Measure) return Boolean is
        (Is_Normalised (P.Mass));

    function Uniform return Measure is
        Atom_Count : constant Real := Real (Omega'Pos (Omega'Last) - Omega'Pos (Omega'First) + 1);
        Weight     : constant Probability := Probability (1.0 / Atom_Count);
        begin
        return (Mass => (others => Weight));
        end Uniform;

    function Make (
            Mass : in Mass_Function
            ) return Measure is
        begin
        return (Mass => Mass);
        end Make;

    function Mass_Of (
            P : in Measure;
            W : in Omega
            ) return Probability is
        (P.Mass (W));

    --# Sumamos los atomos que pertenecen al evento.
    --# Al final acotamos a [0,1] para absorber el redondeo flotante.
    function Probability_Of (
            P : in Measure;
            A : in Event
            ) return Probability is
        Sum : Real := 0.0;
        begin
        for W in Omega loop
            if A (W) then
                Sum := Sum + Real (P.Mass (W));
                end if;
            end loop;
        return Clamp_To_Probability (Sum);
        end Probability_Of;

    function Probability_Of_Union (
            P    : in Measure;
            A, B : in Event
            ) return Probability is
        (Probability_Of (P, A or B));

    function Probability_Of_Complement (
            P : in Measure;
            A : in Event
            ) return Probability is
        (Probability_Of (P, not A));

    ------------------------------------------------------------------
    -- Variables aleatorias y esperanza
    ------------------------------------------------------------------

    function Expectation (
            P : in Measure;
            X : in Random_Variable
            ) return Real is
        Sum : Real := 0.0;
        begin
        for W in Omega loop
            Sum := Sum + X (W) * Real (P.Mass (W));
            end loop;
        return Sum;
        end Expectation;

    function Variance (
            P : in Measure;
            X : in Random_Variable
            ) return Real is
        Mean : constant Real := Expectation (P, X);
        Sum  : Real := 0.0;
        begin
        for W in Omega loop
            Sum := Sum + (X (W) - Mean) ** 2 * Real (P.Mass (W));
            end loop;
        return Sum;
        end Variance;

end Kolmogorov_Spaces;
