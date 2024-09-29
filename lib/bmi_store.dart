import 'dart:ui';

import 'package:velocity_x/velocity_x.dart';

import 'constants.dart';
import 'screens/input_page.dart';

class BMIStore extends VxStore{
  int height = 180;
  int weight = 60;
  int age=20;
  Sex choice = Sex.Male;
  Color maleCardColor = kActiveCardColor;
  Color femaleCardColor = kInactiveCardColor;

  @override
  String toString(){
    return "Height - $height, Age - $age,Weight - $weight, $choice";
  }
}
class LogInterceptor extends VxInterceptor{
  @override
  void afterMutation(VxMutation<VxStore?> mutation) {
    print("Current state - ${mutation.store.toString()}");
  }

  @override
  bool beforeMutation(VxMutation<VxStore?> mutation) {
    print("Previous sate - ${mutation.store.toString()}");
    return true;
  }

}
class ChangeHeight extends VxMutation<BMIStore>{
  late final int height;
  ChangeHeight(this.height);
  @override
  perform() {
   store!.height= height;
  }
}
class ChangeAge extends VxMutation<BMIStore>{
  late final int age;
  ChangeAge(this.age);
  @override
  perform() {
    store!.age= age;


  }
}
class ChangeWeight extends VxMutation<BMIStore>{
  late final int weight;
  ChangeWeight(this.weight);
  @override
  perform() {
    store!.weight= weight;
  }
}
class ChangeGender extends VxMutation<BMIStore>{
  late final Sex choice;
  ChangeGender(this.choice);
  @override
  perform() {
    store!.choice= choice;
    if(choice == Sex.Male){
      store!.maleCardColor = kActiveCardColor;
      store!.femaleCardColor=kInactiveCardColor;
    }else{
      store!.maleCardColor = kInactiveCardColor;
      store!.femaleCardColor=kActiveCardColor;
    }
  }
}