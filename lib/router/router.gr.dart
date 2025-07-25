// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [HomeView]
class HomeViewRoute extends PageRouteInfo<void> {
  const HomeViewRoute({List<PageRouteInfo>? children})
    : super(HomeViewRoute.name, initialChildren: children);

  static const String name = 'HomeViewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeView();
    },
  );
}

/// generated route for
/// [LoginView]
class LoginViewRoute extends PageRouteInfo<LoginViewRouteArgs> {
  LoginViewRoute({
    Key? key,
    void Function()? onSuccess,
    List<PageRouteInfo>? children,
  }) : super(
         LoginViewRoute.name,
         args: LoginViewRouteArgs(key: key, onSuccess: onSuccess),
         initialChildren: children,
       );

  static const String name = 'LoginViewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginViewRouteArgs>(
        orElse: () => const LoginViewRouteArgs(),
      );
      return LoginView(key: args.key, onSuccess: args.onSuccess);
    },
  );
}

class LoginViewRouteArgs {
  const LoginViewRouteArgs({this.key, this.onSuccess});

  final Key? key;

  final void Function()? onSuccess;

  @override
  String toString() {
    return 'LoginViewRouteArgs{key: $key, onSuccess: $onSuccess}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LoginViewRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}

/// generated route for
/// [RegisterView]
class RegisterViewRoute extends PageRouteInfo<void> {
  const RegisterViewRoute({List<PageRouteInfo>? children})
    : super(RegisterViewRoute.name, initialChildren: children);

  static const String name = 'RegisterViewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RegisterView();
    },
  );
}
