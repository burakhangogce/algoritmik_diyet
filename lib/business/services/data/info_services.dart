import 'package:algoritmik_diyet/business/models/students/students_output_model.dart';
import 'package:algoritmik_diyet/business/services/general/algoritmik_service_base.dart';

import '../../../core/mixins/service_mixin.dart';
import '../../models/classes/classes_output_model.dart';

class InfoServices extends AlgoritmikServiceBase with ServiceMixin {
  InfoServices() {
    url = settingService.getRegisterUrl();
    path = 'info';
  }

  Future<List<ClassesOutputModel>> getClass() async {
    List map =
        await getMapAsync(getUri('myclass').toString(), createHeaders(), null);
    return map.map((job) => ClassesOutputModel.fromJson(job)).toList();
  }

  Future<List<StudentsOutputModel>> getStudentsClass(int id) async {
    List map = await getMapAsync(
        getUri('student/class/$id').toString(), createHeaders(), null);
    return List.from(map)
        .map((e) => StudentsOutputModel.fromJson(Map.from(e)))
        .toList();
  }

  Future<List<StudentsOutputModel>> getStudents() async {
    List map =
        await getMapAsync(getUri('student').toString(), createHeaders(), null);
    return List.from(map)
        .map((e) => StudentsOutputModel.fromJson(Map.from(e)))
        .toList();
  }
}
