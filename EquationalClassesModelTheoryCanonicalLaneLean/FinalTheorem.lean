import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EquationalClassesModelTheoryCanonicalLaneLean

def ConstrainedEquationalClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_equational_endgame (A : AdmissibleClass) :
    ConstrainedEquationalClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end EquationalClassesModelTheoryCanonicalLaneLean
end HautevilleHouse