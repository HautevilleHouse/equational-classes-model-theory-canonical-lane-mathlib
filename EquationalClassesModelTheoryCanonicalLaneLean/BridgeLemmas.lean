import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EquationalClassesModelTheoryCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  EquationalWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end EquationalClassesModelTheoryCanonicalLaneLean
end HautevilleHouse