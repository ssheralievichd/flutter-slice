import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../theme/theme_provider.dart';

class AppProviders {
  static final List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => ThemeProvider()),
  ];
}
