part of 'connectivity_service.dart';

abstract interface class IConnectivityService {
  Future<bool> get isConnected;
}