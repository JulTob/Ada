--# Kolmogorov_Spaces
--#
--# Un espacio de probabilidad (Omega, F, P) sobre un espacio muestral FINITO.
--#
--#   Omega : cualquier tipo discreto (enumerado o entero acotado).
--#   F     : la sigma-algebra. Sobre un Omega finito es el conjunto potencia,
--#           asi que un Evento es simplemente un subconjunto de Omega.
--#   P     : la medida. Una funcion de masa sobre los atomos de Omega.
--#
--# Los tres axiomas de Kolmogorov aparecen como contratos, no como comentarios:
--#   Axioma 1 (no negatividad) : el tipo Probability no admite valores fuera de [0,1].
--#   Axioma 2 (normalizacion)  : Type_Invariant de Measure, P(Omega) = 1.
--#   Axioma 3 (aditividad)     : Post de Probability_Of_Union.
generic
    type Omega is (<>);
package Kolmogorov_Spaces is

    ------------------------------------------------------------------
    -- Numeros
    ------------------------------------------------------------------

    --# Un real de proposito general para variables aleatorias.
    type Real is digits 15;

    --# Una probabilidad. El rango [0,1] es parte del tipo:
    --# asignar 1.3 o -0.1 es un error detectado por Ada, no por nosotros.
    type Probability is digits 15 range 0.0 .. 1.0;

    --# Tolerancia para comparar sumas de reales. Los flotantes no suman exacto.
    Epsilon : constant Real := 1.0E-12;

    function Almost_Equal (A, B : Real) return Boolean is
        (abs (A - B) <= Epsilon);

    ------------------------------------------------------------------
    -- F : el algebra de eventos
    ------------------------------------------------------------------

    --# Un evento es un subconjunto de Omega: True donde el atomo pertenece.
    type Event is array (Omega) of Boolean;

    Certain_Event    : constant Event := (others => True);   -- Omega
    Impossible_Event : constant Event := (others => False);  -- conjunto vacio

    --# Sobrecargar los operadores permite escribir teoremas como se leen.
    function "not" (A : Event) return Event;        -- complemento
    function "and" (A, B : Event) return Event;     -- interseccion
    function "or"  (A, B : Event) return Event;     -- union

    function Are_Disjoint (A, B : Event) return Boolean;
    function Is_Subset    (A, B : Event) return Boolean;   -- A contenido en B

    ------------------------------------------------------------------
    -- P : la medida de probabilidad
    ------------------------------------------------------------------

    --# Una funcion de masa: cuanto pesa cada atomo.
    --# Es publica para que el usuario pueda construir medidas a mano.
    type Mass_Function is array (Omega) of Probability;

    function Total_Mass (M : Mass_Function) return Real;

    function Is_Normalised (M : Mass_Function) return Boolean is
        (Almost_Equal (Total_Mass (M), 1.0));

    --# La medida es privada: nadie puede fabricar una que viole el Axioma 2.
    type Measure is private
        with Type_Invariant => Satisfies_Normalisation (Measure);

    function Satisfies_Normalisation (P : Measure) return Boolean;

    --# Constructores.
    function Uniform return Measure;

    function Make (
            Mass : in Mass_Function
            ) return Measure
        with Pre => Is_Normalised (Mass);

    --# Consultas.
    function Mass_Of (
            P : in Measure;
            W : in Omega
            ) return Probability;

    function Probability_Of (
            P : in Measure;
            A : in Event
            ) return Probability;

    --# Axioma 3, aditividad finita, como poscondicion.
    function Probability_Of_Union (
            P    : in Measure;
            A, B : in Event
            ) return Probability
        with
            Pre  => Are_Disjoint (A, B),
            Post => Almost_Equal (
                        Real (Probability_Of_Union'Result),
                        Real (Probability_Of (P, A)) + Real (Probability_Of (P, B))
                        );

    --# Teorema derivado: P(not A) = 1 - P(A).
    function Probability_Of_Complement (
            P : in Measure;
            A : in Event
            ) return Probability
        with Post => Almost_Equal (
                        Real (Probability_Of_Complement'Result),
                        1.0 - Real (Probability_Of (P, A))
                        );

    ------------------------------------------------------------------
    -- Variables aleatorias y esperanza
    ------------------------------------------------------------------

    --# Una variable aleatoria es una funcion medible Omega -> Real.
    --# En un espacio finito toda funcion es medible.
    type Random_Variable is access function (W : Omega) return Real;

    --# Integral de Lebesgue respecto a P.
    --# En el caso finito es una suma ponderada: E[X] = sum X(w) * P({w}).
    function Expectation (
            P : in Measure;
            X : in Random_Variable
            ) return Real;

    --# Var[X] = E[(X - E[X])^2]. Nunca negativa.
    function Variance (
            P : in Measure;
            X : in Random_Variable
            ) return Real
        with Post => Variance'Result >= -Epsilon;

private

    type Measure is record
        Mass : Mass_Function;
        end record;

end Kolmogorov_Spaces;
