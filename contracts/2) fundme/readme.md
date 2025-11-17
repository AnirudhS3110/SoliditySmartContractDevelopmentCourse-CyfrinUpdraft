## Fund me
### If we are gonna mute a variable only diuring he time of initialization or only once throughou the cod, to make it gas efficient, There are tecniques to maek of the gas efficiently
### We can use Constant and Immutable.
### Generallhy COnstant Variable's names are written in Capitals
### Immutable variable types are used where variables are initialised but are not declared its value yet, but only once will their value chnage, for those kind of values we can use this
### 
### Generallhy the variable names are stated with i_ + the name.
### Reason for this cost saving is, we wont store tnese datas as containers, they get diorectly stored in the  BYtE Code, thereofre usng immmutable variable or constant varibale we sd be veru carefully

## Custom Errors:
### Instead of usinfg revert we can create custom errors, this will reduce gas cost as ther wont be any string as error message stored (in revert string )
### Custom errors must be created outside of a contract