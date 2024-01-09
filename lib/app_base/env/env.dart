import '../models/device_model.dart';
import 'env_type.dart';

class Env {
  final EnvType envType;
  final bool debug;
  final bool external;
  final int pageSize;
  final bool devicePreview;
  final String version;
  final String dateFormat;
  final String clientID;
  final String baseUrl;
  final String siteUrl;
  final String statementSyncTime;
  final bool localTimeZone;
  final int connectionTimeout;
  final int receiveTimeout;
  DeviceModel? device;
  Env({
    required this.envType,
    required this.debug,
    required this.external,
    required this.pageSize,
    required this.devicePreview,
    required this.version,
    required this.dateFormat,
    required this.clientID,
    required this.baseUrl,
    required this.siteUrl,
    required this.statementSyncTime,
    required this.localTimeZone,
    required this.connectionTimeout,
    required this.receiveTimeout,
    this.device,
  });

  factory Env.dev() {
    return Env(
      envType: EnvType.dev,
      debug: true,
      external: false,
      pageSize: 10,
      devicePreview: false,
      version: '0.0.1',
      dateFormat: 'HH:mm, MMM dd yyyy',
      clientID: '',
      baseUrl: 'https://jsonplaceholder.typicode.com/',
      siteUrl: 'https://jsonplaceholder.typicode.com/',
      statementSyncTime: "2021-01-01",
      localTimeZone: true,
      connectionTimeout: 10000,
      receiveTimeout: 10000,
    );
  }

  factory Env.prod() {
    return Env(
      envType: EnvType.production,
      debug: false,
      external: false,
      pageSize: 10,
      devicePreview: false,
      version: '0.0.1',
      dateFormat: 'HH:mm, MMM dd yyyy',
      clientID: '',
      baseUrl: 'https://jsonplaceholder.typicode.com/',
      siteUrl: 'https://jsonplaceholder.typicode.com/',
      statementSyncTime: "2021-01-01",
      localTimeZone: true,
      connectionTimeout: 10000,
      receiveTimeout: 10000,
    );
  }

  factory Env.staging() {
    return Env(
      envType: EnvType.staging,
      debug: true,
      external: false,
      devicePreview: false,
      pageSize: 10,
      version: '0.0.1',
      dateFormat: 'HH:mm, MMM dd yyyy',
      clientID: '',
      baseUrl: 'https://jsonplaceholder.typicode.com/',
      siteUrl: 'https://jsonplaceholder.typicode.com/',
      statementSyncTime: "2021-01-01",
      localTimeZone: true,
      connectionTimeout: 10000,
      receiveTimeout: 10000,
    );
  }
  // Future<void> setDevice() async {
  //   device = await DeviceUtils.loadDevice();
  // }

  // Future<void> setDeviceToken() async {
  //   final token = await DeviceUtils.getDeviceToken();
  //   device!.newToken = token;
  // }
}
