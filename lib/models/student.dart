class Student {
  int ID = 0;
  String Name = "";
  String FirstName = "";
  String LastName ="";
  String Mobile = "";
  String Email = "";
  String NationalID ="";
  int Age = 0;
  Student(){}
  Student.fromJson(dynamic item):
    ID= item["ID"],
    Name= item["Name"],
    Age= item["Age"],
    NationalID= item["NationalID"],
    Mobile= item["Mobile"],
    Email= item["Email"];
}