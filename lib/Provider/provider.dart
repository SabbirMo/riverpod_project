
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/Api/api_services.dart';

final userDataProvider = FutureProvider((ref) async{
    return ref.read(userData).fatchData();
});