import 'package:cross_connectivity/cross_connectivity.dart';
import 'package:flutter_mobile/core/constants/duration_constants.dart';

part 'i_connectivity_service.dart';

class ConnectivityService implements IConnectivityService {
  late Connectivity _connectivity;

  factory ConnectivityService() => _instance;
  static final ConnectivityService _instance = ConnectivityService._init();

  ConnectivityService._init() {
    _connectivity = Connectivity();
  }

  @override
  Future<bool> get isConnected async {
    return await _connectivity.checkConnection().timeout(DurationConstant.timeout);
  }
}
