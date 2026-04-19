enum AppRoute {
  splash('/splash', 'splash'),
  login('/login', 'login');

  const AppRoute(this.path, this.routeName);

  final String path;
  final String routeName;
}
