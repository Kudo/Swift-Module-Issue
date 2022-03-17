import ModuleA
import ModuleB

public class ClassAContainer : ModuleA.ClassA {
  public override func methodA() {
    print("[ClassContainer] overridden methodA called")
  }
}

public class ClassBContainer : ModuleB.ClassB {
  public override func methodB() {
    print("[ClassContainer] overridden methodB called")
  }
}
