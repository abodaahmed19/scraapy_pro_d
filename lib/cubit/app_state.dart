abstract class AppState {}

class AppInitial extends AppState {}

class NavigationState extends AppState {
  final int selectedIndex;
  NavigationState(this.selectedIndex);
}
