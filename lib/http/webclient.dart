
import 'package:http/http.dart';
import 'package:http_interceptor/http/intercepted_client.dart';

import 'interceptors/logging_inteceptor.dart';

final Client client = InterceptedClient.build(interceptors: [LoggingInterceptor()]);
const String baseUrl = 'http://192.168.1.64:8080/transactions';

