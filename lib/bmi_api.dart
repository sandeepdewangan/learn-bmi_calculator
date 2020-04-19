
class BMI{
  int weight;
  int age;
  int height;

  BMI({this.weight, this.height, this.age});

  String getBMI(){
    double bmi = this.weight / ((this.height/100) * (this.height/100));
    return bmi.toStringAsFixed(1);
  }
}