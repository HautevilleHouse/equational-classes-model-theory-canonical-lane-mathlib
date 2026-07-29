import canonicalLaneMathlib.AdmissibleClass
import EquationalClassesModelTheoryCanonicalLaneLean.AdmittedObject
import EquationalClassesModelTheoryCanonicalLaneLean.EquationalClassPackage
import EquationalClassesModelTheoryCanonicalLaneLean.VarietyPackage

namespace HautevilleHouse
namespace EquationalClassesModelTheoryCanonicalLaneLean

structure BirkhoffTheoremPackage (S : EquationalSignature) where
  variety : VarietyPackage S
  equationalClass : EquationalClassPackage S
  equivalence : (VarietyClosed variety) ↔ (EquationalClassClosed equationalClass)

def BirkhoffEvidence {S : EquationalSignature} (B : BirkhoffTheoremPackage S) : Prop :=
  B.equivalence

def BirkhoffClosed {S : EquationalSignature} (B : BirkhoffTheoremPackage S) : Prop :=
  B.equivalence

theorem birkhoff_closed_from_evidence {S : EquationalSignature} (B : BirkhoffTheoremPackage S) (E : BirkhoffEvidence B) :
    BirkhoffClosed B := by
  exact E

end EquationalClassesModelTheoryCanonicalLaneLean
end HautevilleHouse