import 'package:app/providers/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/services/api_service.dart';
import 'package:app/models/employee.dart';

final employeeProvider =
    StateNotifierProvider<EmployeeNotifier, List<Employee>>((ref) {
  return EmployeeNotifier(ref.read);
});

class EmployeeNotifier extends StateNotifier<List<Employee>> {
  EmployeeNotifier(this.read) : super([]);
  final Reader read;

  Future<void> fetchEmployees() async {
    final response = await read(authProvider).getEmployees();
    state = (response.data as List).map((e) => Employee.fromJson(e)).toList();
  }

  Future<void> updateEmployee(String manpowerId, Employee employee) async {
    await read(authProvider).updateEmployee(manpowerId, employee.toJson());
    fetchEmployees();
  }

  // Future<void> downloadEmployeesCsv() async {
  //   await read(authProvider).downloadEmployeesCsv();
  // }
}
