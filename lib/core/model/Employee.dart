class Employee {
  String? employeeName;
  String? employeeNameArabic;
  String? employeeDepartment;
  String? employeeJobTitle;
  String? employeeJobPosition;
  String? employeeJoinDate;
  String? employeeBornDate;

  Employee({
    this.employeeName,
    this.employeeNameArabic,
    this.employeeDepartment,
    this.employeeJobTitle,
    this.employeeJobPosition,
    this.employeeJoinDate,
    this.employeeBornDate
  });


  Map<String, dynamic> toJson() => {
    'emp_name': employeeName,
    'emp_name_arabic': employeeNameArabic,
    'emp_dept': employeeDepartment,
    'emp_job_title': employeeJobTitle,
    'emp_job_position': employeeJobPosition,
    'emp_join_date': employeeJoinDate,
    'emp_born_date': employeeBornDate
  };

  factory Employee.fromJson(Map<String, dynamic> json){
    return Employee(
        employeeName: json[0]['emp_name'] as String,
        employeeNameArabic: json[0]['emp_name_arabic'] as String,
        employeeDepartment: json[0]['emp_dept'] as String,
        employeeJobTitle: json[0]['emp_job_title'] as String,
        employeeJobPosition: json[0]['emp_job_position'] as String,
        employeeJoinDate: json[0]['emp_join_date'] as String,
        employeeBornDate: json[0]['emp_born_date'] as String);
  }
}