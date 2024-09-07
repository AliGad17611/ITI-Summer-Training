void main(){
  divide(firstNumber: 15, secondNumber: 0 );
}
void divide({required int firstNumber,required int secondNumber}){
  if(secondNumber == 0){
    print("Second number can't be zero");
  }else{
    print('the result of division is ${firstNumber / secondNumber}');
  }
}