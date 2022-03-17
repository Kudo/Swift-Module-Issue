import ModuleA
import ModuleB

public class ClassAContainer : ClassA {
  public override func methodA() {
    print("[ClassContainer] overridden methodA called")
  }
}

public class ClassBContainer : ClassB {
  public override func methodB() {
    print("[ClassContainer] overridden methodB called")
  }
}
