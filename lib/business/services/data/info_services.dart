import 'package:algoritmik_diyet/business/models/students/students_output_model.dart';
import 'package:algoritmik_diyet/business/services/general/algoritmik_service_base.dart';

import '../../../core/mixins/service_mixin.dart';
import '../../models/classes/classes_output_model.dart';
import '../../models/response/response_model.dart';

class InfoServices extends AlgoritmikServiceBase with ServiceMixin {
  InfoServices() {
    url = settingService.getRegisterUrl();
    path = 'info';
  }

  Future<ResponseModel<List<ClassesOutputModel>>> getClass() async {
    ResponseModel<dynamic> response =
        await getMapAsync(getUri('myclass').toString(), createHeaders(), null);
    List saveMap = response.body!;
    if (response.isSuccess) {
      return response.toBody(
          saveMap.map((job) => ClassesOutputModel.fromJson(job)).toList());
    }
    return response.toBody(null);
  }

  Future<ResponseModel<List<StudentsOutputModel>>> getStudentsClass(
      int id) async {
    ResponseModel<dynamic> response = await getMapAsync(
        getUri('student/class/$id').toString(), createHeaders(), null);
    List saveMap = response.body!;
    if (response.isSuccess) {
      return response.toBody(
          saveMap.map((job) => StudentsOutputModel.fromJson(job)).toList());
    }
    return response.toBody(null);
  }

  Future<ResponseModel<List<StudentsOutputModel>>> getStudents() async {
    ResponseModel<dynamic> response =
        await getMapAsync(getUri('student').toString(), createHeaders(), null);
    List saveMap = response.body!;
    if (response.isSuccess) {
      return response.toBody(
          saveMap.map((job) => StudentsOutputModel.fromJson(job)).toList());
    }
    return response.toBody(null);
  }
}
