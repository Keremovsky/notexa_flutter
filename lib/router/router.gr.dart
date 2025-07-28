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
class HomeViewRoute extends PageRouteInfo<HomeViewRouteArgs> {
  HomeViewRoute({
    Key? key,
    required List<WorkspaceListItemModel> workspaces,
    List<PageRouteInfo>? children,
  }) : super(
         HomeViewRoute.name,
         args: HomeViewRouteArgs(key: key, workspaces: workspaces),
         initialChildren: children,
       );

  static const String name = 'HomeViewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HomeViewRouteArgs>();
      return HomeView(key: args.key, workspaces: args.workspaces);
    },
  );
}

class HomeViewRouteArgs {
  const HomeViewRouteArgs({this.key, required this.workspaces});

  final Key? key;

  final List<WorkspaceListItemModel> workspaces;

  @override
  String toString() {
    return 'HomeViewRouteArgs{key: $key, workspaces: $workspaces}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! HomeViewRouteArgs) return false;
    return key == other.key &&
        const ListEquality().equals(workspaces, other.workspaces);
  }

  @override
  int get hashCode => key.hashCode ^ const ListEquality().hash(workspaces);
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
/// [ProfileView]
class ProfileViewRoute extends PageRouteInfo<void> {
  const ProfileViewRoute({List<PageRouteInfo>? children})
    : super(ProfileViewRoute.name, initialChildren: children);

  static const String name = 'ProfileViewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfileView();
    },
  );
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

/// generated route for
/// [SettingsView]
class SettingsViewRoute extends PageRouteInfo<SettingsViewRouteArgs> {
  SettingsViewRoute({Key? key, List<PageRouteInfo>? children})
    : super(
        SettingsViewRoute.name,
        args: SettingsViewRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'SettingsViewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SettingsViewRouteArgs>(
        orElse: () => const SettingsViewRouteArgs(),
      );
      return SettingsView(key: args.key);
    },
  );
}

class SettingsViewRouteArgs {
  const SettingsViewRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'SettingsViewRouteArgs{key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SettingsViewRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}

/// generated route for
/// [WorkspaceView]
class WorkspaceViewRoute extends PageRouteInfo<void> {
  const WorkspaceViewRoute({List<PageRouteInfo>? children})
    : super(WorkspaceViewRoute.name, initialChildren: children);

  static const String name = 'WorkspaceViewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const WorkspaceView();
    },
  );
}
