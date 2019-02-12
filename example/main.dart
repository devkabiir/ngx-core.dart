import 'package:angular/angular.dart';
import 'package:ngx_core/ngx_core.dart';

// ignore: uri_has_not_been_generated
import 'main.template.dart' as self;

/// The injector providing the top-level services.
@GenerateInjector([
  ValueProvider.forToken(configToken, <String, dynamic>{'name': 'Core library for AngularDart'}),
  ValueProvider.forToken(envToken, 'production')
])
final InjectorFactory injector = self.injector$Injector;

/// A component that demonstrates the usage of the [Configuration] service.
@Component(
  selector: 'configuration-demo',
  providers: [ngxProviders],
  template: '<div></div>'
)
class ConfigurationDemoComponent implements OnInit {

  /// Creates a new demo component.
  ConfigurationDemoComponent(this.config);

  /// The configuration service.
  final Configuration config;

  /// Method called after the first change-detection completed.
  @override
  void ngOnInit() {
    print(config.keys); // ["name"]
    print(config['name']); // "Core library for AngularDart"

    config['foo'] = 'bar';
    print(config.keys); // ["name", "foo"]
    print(config['foo']); // "bar"
  }
}
