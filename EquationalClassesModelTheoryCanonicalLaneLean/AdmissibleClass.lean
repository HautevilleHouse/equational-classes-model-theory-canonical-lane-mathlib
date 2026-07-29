import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EquationalClassesModelTheoryCanonicalLaneLean

structure EquationalAdmittedObject where
  signature : Type u
  equationSet : Prop
  variety : Prop
  conclusion : variety

structure AdmissibleClass where
  object : EquationalAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  EquationalWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end EquationalClassesModelTheoryCanonicalLaneLean
end HautevilleHouse